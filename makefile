all:
	stow --adopt --verbose --target=$$HOME --restow */
delete:
	stow --verbose --target=$$HOME --delete */
win:
	stow --verbose --target=$$HOME --restow lazygit nvim ssh tmux zsh
deleteWin:
	stow --verbose --target=$$HOME --delete lazygit nvim ssh tmux zsh
