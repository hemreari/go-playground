# go-playground

**go-playground** is customized version of [grafov's go-playground](https://github.com/grafov/go-playground). go-playground tries to bring functionality of offical playground to Emacs like running little test cases, what-ifs and ability save those snippet on your local machine. <br>
If you have any question about anything open an issue, I'd like to help.

## Installation
- Clone hemreari/go-playground repository to your local machine.
- Copy go-playground.el file to your Emacs load-path.<br>
  - To learn where is the location of your Emacs load-path look for these line in your init file: <br>
  `(add-to-list 'load-path "<some-path>")`
  - Otherwise refer to [Load Path](https://www.emacswiki.org/emacs/LoadPath).
- Add these line to your Emacs init file: <br>
`(require 'go-playground)`
- If you want to assign a keybinding(`Ctrl+c Ctrl+p)` to `M-x go-playground`, also add this line to your init file: <br>
`(global-set-key (kbd "C-c C-p") 'go-playground)`
- Finally type `M-x eval-buffer return` and save the init file.

## Usage
- If you assigned a keybinding in the Installation part type `C-c C-p`, this must create a new buffer called `snippet.go`
- If you haven't assigned a keybinding type `M-x go-playground`, this must create a new buffer called `snippet.go`
- To compile your code type `C-return`, and you can see your compilation result in the new buffer.
- To save your work, just save as usual. Your saved work is under the `~/go/src/playground/<timestamp>` as default.
  - You can change this directory by changing contents of `go-playground-basedir` variable.

## Changes
- Removed `go-playground-download` function
- Removed `go-playground-upload` function
- Removed `go-playground-rm` function
- Fixed a bug that causes compilation failure due to filename naming differences on Windows [issue#10 on grafov's go-playground](https://github.com/grafov/go-playground/issues/10)

## Referecences
[grafov's go-playground](https://github.com/grafov/go-playground)


