all:
	stow --adopt --verbose --target=$$HOME --restow */
delete:
	stow --verbose --target=$$HOME --delete */
