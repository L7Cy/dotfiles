function open
  cmd.exe /c start (wslpath -w $argv[1])
end
