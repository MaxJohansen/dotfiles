#!/bin/bash

# Take a screenshot:
scrot /tmp/screen.png

# Create a blur on the shot:
convert /tmp/screen.png -scale 10% -scale 1000% /tmp/screen.png

# Lock it up!
i3lock -f -e                    \
    --image=/tmp/screen.png     \
    --linecolor=00000000        \
    --keyhlcolor=88c0d0ff       \
    --bshlcolor=d8dee9ff        \
    --separatorcolor=00000000   \
    --radius=300                \
    \
    --insidevercolor=00000000   \
    --insidewrongcolor=00000000 \
    --insidecolor=00000000      \
    \
    --ringcolor=5e81acff        \
    --ringvercolor=a3be8cff     \
    --ringwrongcolor=bf616aff   \
    \
    --clock                     \
    --timecolor=eceff4ff        \
    --timestr="%H:%M"           \
    --timesize=128              \
    \
    --datecolor=d8dee9ff        \
    --datestr="%A, %d %B"       \
    --datesize=32               \
    --datepos="tx:650"          \
    \
    --veriftext="Verifying..."  \
    --verifcolor=d8dee9ff       \
    --verifsize=48              \
    \
    --wrongtext="Incorrect"     \
    --wrongcolor=d8dee9ff       \
    --wrongsize=48              \
    \
    --indicator                 \
    --color=2e3440

# If still locked after 20 seconds, turn off screen.
sleep 20 && pgrep i3lock && xset dpms force off
