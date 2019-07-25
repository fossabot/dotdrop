# # ─── helpers ──────────────────────────────────────────────────────────────────

# turbo()    { zplugin ice                            "${@}"; }
# turbo0()   { zplugin ice wait"0a" lucid             "${@}"; }
# turbo1()   { zplugin ice wait"0b" lucid             "${@}"; }
# turbo2()   { zplugin ice wait"0c" lucid             "${@}"; }
# zload()    { zplugin load                           "${@}"; }
# zlight()   { zplugin light                          "${@}"; }
# zcommand() { zplugin ice wait"0b" lucid as"command" "${@}"; }
# zsnippet() { zplugin snippet                        "${@}"; }


# zt() { [ -z $2 ] && zplugin ice || zplugin ice wait"${1}" lucid "${@:2}"; } # Turbo
zt() { 
  if [ "$#" -ne 0 ] && [[ "${1[1]}" == [0-9] ]]; then
    zplugin ice wait"${1}" lucid "${@:2}"
  else
    zplugin ice "${@}"
  fi
}
ztt() { 
  if [ "$#" -ne 0 ] && [[ "${1[1]}" == [0-9] ]]; then
    echo zplugin ice wait"${1}" lucid "${@:2}"
  else
    echo zplugin ice "${@}"
  fi
}

z() { [ -z $2 ] && zplugin light "${@}" || zplugin "${@}"; }               # zplugin

# ─── prompt ───────────────────────────────────────────────────────────────────
# pure
zt pick"async.zsh" src"pure.zsh"; z sindresorhus/pure

# ──────────────────────────────────────────────────────────────────────────────

# additional completion definitions
# https://github.com/zsh-users/zsh-completions
# zt blockf atpull'zplugin creinstall -q .'; z zsh-users/zsh-completions
zt blockf; z zsh-users/zsh-completions

# autosuggestions
# https://github.com/zsh-users/zsh-autosuggestions
zt 0b compile'{src/*.zsh,src/strategies/*}' atload'_zsh_autosuggest_start' 
z zsh-users/zsh-autosuggestions
export ZSH_AUTOSUGGEST_USE_ASYNC=1
export ZSH_AUTOSUGGEST_MANUAL_REBIND=1

# fast-syntax-highlighting
# https://github.com/zdharma/fast-syntax-highlighting
zt 0c atinit'ZPLGM[COMPINIT_OPTS]=-C; _zpcompinit_fast; zpcdreplay'
z zdharma/fast-syntax-highlighting

# multi-word, syntax highlighted history searching
# https://github.com/zdharma/history-search-multi-word
# zstyle ":history-search-multi-word" page-size "11"
# zt 1a; 
# z load zdharma/history-search-multi-word

# zsh-history-substring-search
# https://github.com/zsh-users/zsh-history-substring-search
# zt 1a; 
z load zsh-users/zsh-history-substring-search

#
# ─── FZF ─────────────────────────────────────────────────────────────────────
#

# Install a fuzzy finder (fzf/fzy) and necessary completions and keybindings.
# https://github.com/junegunn/fzf-bin
zt from"gh-r" as"command"; z load junegunn/fzf-bin
# https://github.com/junegunn/fzf
zt as"command" pick"bin/fzf-tmux"; z load junegunn/fzf
# Create and bind multiple widgets using fzf
# zt 0b as"command" pick"bin/fzf-tmux" multisrc"shell/{completion,key-bindings}.zsh"
# z load junegunn/fzf
# zt multisrc"shell/{completion,key-bindings}.zsh" id-as"junegunn/fzf_completions" \
#   atclone"cp man/man1/fzf* $ZPFX/share/man/man1/" pick"/dev/null"
# z load junegunn/fzf

# fzf-marks, at slot 0, for quick Ctrl-G accessibility
# https://github.com/urbainvaes/fzf-marks
# zt has'fzf' trackbinds bindmap'^g -> ^f'; z load urbainvaes/fzf-marks

# ─── fuzzy movement and directory choosing ────────────────────────────────────
# autojump command
# https://github.com/rupa/z
zt 0c; z load rupa/z

# Pick from most frecent folders with `Ctrl+g`
# https://github.com/andrewferrier/fzf-z
zt 0b; z load andrewferrier/fzf-z

# lets z+[Tab] and zz+[Tab]
# https://github.com/changyuheng/fz
zt 0b; z load changyuheng/fz


#
# ─── GIT ─────────────────────────────────────────────────────────────────────
#

# fuzzy git
# https://github.com/wfxr/forgit
zt has'git'; z wfxr/forgit

# gitignore plugin – commands gii and gi
# zt 1b has'git' pick'init.zsh' atload'alias gi="git-ignore"' blockf
# z laggardkernel/git-ignore

