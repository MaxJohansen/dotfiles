function extract -d "Expand or extract bundled & compressed files"
  set -l options 'h/help' 'r/remove'
  argparse -n $_ $options -- $argv
  or return

  if not set -q argv[1]
      or set -q _flag_help
    echo "
Usage: $_ [options] <file(s)>

Options:
-h, --help: Display this help
-r, --remove: Remove archive after extracting
"
    return 0
  end

  for file in $argv
    if not test -f $file
      echo "$file is not a valid file"
      continue
    end

    echo -s "Extracting: " (set_color --bold blue) $file (set_color normal)
    switch $file
      case '*.tar'
        tar -xf $file
      case '*.tar.xz' '*.txz'
        tar -Jxf $file
      case '*.tar.bz2' '*.tbz' '*.tbz2'
        tar -jxf $file
      case '*.tar.gz' '*.tgz'
        tar -zxf $file
      case '*.xz'
        unxz $file
      case '*.bz2'
        bunzip2 $file
      case '*.gz'
        gunzip $file
      case '*.rar'
        unrar x $file
      case '*.zip' '*.war' '*.jar' '*.sublime-package' '*.apk' '*.whl'
        set -l dirname (basename $file | sed 's/\.[^.]*$//')
        unzip -uo $file -d $dirname
      case '*.7z'
        7za x $file
      case '*.z'
        uncompress $file
      case '*'
        echo "Extension not recognized, cannot extract $file"
    end
    if test $status = 0
        and set -q _flag_remove
      echo -s "Removing " (set_color --dim red) $file (set_color normal)
      rm $file
    end
  end
end
