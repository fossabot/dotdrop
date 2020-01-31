# dotfiles
Opinionated configurations for this relatively new and under-educated power user

## Installation

**Note:** If you are on a completely new machine that does not have pip3 (or pip) do install python using your package manager first.

1. make sure to install [dependencies for dotdrop](https://github.com/deadc0de6/dotdrop/wiki/dependencies)
  clone repo
  ```shell
  git clone --recurse-submodules https://github.com/dotiful/dotdrop ~/dotfiles && cd ~/dotfiles
  ```
  
  and install `dotdrop` requirements
  ```shell
  pip3 install --user -r ./dotdrop/requirements.txt
  ```
2. assuming that you are still in the dotfiles directory, do
  ```shell
  ./dotdrop.sh install -p base
  ```

3. or use one line install
  ```shell
  git clone --recurse-submodules https://github.com/dotiful/dotdrop ~/dotfiles && cd ~/dotfiles && pip3 install --user -r ./dotdrop/requirements.txt
  ```

4. set zsh as a default shell
  ```shell
  grep -q $(which zsh) /etc/shells || echo $(which zsh) | sudo tee -a /etc/shells && chsh -s $(which zsh)
  ```

## Dotfiles Manager

I use `dotdrop` to manage my dotfiles across different machines.

Check out the tool at https://github.com/deadc0de6/dotdrop.

Update `dotdrop` submodule
```shell
git submodule update --init
```

### Extra
If you wish to save yourself the trouble of having to run `~/dotfiles/dotdrop.sh` every time, do
```shell
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

### shell

<details>
  <summary>zsh</summary>

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

