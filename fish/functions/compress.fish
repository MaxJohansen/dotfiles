function compress -d "Compress a file or directory via xz, with optional destination"
  set -l options 'h/help'
  argparse -n $_ $options -- $argv
  or return

  if not set -q argv[1]
      or set -q _flag_help
    echo "
Usage: $_ [archive name] <file(s)>

If a name is not given, one will be generated
from the name of the first file argument

Options:
-h, --help: Display this help
"
    return 0
  end

  set -l first (basename $argv[1] | sed 's/\.[^.]*$//')

  # If first argument does not exist we pop it off argv
  if not test -e $argv[1]
    set -e argv[1]
    if test (count $argv) = 0
      echo "Nothing to compress"
      return 1
    end
  end


  # Remember to update file extension if you switch compression tool
  # flag -> tool -> extension
  # -J -> xz -> .xz
  # -j -> bzip2 -> .bz
  # -z -> gzip -> .gz
  set -l flags -Jcvf # xz is pretty good, but slow
  set -l destination $first.tar.xz

  if test -e $destination
    echo -s "Will not overwrite existing file: " (set_color --bold red) $destination (set_color normal)
    return 1
  end

  echo -s "Compressing to " (set_color --bold blue) $destination (set_color normal)
  tar $flags $destination $argv > /dev/null; or begin
      echo -s "Failed to compress " (set_color --bold red) $destination (set_color normal)
      rm $destination
    end
end
