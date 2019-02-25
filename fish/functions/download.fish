function download -d "Download file from a specified URL"
  set -l options 'h/help'
  argparse -n $_ $options -- $argv
  or return

  if not set -q argv[1]
      or set -q _flag_help
    echo "
Usage: $_ <url> [to]

Downloads a file from the given URL. If destination is supplied,
the last part of the URL is used to create the file in the current directory.
"
    return 0
  end

  set remote_file $argv[1]

  set -q argv[2]
  and set local_file $argv[2]
  or set local_file (basename $remote_file)

  curl -fsSL1 -o $local_file $remote_file
end
