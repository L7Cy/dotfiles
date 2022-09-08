function google
	set -l words (string join "+" $argv)
	cmd.exe /C start "https://google.com/search?q=$words"
end