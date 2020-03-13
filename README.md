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

Change default shell

**zsh**

```bash
grep -q $(which zsh) /etc/shells || echo $(which zsh) | sudo tee -a /etc/shells && chsh -s $(which zsh)
```

**bash**

```bash
grep -q $(which bash) /etc/shells || echo $(which bash) | sudo tee -a /etc/shells && chsh -s $(which bash)
```

## Misc

### Tutorials

<details>
  <summary>arch</summary>
  
  * Dolphin:
    - [adding an entry to the context menu](https://userbase.kde.org/Adding_an_entry_to_the_Create_New_menu)
    - [add custom items to the context menu](https://askubuntu.com/questions/719262/how-do-i-add-custom-items-to-the-context-menu-in-dolphin-in-kde-5/719757#719757)
    - [Recognized desktop entry keys](https://specifications.freedesktop.org/desktop-entry-spec/latest/ar01s06.html)
</details>


<details>
  <summary>shell</summary>

  * [Readline File](https://www.gnu.org/software/bash/manual/html_node/Readline-Init-File-Syntax.html)
  * [Git config reference](https://git-scm.com/docs/git-config)
  * [ZSH Keybindings](http://zshwiki.org/home/keybindings/)
</details>

<details>
  <summary>bash</summary>

  * [Bash Reference Manual](https://www.gnu.org/software/bash/manual/bash.html)
  * [Right align part of prompt](https://superuser.com/a/187483)
  * [Prompt Statement var iables](https://ss64.com/bash/syntax-prompt.html)
  * [Safer scripts with 'set -euxo pipefail'](https://vaneyckt.io/posts/safer_bash_scripts_with_set_euxo_pipefail/)
</details>

<details>
  <summary>ansi colors</summary>

  * [ANSI escape codes](http://www.lihaoyi.com/post/BuildyourownCommandLinewithANSIescapecodes.html)
  * [Colors and formatting](https://misc.flogisoft.com/bash/tip_colors_and_formatting)
  * [tput](http://linuxcommand.org/lc3_adv_tput.php)
  * [Colours and Cursor Movement With tput](https://www.tldp.org/HOWTO/Bash-Prompt-HOWTO/x405.html)
  * [fzf Web Color Picker](https://minsw.github.io/fzf-color-picker/)
</details>

### VS Code

<details>
  <summary>extension</summary>
  
  | &nbsp;                                                                                                                           | &nbsp;                                                                            |                                                                                                                                                                                                                                                                                                          |
  | -------------------------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
  | [alefragnani.Bookmarks](https://marketplace.visualstudio.com/items?itemName=alefragnani.Bookmarks)                               | [![install][install-logo]](vscode:extension/alefragnani.Bookmarks)                | [![VSCode Marketplace Rating](https://img.shields.io/visual-studio-marketplace/r/dotiful.dotfiles-syntax-highlighting?color=blue&label=marketplace&logo=visual-studio-code&logoColor=white&style=flat-square)](https://marketplace.visualstudio.com/items?itemName=alefragnani.Bookmarks)                |
  | [alefragnani.project-manager](https://marketplace.visualstudio.com/items?itemName=alefragnani.project-manager)                   | [![install][install-logo]](vscode:extension/alefragnani.project-manager)          | [![VSCode Marketplace Rating](https://img.shields.io/visual-studio-marketplace/r/dotiful.dotfiles-syntax-highlighting?color=blue&label=marketplace&logo=visual-studio-code&logoColor=white&style=flat-square)](https://marketplace.visualstudio.com/items?itemName=alefragnani.project-manager)          |
  | [baukeposthuma.monolite](https://marketplace.visualstudio.com/items?itemName=baukeposthuma.monolite)                             | [![install][install-logo]](vscode:extension/baukeposthuma.monolite)               | [![VSCode Marketplace Rating](https://img.shields.io/visual-studio-marketplace/r/dotiful.dotfiles-syntax-highlighting?color=blue&label=marketplace&logo=visual-studio-code&logoColor=white&style=flat-square)](https://marketplace.visualstudio.com/items?itemName=baukeposthuma.monolite)               |
  | [chrisdias.vscode-opennewinstance](https://marketplace.visualstudio.com/items?itemName=chrisdias.vscode-opennewinstance)         | [![install][install-logo]](vscode:extension/chrisdias.vscode-opennewinstance)     | [![VSCode Marketplace Rating](https://img.shields.io/visual-studio-marketplace/r/dotiful.dotfiles-syntax-highlighting?color=blue&label=marketplace&logo=visual-studio-code&logoColor=white&style=flat-square)](https://marketplace.visualstudio.com/items?itemName=chrisdias.vscode-opennewinstance)     |
  | [DavidWang.ini-for-vscode](https://marketplace.visualstudio.com/items?itemName=DavidWang.ini-for-vscode)                         | [![install][install-logo]](vscode:extension/DavidWang.ini-for-vscode)             | [![VSCode Marketplace Rating](https://img.shields.io/visual-studio-marketplace/r/dotiful.dotfiles-syntax-highlighting?color=blue&label=marketplace&logo=visual-studio-code&logoColor=white&style=flat-square)](https://marketplace.visualstudio.com/items?itemName=DavidWang.ini-for-vscode)             |
  | [dbankier.vscode-quick-select](https://marketplace.visualstudio.com/items?itemName=dbankier.vscode-quick-select)                 | [![install][install-logo]](vscode:extension/dbankier.vscode-quick-select)         | [![VSCode Marketplace Rating](https://img.shields.io/visual-studio-marketplace/r/dotiful.dotfiles-syntax-highlighting?color=blue&label=marketplace&logo=visual-studio-code&logoColor=white&style=flat-square)](https://marketplace.visualstudio.com/items?itemName=dbankier.vscode-quick-select)         |
  | [dkultasev.vs-code-snippet-generator](https://marketplace.visualstudio.com/items?itemName=dkultasev.vs-code-snippet-generator)   | [![install][install-logo]](vscode:extension/dkultasev.vs-code-snippet-generator)  | [![VSCode Marketplace Rating](https://img.shields.io/visual-studio-marketplace/r/dotiful.dotfiles-syntax-highlighting?color=blue&label=marketplace&logo=visual-studio-code&logoColor=white&style=flat-square)](https://marketplace.visualstudio.com/items?itemName=dkultasev.vs-code-snippet-generator)  |
  | [dotiful.dotfiles-syntax-highlighting](https://marketplace.visualstudio.com/items?itemName=dotiful.dotfiles-syntax-highlighting) | [![install][install-logo]](vscode:extension/dotiful.dotfiles-syntax-highlighting) | [![VSCode Marketplace Rating](https://img.shields.io/visual-studio-marketplace/r/dotiful.dotfiles-syntax-highlighting?color=blue&label=marketplace&logo=visual-studio-code&logoColor=white&style=flat-square)](https://marketplace.visualstudio.com/items?itemName=dotiful.dotfiles-syntax-highlighting) |
  | [EditorConfig.EditorConfig](https://marketplace.visualstudio.com/items?itemName=EditorConfig.EditorConfig)                       | [![install][install-logo]](vscode:extension/EditorConfig.EditorConfig)            | [![VSCode Marketplace Rating](https://img.shields.io/visual-studio-marketplace/r/dotiful.dotfiles-syntax-highlighting?color=blue&label=marketplace&logo=visual-studio-code&logoColor=white&style=flat-square)](https://marketplace.visualstudio.com/items?itemName=EditorConfig.EditorConfig)            |
  | [esbenp.prettier-vscode](https://marketplace.visualstudio.com/items?itemName=esbenp.prettier-vscode)                             | [![install][install-logo]](vscode:extension/esbenp.prettier-vscode)               | [![VSCode Marketplace Rating](https://img.shields.io/visual-studio-marketplace/r/dotiful.dotfiles-syntax-highlighting?color=blue&label=marketplace&logo=visual-studio-code&logoColor=white&style=flat-square)](https://marketplace.visualstudio.com/items?itemName=esbenp.prettier-vscode)               |
  | [evgeniypeshkov.syntax-highlighter](https://marketplace.visualstudio.com/items?itemName=evgeniypeshkov.syntax-highlighter)       | [![install][install-logo]](vscode:extension/evgeniypeshkov.syntax-highlighter)    | [![VSCode Marketplace Rating](https://img.shields.io/visual-studio-marketplace/r/dotiful.dotfiles-syntax-highlighting?color=blue&label=marketplace&logo=visual-studio-code&logoColor=white&style=flat-square)](https://marketplace.visualstudio.com/items?itemName=evgeniypeshkov.syntax-highlighter)    |
  | [foxundermoon.shell-format](https://marketplace.visualstudio.com/items?itemName=foxundermoon.shell-format)                       | [![install][install-logo]](vscode:extension/foxundermoon.shell-format)            | [![VSCode Marketplace Rating](https://img.shields.io/visual-studio-marketplace/r/dotiful.dotfiles-syntax-highlighting?color=blue&label=marketplace&logo=visual-studio-code&logoColor=white&style=flat-square)](https://marketplace.visualstudio.com/items?itemName=foxundermoon.shell-format)            |
  | [idleberg.applescript](https://marketplace.visualstudio.com/items?itemName=idleberg.applescript)                                 | [![install][install-logo]](vscode:extension/idleberg.applescript)                 | [![VSCode Marketplace Rating](https://img.shields.io/visual-studio-marketplace/r/dotiful.dotfiles-syntax-highlighting?color=blue&label=marketplace&logo=visual-studio-code&logoColor=white&style=flat-square)](https://marketplace.visualstudio.com/items?itemName=idleberg.applescript)                 |
  | [ionutvmi.path-autocomplete](https://marketplace.visualstudio.com/items?itemName=ionutvmi.path-autocomplete)                     | [![install][install-logo]](vscode:extension/ionutvmi.path-autocomplete)           | [![VSCode Marketplace Rating](https://img.shields.io/visual-studio-marketplace/r/dotiful.dotfiles-syntax-highlighting?color=blue&label=marketplace&logo=visual-studio-code&logoColor=white&style=flat-square)](https://marketplace.visualstudio.com/items?itemName=ionutvmi.path-autocomplete)           |
  | [ionutvmi.reg](https://marketplace.visualstudio.com/items?itemName=ionutvmi.reg)                                                 | [![install][install-logo]](vscode:extension/ionutvmi.reg)                         | [![VSCode Marketplace Rating](https://img.shields.io/visual-studio-marketplace/r/dotiful.dotfiles-syntax-highlighting?color=blue&label=marketplace&logo=visual-studio-code&logoColor=white&style=flat-square)](https://marketplace.visualstudio.com/items?itemName=ionutvmi.reg)                         |
  | [jakelucas.code-select-until](https://marketplace.visualstudio.com/items?itemName=jakelucas.code-select-until)                   | [![install][install-logo]](vscode:extension/jakelucas.code-select-until)          | [![VSCode Marketplace Rating](https://img.shields.io/visual-studio-marketplace/r/dotiful.dotfiles-syntax-highlighting?color=blue&label=marketplace&logo=visual-studio-code&logoColor=white&style=flat-square)](https://marketplace.visualstudio.com/items?itemName=jakelucas.code-select-until)          |
  | [jock.svg](https://marketplace.visualstudio.com/items?itemName=jock.svg)                                                         | [![install][install-logo]](vscode:extension/jock.svg)                             | [![VSCode Marketplace Rating](https://img.shields.io/visual-studio-marketplace/r/dotiful.dotfiles-syntax-highlighting?color=blue&label=marketplace&logo=visual-studio-code&logoColor=white&style=flat-square)](https://marketplace.visualstudio.com/items?itemName=jock.svg)                             |
  | [joelcancela.cfg-games-support](https://marketplace.visualstudio.com/items?itemName=joelcancela.cfg-games-support)               | [![install][install-logo]](vscode:extension/joelcancela.cfg-games-support)        | [![VSCode Marketplace Rating](https://img.shields.io/visual-studio-marketplace/r/dotiful.dotfiles-syntax-highlighting?color=blue&label=marketplace&logo=visual-studio-code&logoColor=white&style=flat-square)](https://marketplace.visualstudio.com/items?itemName=joelcancela.cfg-games-support)        |
  | [karyfoundation.comment](https://marketplace.visualstudio.com/items?itemName=karyfoundation.comment)                             | [![install][install-logo]](vscode:extension/karyfoundation.comment)               | [![VSCode Marketplace Rating](https://img.shields.io/visual-studio-marketplace/r/dotiful.dotfiles-syntax-highlighting?color=blue&label=marketplace&logo=visual-studio-code&logoColor=white&style=flat-square)](https://marketplace.visualstudio.com/items?itemName=karyfoundation.comment)               |
  | [ldez.ignore-files](https://marketplace.visualstudio.com/items?itemName=ldez.ignore-files)                                       | [![install][install-logo]](vscode:extension/ldez.ignore-files)                    | [![VSCode Marketplace Rating](https://img.shields.io/visual-studio-marketplace/r/dotiful.dotfiles-syntax-highlighting?color=blue&label=marketplace&logo=visual-studio-code&logoColor=white&style=flat-square)](https://marketplace.visualstudio.com/items?itemName=ldez.ignore-files)                    |
  | [liviuschera.noctis](https://marketplace.visualstudio.com/items?itemName=liviuschera.noctis)                                     | [![install][install-logo]](vscode:extension/liviuschera.noctis)                   | [![VSCode Marketplace Rating](https://img.shields.io/visual-studio-marketplace/r/dotiful.dotfiles-syntax-highlighting?color=blue&label=marketplace&logo=visual-studio-code&logoColor=white&style=flat-square)](https://marketplace.visualstudio.com/items?itemName=liviuschera.noctis)                   |
  | [mariusschulz.yarn-lock-syntax](https://marketplace.visualstudio.com/items?itemName=mariusschulz.yarn-lock-syntax)               | [![install][install-logo]](vscode:extension/mariusschulz.yarn-lock-syntax)        | [![VSCode Marketplace Rating](https://img.shields.io/visual-studio-marketplace/r/dotiful.dotfiles-syntax-highlighting?color=blue&label=marketplace&logo=visual-studio-code&logoColor=white&style=flat-square)](https://marketplace.visualstudio.com/items?itemName=mariusschulz.yarn-lock-syntax)        |
  | [naumovs.color-highlight](https://marketplace.visualstudio.com/items?itemName=naumovs.color-highlight)                           | [![install][install-logo]](vscode:extension/naumovs.color-highlight)              | [![VSCode Marketplace Rating](https://img.shields.io/visual-studio-marketplace/r/dotiful.dotfiles-syntax-highlighting?color=blue&label=marketplace&logo=visual-studio-code&logoColor=white&style=flat-square)](https://marketplace.visualstudio.com/items?itemName=naumovs.color-highlight)              |
  | [PKief.material-icon-theme](https://marketplace.visualstudio.com/items?itemName=PKief.material-icon-theme)                       | [![install][install-logo]](vscode:extension/PKief.material-icon-theme)            | [![VSCode Marketplace Rating](https://img.shields.io/visual-studio-marketplace/r/dotiful.dotfiles-syntax-highlighting?color=blue&label=marketplace&logo=visual-studio-code&logoColor=white&style=flat-square)](https://marketplace.visualstudio.com/items?itemName=PKief.material-icon-theme)            |
  | [rebornix.project-snippets](https://marketplace.visualstudio.com/items?itemName=rebornix.project-snippets)                       | [![install][install-logo]](vscode:extension/rebornix.project-snippets)            | [![VSCode Marketplace Rating](https://img.shields.io/visual-studio-marketplace/r/dotiful.dotfiles-syntax-highlighting?color=blue&label=marketplace&logo=visual-studio-code&logoColor=white&style=flat-square)](https://marketplace.visualstudio.com/items?itemName=rebornix.project-snippets)            |
  | [redhat.vscode-yaml](https://marketplace.visualstudio.com/items?itemName=redhat.vscode-yaml)                                     | [![install][install-logo]](vscode:extension/redhat.vscode-yaml)                   | [![VSCode Marketplace Rating](https://img.shields.io/visual-studio-marketplace/r/dotiful.dotfiles-syntax-highlighting?color=blue&label=marketplace&logo=visual-studio-code&logoColor=white&style=flat-square)](https://marketplace.visualstudio.com/items?itemName=redhat.vscode-yaml)                   |
  | [Remisa.shellman](https://marketplace.visualstudio.com/items?itemName=Remisa.shellman)                                           | [![install][install-logo]](vscode:extension/Remisa.shellman)                      | [![VSCode Marketplace Rating](https://img.shields.io/visual-studio-marketplace/r/dotiful.dotfiles-syntax-highlighting?color=blue&label=marketplace&logo=visual-studio-code&logoColor=white&style=flat-square)](https://marketplace.visualstudio.com/items?itemName=Remisa.shellman)                      |
  | [ritwickdey.LiveServer](https://marketplace.visualstudio.com/items?itemName=ritwickdey.LiveServer)                               | [![install][install-logo]](vscode:extension/ritwickdey.LiveServer)                | [![VSCode Marketplace Rating](https://img.shields.io/visual-studio-marketplace/r/dotiful.dotfiles-syntax-highlighting?color=blue&label=marketplace&logo=visual-studio-code&logoColor=white&style=flat-square)](https://marketplace.visualstudio.com/items?itemName=ritwickdey.LiveServer)                |
  | [Rubymaniac.vscode-paste-and-indent](https://marketplace.visualstudio.com/items?itemName=Rubymaniac.vscode-paste-and-indent)     | [![install][install-logo]](vscode:extension/Rubymaniac.vscode-paste-and-indent)   | [![VSCode Marketplace Rating](https://img.shields.io/visual-studio-marketplace/r/dotiful.dotfiles-syntax-highlighting?color=blue&label=marketplace&logo=visual-studio-code&logoColor=white&style=flat-square)](https://marketplace.visualstudio.com/items?itemName=Rubymaniac.vscode-paste-and-indent)   |
  | [ryuta46.multi-command](https://marketplace.visualstudio.com/items?itemName=ryuta46.multi-command)                               | [![install][install-logo]](vscode:extension/ryuta46.multi-command)                | [![VSCode Marketplace Rating](https://img.shields.io/visual-studio-marketplace/r/dotiful.dotfiles-syntax-highlighting?color=blue&label=marketplace&logo=visual-studio-code&logoColor=white&style=flat-square)](https://marketplace.visualstudio.com/items?itemName=ryuta46.multi-command)                |
  | [Shan.code-settings-sync](https://marketplace.visualstudio.com/items?itemName=Shan.code-settings-sync)                           | [![install][install-logo]](vscode:extension/Shan.code-settings-sync)              | [![VSCode Marketplace Rating](https://img.shields.io/visual-studio-marketplace/r/dotiful.dotfiles-syntax-highlighting?color=blue&label=marketplace&logo=visual-studio-code&logoColor=white&style=flat-square)](https://marketplace.visualstudio.com/items?itemName=Shan.code-settings-sync)              |
  | [sidneys1.gitconfig](https://marketplace.visualstudio.com/items?itemName=sidneys1.gitconfig)                                     | [![install][install-logo]](vscode:extension/sidneys1.gitconfig)                   | [![VSCode Marketplace Rating](https://img.shields.io/visual-studio-marketplace/r/dotiful.dotfiles-syntax-highlighting?color=blue&label=marketplace&logo=visual-studio-code&logoColor=white&style=flat-square)](https://marketplace.visualstudio.com/items?itemName=sidneys1.gitconfig)                   |
  | [sleistner.vscode-fileutils](https://marketplace.visualstudio.com/items?itemName=sleistner.vscode-fileutils)                     | [![install][install-logo]](vscode:extension/sleistner.vscode-fileutils)           | [![VSCode Marketplace Rating](https://img.shields.io/visual-studio-marketplace/r/dotiful.dotfiles-syntax-highlighting?color=blue&label=marketplace&logo=visual-studio-code&logoColor=white&style=flat-square)](https://marketplace.visualstudio.com/items?itemName=sleistner.vscode-fileutils)           |
  | [slevesque.vscode-autohotkey](https://marketplace.visualstudio.com/items?itemName=slevesque.vscode-autohotkey)                   | [![install][install-logo]](vscode:extension/slevesque.vscode-autohotkey)          | [![VSCode Marketplace Rating](https://img.shields.io/visual-studio-marketplace/r/dotiful.dotfiles-syntax-highlighting?color=blue&label=marketplace&logo=visual-studio-code&logoColor=white&style=flat-square)](https://marketplace.visualstudio.com/items?itemName=slevesque.vscode-autohotkey)          |
  | [svipas.control-snippets](https://marketplace.visualstudio.com/items?itemName=svipas.control-snippets)                           | [![install][install-logo]](vscode:extension/svipas.control-snippets)              | [![VSCode Marketplace Rating](https://img.shields.io/visual-studio-marketplace/r/dotiful.dotfiles-syntax-highlighting?color=blue&label=marketplace&logo=visual-studio-code&logoColor=white&style=flat-square)](https://marketplace.visualstudio.com/items?itemName=svipas.control-snippets)              |
  | [tommasov.hosts](https://marketplace.visualstudio.com/items?itemName=tommasov.hosts)                                             | [![install][install-logo]](vscode:extension/tommasov.hosts)                       | [![VSCode Marketplace Rating](https://img.shields.io/visual-studio-marketplace/r/dotiful.dotfiles-syntax-highlighting?color=blue&label=marketplace&logo=visual-studio-code&logoColor=white&style=flat-square)](https://marketplace.visualstudio.com/items?itemName=tommasov.hosts)                       |
  | [yo1dog.cursor-align](https://marketplace.visualstudio.com/items?itemName=yo1dog.cursor-align)                                   | [![install][install-logo]](vscode:extension/yo1dog.cursor-align)                  | [![VSCode Marketplace Rating](https://img.shields.io/visual-studio-marketplace/r/dotiful.dotfiles-syntax-highlighting?color=blue&label=marketplace&logo=visual-studio-code&logoColor=white&style=flat-square)](https://marketplace.visualstudio.com/items?itemName=yo1dog.cursor-align)                  |
  | [yzhang.markdown-all-in-one](https://marketplace.visualstudio.com/items?itemName=yzhang.markdown-all-in-one)                     | [![install][install-logo]](vscode:extension/yzhang.markdown-all-in-one)           | [![VSCode Marketplace Rating](https://img.shields.io/visual-studio-marketplace/r/dotiful.dotfiles-syntax-highlighting?color=blue&label=marketplace&logo=visual-studio-code&logoColor=white&style=flat-square)](https://marketplace.visualstudio.com/items?itemName=yzhang.markdown-all-in-one)           |

  [install-logo]: https://img.shields.io/badge/install-107c10.svg?labelColor=107c10&style=flat-square&logo=data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHZpZXdCb3g9IjAgMCA1MTIuMTcxIDUxMi4xNzEiPjxwYXRoIGZpbGw9IiNmZmYiIGQ9Ik00NzkuMDQ2IDI4My45MjVjLTEuNjY0LTMuOTg5LTUuNTQ3LTYuNTkyLTkuODU2LTYuNTkySDM1Mi4zMDVWMTAuNjY3QzM1Mi4zMDUgNC43NzkgMzQ3LjUyNiAwIDM0MS42MzggMEgxNzAuOTcxYy01Ljg4OCAwLTEwLjY2NyA0Ljc3OS0xMC42NjcgMTAuNjY3djI2Ni42NjdINDIuOTcxYTEwLjcwMiAxMC43MDIgMCAwMC05Ljg1NiA2LjU3MWMtMS42NDMgMy45ODktLjc0NyA4LjU3NiAyLjMwNCAxMS42MjdsMjEyLjggMjEzLjUwNGMyLjAwNSAyLjAwNSA0LjcxNSAzLjEzNiA3LjU1MiAzLjEzNnM1LjU0Ny0xLjEzMSA3LjU1Mi0zLjExNWwyMTMuNDE5LTIxMy41MDRhMTAuNjQ1IDEwLjY0NSAwIDAwMi4zMDQtMTEuNjI4eiIvPjwvc3ZnPg==

  <!-- [![VSCode Marketplace Rating](https://img.shields.io/visual-studio-marketplace/r/dotiful.dotfiles-syntax-highlighting?color=blue&label=marketplace&logo=visual-studio-code&logoColor=white&style=flat-square)](https://marketplace.visualstudio.com/items?itemName=dotiful.dotfiles-syntax-highlighting) -->

</details>

<details>
  <summary>custom colors</summary>

  **Minimus Colors**

  | Used for:                                                 | Hex Code                                                              |
  | --------------------------------------------------------- | ----------------------------------------------------------------------|
  | Strings                                                   | ![#70c27f](https://placehold.it/15/70c27f/000000?text=+) `#70c27f` |
  | Interpolated Strings                                      | ![#3f8d6c](https://placehold.it/15/3f8d6c/000000?text=+) `#3f8d6c` |
  | Comments                                                  | ![#5e7887](https://placehold.it/15/5e7887/000000?text=+) `#5e7887` |
  | Function Calls                                            | ![#3f848d](https://placehold.it/15/3f848d/000000?text=+) `#3f848d` |
  | Method Calls                                              | ![#72b7c0](https://placehold.it/15/72b7c0/000000?text=+) `#72b7c0` |
  | Code that needs to stand out                              | ![#5998c0](https://placehold.it/15/5998c0/000000?text=+) `#5998c0` |
  | Numbers & Booleans                                        | ![#7068B1](https://placehold.it/15/7068B1/000000?text=+) `#7068B1` |
  | Keywords & Operators                                      | ![#c88da2](https://placehold.it/15/c88da2/000000?text=+) `#c88da2` |
  | Function & Variable Declaration, Tags & `this`            | ![#c37455](https://placehold.it/15/c37455/000000?text=+) `#c37455` |
  | Object properties, ID selectors in CSS & Type annotations | ![#be856f](https://placehold.it/15/be856f/000000?text=+) `#be856f` |
  | Attributes, Constants                                     | ![#b0904f](https://placehold.it/15/b0904f/000000?text=+) `#b0904f` |
  | Variables & Parameters                                    | ![#d3b692](https://placehold.it/15/d3b692/000000?text=+) `#d3b692` |

</details>


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

