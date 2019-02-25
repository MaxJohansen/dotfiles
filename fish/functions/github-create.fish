function _get_current_repo_dir_name
  basename (command git rev-parse --show-toplevel 2>/dev/null) 2>/dev/null
  or basename (pwd)
end

function _color_word
  set_color $argv[1..-2]
  echo $argv[-1]
  set_color normal
end

function github-create -d "Create a repository on Github and upload your current repo to it"
  set -l options 'p/private' 'n/name='
  argparse -n $_ $options -- $argv
  or return

  if not command git rev-parse --show-toplevel > /dev/null 2>&1
    echo "This is not a git repository, you should create one with 'git init'"
    return 1
  end


  if set -q _flag_private
    set private "true"
    set private_str (_color_word "green" "private")
  else
    set private "false"
    set private_str (_color_word "red" "public")
  end

  set -q _flag_name
  and set -l repo_name (echo $_flag_name | sed -e 's/[^a-zA-Z0-9._-]/-/g')
  or set -l repo_name (_get_current_repo_dir_name)

  set -l github_user (git config github.user)
  set -l github_token (git config github.token)

  if [ -z "$github_user" ]
    echo "Could not find username, run 'git config --global github.user <username>'"
    set invalid_credentials
  end

  if [ -z "$github_token" ]
    echo "Could not find token, run 'git config --global github.token <token>'"
    set invalid_credentials
  end

  set -q invalid_credentials
  and return 1

  echo -ns "Creating " $private_str " repo " (_color_word --bold blue $repo_name) "... "

  set httpcode (curl --silent --output /dev/null --write-out "%{http_code}" -u $github_user:$github_token -d '{"name":"'"$repo_name"'", "private": '$private'}' https://api.github.com/user/repos)
  switch $httpcode
    case 201
      ;
    case 401
      echo (_color_word --bold red "✘")
      echo "Bad credentials: check username and token."
      return 1
    case 422
      echo (_color_word --bold red "✘")
      echo "Repository already exists at https://github.com/$github_user/$repo_name"
      return 1
    case '*'
      echo (_color_word --bold red "✘")
      echo "Unknown return code from Github API: $httpcode"
    return 1
  end
  echo (_color_word --bold green "✓")

  echo -n "Pushing local code to Github ... "
  git remote add origin git@github.com:$github_user/$repo_name.git > /dev/null 2>&1
  switch $status
    case 128
      echo (_color_word --bold red "✘")
      echo -n "This repo already has an origin remote! Renaming to old_origin and moving this repo to Github ... "
      git remote rename origin old_origin 2> /dev/null 2>&1
      git remote add origin git@github.com:$github_user/$repo_name.git 2> /dev/null 2>&1
  end
  git push -u origin master > /dev/null 2>&1
  echo (_color_word --bold green "✓")

  echo "New repository set up at https://github.com/$github_user/$repo_name"
  return 0
end
