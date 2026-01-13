# Astraliskye's Dotfiles
The configs that power my flow.
## Retrieve a single file
This command will download the specified file into a direcitory named `dest_dir`. Omit `-P` and `dest_dir` path if you just want to download the file into the current working dir.

`wget https://api.github.com/repos/astraliskye/dotfiles/contents/path_to_file -P /path/to/dest_dir`
## Retriving a directory
This is less simple, so for now just clone the repo and move the folder to the desired location:
1. `git clone https://github.com/astraliskye/dotfiles`
2. `cp /path/to/dotfiles /path/to/destination` - e.g. `cp ./nvim ~/.config`
## Roadmap
- [ ] Covert each subdirectory into its own project for easier cloning
