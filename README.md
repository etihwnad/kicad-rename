# kicad-rename

> Modified from original version: https://github.com/HarveyBates/kicad-rename-zsh

Rename KiCAD projects. Will handle files, directories and sub-directories. Skips `.zip` files.

This will handle components you have imported into your project if they are housed in the same directory as your `.kicad_pro` file and have used relative file imports.

## Installation

### Pre-requisites

Requires `rename` in your PATH from https://metacpan.org/dist/File-Rename


MacOS: install with [brew](https://brew.sh/) (rename directory pkg):

```bash
brew install rename
```

Debian / Ubuntu:

```bash
apt install rename
```


### Ready for use

You only need the Bash script `kicad-rename`.

Download and make the script executable

```bash
chmod +x kicad-rename
```

## Usage

```bash
cd <your/kicad/project/>
kicad-rename -p previous_name -n new_name
```

## Help

```bash
kicad-rename - Rename kicad project and directories.
 
kicad-rename  -p old_name -n new_name
 
options:
-h                      Show help information.
-p      (required)      Previous KiCAD project name.
-n      (required)      New KiCAD project name.
```

## Theory of operation

https://docs.kicad.org/8.0/en/kicad/kicad.html#kicad_files_and_folders

Project
- `*.kicad_pro`

Schematic
- `*.kicad_sch`
- `*.kicad_sym`
- `sym-lib-table`

Board
- `*.kicad_pcb` - board design file
- `*.pretty/` - footprint library (a folder)
- `*.kicad_mod` - footprint file
- `*.kicad_dru` - custom design rules
- `fp-lib-table` - footprint libraries known in the board editor

Common
- `*.kicad_prl` - local settings
- `*.kicad_wks` - Page description (border and title block)


It is not sufficient to simple rename the file names from a file manager.
KiCad embeds the file name prefix (before the `.kicad_XYZ` extension) inside
the PCB and Schematic in several places.
Also, for example, this name shows up in exported STEP files of the 3D view of
the board.

This tool first searches for and replaces all instances of "Old Name"
(including spaces) and replaces it with "New Name" within all files.
Then it proceeds to rename the file names themselves using the `rename`
utility.

CAUTION: This tool blindly string-replaces "Old Name" inside files.  This has a
potential to cause file format corruption if "Old Name" is not unique and shows
up in other places inside the files.

