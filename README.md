# Purpose
Use this repo to manage my config files

# How to use
1. Create the folders to hold these config files, in my case, it's `~/fast/dotfiles`
2. For each of the config file that want to manage using git, you can run 
  `python moveDotFileInHomeAndCreateSymoblicLink.py FILE_PATH` 
   (if only a simple file name is given, the filepath would be defaulted to the home folder)
   It will move the file into the config file forder, and put an symbolic link in its origin place. 

# TODO
- Currently the user need to handle the .bashrc file themselves (by sourcing this file in their .bashrc).
  Consider using script to auto-add the sourcing part, and don't add if it already exists in the `.bashrc`
  folder.
