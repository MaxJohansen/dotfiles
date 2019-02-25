function upgrade -d "Upgrade system components"
  set -l components (string trim $argv[1]);
  set -l components (string lower $components);

  if test -z $components
    console_debug "Default to all components"
    set components "all"
  end

  console_debug "Running: $components"

  if begin contains "all" $components; or contains "system" $components; end
    if which pacman > /dev/null
      console_info "Upgrading packages with pacman"
      sudo pacman -Syu
    end
  end

  if begin contains "all" $components; or contains "python" $components; end
    console_info "Upgrading Python pip"
    pip install --upgrade --user pip six
  end

  if begin contains "all" $components; or contains "fish" $components; end
    console_info "Upgrading fisher"
    fisher self-update
  end
end
