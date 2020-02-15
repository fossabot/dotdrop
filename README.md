# Usage

Opinionated configurations for this relatively new and under-educated power user

## Installation

If you are on a completely new machine that does not have pip3 do install [dotdrop dependencies](https://github.com/deadc0de6/dotdrop/wiki/dependencies) first

debian
```bash
sudo apt-get update -y && sudo apt-get install -y bash git zsh python3 python3-pip
```

arch
```bash
sudo pacman --noconfirm -Sy bash git zsh python python-pip
```


clone repo and cd to it

```bash
git clone --recurse-submodules https://github.com/dotiful/dotdrop ~/dotfiles && cd ~/dotfiles
```

install `dotdrop` requirements

```bash
pip3 install --user -r ./dotdrop/requirements.txt
```

install dotfiles with selected profile

```bash
./dotdrop.sh install -p base
```

or use one line install

```bash
git clone --recurse-submodules https://github.com/dotiful/dotdrop ~/dotfiles && cd ~/dotfiles && pip3 install --user -r ./dotdrop/requirements.txt && ./dotdrop.sh install -p base
```

Change default shell

**zsh**

```bash
grep -q $(which zsh) /etc/shells || echo $(which zsh) | sudo tee -a /etc/shells && chsh -s $(which zsh)
```

**bash**

```bash
grep -q $(which bash) /etc/shells || echo $(which bash) | sudo tee -a /etc/shells && chsh -s $(which bash)
```

## Dotfiles Manager

I use `dotdrop` to manage my dotfiles across different machines.

Check out the tool at https://github.com/deadc0de6/dotdrop.

Update `dotdrop` submodule

```bash
git submodule update --init
```

### Extra

If you wish to save yourself the trouble of having to run `~/dotfiles/dotdrop.sh` every time, do

```bash
ln -s ~/dotfiles/dotdrop.sh /usr/local/bin/dotdrop
```

---

## Installation Guide for packages

### macOS

Simply run `$HOME/dotfiles/install/mac-bootstrap.sh`

The installation will include [Homebrew](https://brew.sh), packages that and use
zsh as the default shell installed.

### archlinux

comming soon

---

## Tutorials

<details>
  <summary>shell</summary>

- [Git config reference](https://git-scm.com/docs/git-config)
- [ZSH Keybindings](http://zshwiki.org/home/keybindings/)
  </details>

<details>
  <summary>bash</summary>

- [Right align part of prompt](https://superuser.com/a/187483)
- [Prompt Statement var iables](https://ss64.com/bash/syntax-prompt.html)
  </details>

<details>
  <summary>ansi colors</summary>

- [ANSI escape codes](http://www.lihaoyi.com/post/BuildyourownCommandLinewithANSIescapecodes.html)
- [Colors and formatting](https://misc.flogisoft.com/bash/tip_colors_and_formatting)
- [tput](http://linuxcommand.org/lc3_adv_tput.php)
- [Colours and Cursor Movement With tput](https://www.tldp.org/HOWTO/Bash-Prompt-HOWTO/x405.html)
- [fzf Web Color Picker](https://minsw.github.io/fzf-color-picker/)
  </details>
