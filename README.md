# kicad-rename-zsh
Rename KiCAD projects. Will handle files, directories and sub-directories. Skips `.zip` files.

This will handle components you have imported into your project if they are housed in the same 
directory as your `.kicad_pro` file and have used relative file imports.

## Installation
Requires [brew](https://brew.sh/) (rename directory pkg):
```bash
brew install rename
```

```bash
git clone https://github.com/HarveyBates/kicad-rename-zsh
cd kicad-rename-zsh
chmod -x kicad-rename.sh
pwd # Copy this into next line
echo 'alias kicad-rename="<PASTE_HERE>/kicad-rename.sh"' >> ~/.zshrc
source ~/.zshrc
```

## Usage
```bash
cd <your/kicad/project/>
kicad-rename -p previous_name -n new_name
```

## Help
```bash
kicad-rename - Rename kicad project and directories.
 
kicad-rename [options] application [arguements]
 
options:
-h                      Show help information.
-p      (required)      Previous KiCAD project name.
-n      (required)      New KiCAD project name.
```