# git-quick-stats
# zt 1b as"command" pick"$ZPFX/bin/git-quick-stats" atload"export _MENU_THEME=legacy" make"PREFIX=$ZPFX install"
# z load arzzen/git-quick-stats

#
# ─── PLUGINS ─────────────────────────────────────────────────────────────────
#

# zsh-autopair
# https://github.com/hlissner/zsh-autopair
zt 1c; z hlissner/zsh-autopair

# toggles "sudo" before the command by pressing [ESC][ESC]
# https://github.com/hcgraf/zsh-sudo
zt 1c; z hcgraf/zsh-sudo

# jump back to a specific directory
# https://github.com/Tarrasch/zsh-bd
zt 1c; z Tarrasch/zsh-bd

# : zt 0a blockf
# : z marzocchi/zsh-notify

#
# ─── UI ──────────────────────────────────────────────────────────────────────
#

# base16-shell
# https://github.com/chriskempson/base16-shell
z load chriskempson/base16-shell

# a collection of LS_COLORS definitions
# https://github.com/trapd00r/LS_COLORS
# on macOS, you might need to install coreutils from homebrew and use the
# g-prefix – gsed, gdircolors
zt pick"c.zsh" atclone"local PFX=${${(M)OSTYPE:#*darwin*}:+g}
            git reset --hard;
            \${PFX}sed -i '/DIR/c\DIR                   38;5;105;1' LS_COLORS; \
            \${PFX}sed -i '/LINK/c\LINK                 38;5;115' LS_COLORS; \
            \${PFX}dircolors -b LS_COLORS > c.zsh" atload'zstyle ":completion:*" list-colors “${(s.:.)LS_COLORS}”'\
            atpull'%atclone' nocompile'!'
z trapd00r/LS_COLORS

# a progress spinner
# https://github.com/psprint/revolver
zt as"command" pick"revolver"; z psprint/revolver

# highlight strings in the output
# https://github.com/paoloantinori/hhighlighter
zt pick"h.sh" atclone"sed -i.bk 's/h()/hl()/g' h.sh" atpull"%atclone" nocompile'!'
z paoloantinori/hhighlighter

# ansi escape codes
# https://github.com/fidian/ansi
zt as"command" pick"ansi"; z fidian/ansi

# vramsteg
# zt 2 has'cmake' as"command" pick"src/vramsteg" atclone'cmake .' atpull'%atclone' make
# z load psprint/vramsteg-zsh

# ─── unset helpers ────────────────────────────────────────────────────────────
unset -f z zt


# ──────────────────────────────────────────────────────────────────────────────

#region
# Assign each zsh session an unique ID, available in
# ZUID_ID and also a codename (ZUID_CODENAME)
# zplugin load zdharma/zsh-unique-id

# # zsh-startify, a vim-startify -like plugin
# zt "0b" atload"zsh-startify"; z load zdharma/zsh-startify

# zplugin ice wait"0c" lucid pick"c.zsh" atclone"local PFX=${${(M)OSTYPE:#*darwin*}:+g}
#             git reset --hard; \${PFX}sed -i \
#             '/DIR/c\DIR                   38;1;63;1' bliss.dircolors; \
#             \${PFX}dircolors -b bliss.dircolors > c.zsh" atload'zstyle ":completion:*" list-colors “${(s.:.)LS_COLORS}”' atpull'%atclone' nocompile'!'
# zplugin light joshjon/bliss-dircolors

# Zconvey shell integration plugin
# zt 0a silent; z load zdharma/zconvey

# Another load of the same plugin, to add zc-bg-notify to PATH
# zt 0a silent as"command" id-as"zconvey-cmd" pick"cmds/zc-bg-notify"; z load zdharma/zconvey

# zsh-editing-workbench & zsh-navigation-tools
# zplugin ice wait"1" lucid
# zplugin load psprint/zsh-editing-workbench
# zplugin ice wait"1" lucid
# zplugin load psprint/zsh-navigation-tools   # for n-history

# ZUI and Crasis
# zt 1a; z load zdharma/zui
# zplugin ice wait'[[ -n ${ZLAST_COMMANDS[(r)cras*]} ]]' lucid
# z load zdharma/zplugin-crasis

# # a powerful testing framework
# # https://github.com/psprint/zunit
# zt 2 as"command" pick"zunit" atclone"./build.zsh" atpull"%atclone"; z load psprint/zunit

# exa, a modern version of ‘ls’
# https://github.com/ogham/exa
# zt 2a from"gh-r" as'command' mv"exa* -> exa"; z load ogham/exa
# zt 2b as"completion" mv"exa* -> _exa"
# z snippet https://github.com/ogham/exa/blob/master/contrib/completions.zsh


#endregion