# quick aliases
alias gst "git status"
alias .. "cd .."
alias ... "cd ../.."
alias .... "cd ../../.."
alias ..... "cd ../../../.."

# language
set -gx LC_ALL en_US.UTF-8
set -gx LANG en_US.UTF-8
set -gx LANGUAGE en_US.UTF-8

# editors and pager options
set -gx VISUAL code
set -gx EDITOR $VISUAL
set -gx PAGER bat
set -gx BAT_THEME TwoDark
set -gx SSH_KEY_PATH $HOME/.ssh/rsa_id
set -gx N_PREFIX $HOME/.n
set -gx GOPATH $HOME/.go

# Less flags:
#  F - Quit if one screen
#  R - Raw control chars (for color)
#  E - Quit at EOF
#  S - Chop long lines
#  X - No termcap init, prevents clearing of screen before starting less
set -gx LESS FRESX

# path
set -gx PATH /usr/local/bin /usr/bin /usr/sbin /bin /sbin
set -a PATH $HOME/.local/bin
set -a PATH $HOME/.cargo/bin
set -a PATH $HOME/.dotnet/tools
set -a PATH $N_PREFIX/bin
set -a PATH $GOPATH/bin

# dotnet root required for some dotnet tools
set -gx DOTNET_ROOT /opt/dotnet/

# lovely nord colors
set nord0 2e3440
set nord1 3b4252
set nord2 434c5e
set nord3 4c566a
set nord4 d8dee9
set nord5 e5e9f0
set nord6 eceff4
set nord7 8fbcbb
set nord8 88c0d0
set nord9 81a1c1
set nord10 5e81ac
set nord11 bf616a
set nord12 d08770
set nord13 ebcb8b
set nord14 a3be8c
set nord15 b48ead

set fish_color_normal $nord4
set fish_color_command $nord9
set fish_color_quote $nord14
set fish_color_redirection $nord9
set fish_color_end $nord6
set fish_color_error $nord11
set fish_color_param $nord4
set fish_color_comment $nord3
set fish_color_match $nord8
set fish_color_search_match $nord8
set fish_color_operator $nord9
set fish_color_escape $nord13
set fish_color_cwd $nord8
set fish_color_autosuggestion $nord6
set fish_color_user $nord4
set fish_color_host $nord9
set fish_color_cancel $nord15
set fish_pager_color_prefix $nord13
set fish_pager_color_completion $nord6
set fish_pager_color_description $nord10
set fish_pager_color_progress $nord12
set fish_pager_color_secondary $nord1
