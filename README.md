## Usage

Opinionated configurations for this relatively new and under-educated power user

## Installation

<details>
  <summary>dotdrop dependencies</summary>
  
  If you are on a completely new machine that does not have pip3 do install [dotdrop dependencies](https://github.com/deadc0de6/dotdrop/wiki/dependencies) first

  ```bash
  sudo apt-get update -y && sudo apt-get install -y bash git zsh python3 python3-pip
  ```

  arch

  ```bash
  sudo pacman --noconfirm -Sy bash git zsh python python-pip
  ```
</details>




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

<details>
  <summary>Change default shell</summary>

  **zsh**

  ```bash
  grep -q $(which zsh) /etc/shells || echo $(which zsh) | sudo tee -a /etc/shells && chsh -s $(which zsh)
  ```

  **bash**

  ```bash
  grep -q $(which bash) /etc/shells || echo $(which bash) | sudo tee -a /etc/shells && chsh -s $(which bash)
  ```
</details>

## Dotfiles Manager

> I use `dotdrop` to manage my dotfiles across different machines <br/>
> Check out the tool at https://github.com/deadc0de6/dotdrop

Update `dotdrop` submodule

```bash
git submodule update --init --recursive
git submodule update --remote dotdrop
```

### Extra

If you wish to save yourself the trouble of having to run `~/dotfiles/dotdrop.sh` every time, do

```bash
ln -s ~/dotfiles/dotdrop.sh /usr/local/bin/dotdrop
```

## Misc

 * [Links](./docs/links.md)
 * [VS Code extensions](./docs/vscode.md)
