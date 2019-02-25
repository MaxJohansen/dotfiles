function unclip -d "Paste from clipboard to stdout"
  xclip -selection clipboard -o
end
