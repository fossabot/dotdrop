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

---

#### Extra
If you wish to save yourself the trouble of having to run `~/dotfiles/dotdrop.sh` every time, do
```shell
ln -s ~/dotfiles/dotdrop.sh ~/.bin/dotdrop
```
and be sure to add `$HOME/.bin` to your `.bash_profile` (for bash) or `.zshenv` (for zsh).

---

## Installation Guide for packages (and applications)

### macOS

Simply run `$HOME/dotfiles/install/mac-bootstrap.sh`

The installation will include [Homebrew](https://brew.sh) and some packages that I use (please see `./install/brewPackages.txt`) and use 
zsh as the default shell, with [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh) installed.
  
### antergos-base & archlinux

Since I use [auracle](https://aur.archlinux.org/packages/auracle-git/), and I did not manually track packages that I have installed via it, 
they are, unfortunately, mixed into the list that I have (or shall) generated using [pacman](https://wiki.archlinux.org/index.php/Pacman). 
Please install packages via pacman as you would normally do, and just cherry-pick those that throws errors, and then install them via 
your favorite AUR package manager.

<sub><sup>Although, if you're not me and using Arch, you wouldn't want my dotfiles anyway :P</sup></sub>

---

### Possibly Relevant Links

1. [Why did you switch to Antergos/Arch Linux?](https://japorized.gitlab.io/technical/2018/02/27/making-the-move-to-linux.html)
