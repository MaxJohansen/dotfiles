function upload -d "Transfer a file through filepush.co"
  set -l options 'h/help'
  argparse -n $_ $options -- $argv
  or return

  if not set -q argv[1]
      or set -q _flag_help
    echo "
Usage: $_ <file>

Uploads the given file to filepush.co and returns a link.
The link is copied to your clipboard if possible.
"
    return 0
  end

  set -l file $argv[1]
  set -l basefile (basename $file | sed -e 's/[^a-zA-Z0-9._-]/-/g');
  console_info "Uploading $file to filepush.co"
  set -l url (curl --progress-bar --upload-file $file https://filepush.co/upload/$basefile)
  if functions -q clip
    echo $url | clip
  else
    echo $url
  end
end
