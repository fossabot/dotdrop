# ─── helpers ──────────────────────────────────────────────────────────────────

zt() {
  if [ "$#" -ne 0 ] && [[ "${1[1]}" == [0-9] ]]; then
    zplugin ice wait"${1}" lucid "${@:2}"
  else
    zplugin ice "${@}"
  fi
}
z() { [ -z $2 ] && zplugin light "${@}" || zplugin "${@}"; }
# ──────────────────────────────────────────────────────────────────────────────

# ─── dotdrop ──────────────────────────────────────────────────────────────────

# zt as"command" src"completion/_dotdrop-completion.zsh" \
#   pick"dotdrop.sh" atclone"pip3 install -r requirements.txt --user"
# z deadc0de6/dotdrop

#
# ─── PROMPT ───────────────────────────────────────────────────────────────────
#

# ─── pure ─────────────────────────────────────────────────────────────────────
zt pick"async.zsh" src"pure.zsh"; z load sindresorhus/pure

#
# ─── FZF ──────────────────────────────────────────────────────────────────────
#

# Install `fzf` binary and tmux helper script
zt as'command' from"gh-r";         z junegunn/fzf-bin
zt as'command' pick"bin/fzf-tmux"; z junegunn/fzf
# Create and bind multiple widgets using fzf
zt 0a multisrc"shell/{completion,key-bindings}.zsh" \
  id-as"junegunn/fzf_completions" pick"/dev/null"
z junegunn/fzf

# fzf-marks, at slot 0, for quick Ctrl-G accessibility
# https://github.com/urbainvaes/fzf-marks
# zt has'fzf' bindmap'^g -> ^f'; z load urbainvaes/fzf-marks

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

# Like `z` command, but opens a file in vim based on frecency
# zt 0b as'command' pick"v"; z load rupa/v

#
# ─── GIT ─────────────────────────────────────────────────────────────────────
#

# fuzzy git
# https://github.com/wfxr/forgit
zt has'fzf'; z wfxr/forgit

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
zt 1b; z hlissner/zsh-autopair

# toggles "sudo" before the command by pressing [ESC][ESC]
# https://github.com/hcgraf/zsh-sudo
zt 1b; z hcgraf/zsh-sudo

# jump back to a specific directory
# https://github.com/Tarrasch/zsh-bd
zt 1b; z Tarrasch/zsh-bd

# automatically generates completion functions from getopt-style help texts
# https://github.com/RobSis/zsh-completion-generator
# zstyle :plugin:zsh-completion-generator programs ''
# export GENCOMPL_FPATH="$ZPLGM[COMPLETIONS_DIR]"
# zt 2a; z RobSis/zsh-completion-generator

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
            \${PFX}dircolors -b LS_COLORS > c.zsh" atload'zstyle ":completion:*" list-colors “${(s.:.)LS_COLORS}”' \
            atpull'%atclone' nocompile'!'
z trapd00r/LS_COLORS

# a progress spinner
# https://github.com/psprint/revolver
# zt 2c as"command" pick"revolver" atclone'cp revolver.zsh-completion $ZPLGM[COMPLETIONS_DIR]/_revolver' atpull'%atclone'
zt as"command" pick"revolver"; z psprint/revolver

# highlight strings in the output
# https://github.com/paoloantinori/hhighlighter
zt pick"h.sh" atclone"sed -i.bk 's/h()/hl()/g' h.sh" atpull"%atclone" nocompile'!'
z paoloantinori/hhighlighter

# ansi escape codes
# https://github.com/fidian/ansi
zt as"command" pick"ansi"; z fidian/ansi

# zt 2b atclone"gencomp k; ZPLGM[COMPINIT_OPTS]='-i' zpcompinit" atpull'%atclone'
# z load supercrabtree/k

# vramsteg
# zt 2 has'cmake' as"command" pick"src/vramsteg" atclone'cmake .' atpull'%atclone' make
# z load psprint/vramsteg-zsh


#
# ─── IMPORTANT ───────────────────────────────────────────────────────────────
#

# additional completion definitions
# https://github.com/zsh-users/zsh-completions
# zt 0a blockf atpull'zplugin creinstall -q .'; z zsh-users/zsh-completions
zt blockf; z zsh-users/zsh-completions

# fast-syntax-highlighting
# https://github.com/zdharma/fast-syntax-highlighting
# (compinit without `-i` spawns warning on `sudo -s`)
zt 0a atinit"ZPLGM[COMPINIT_OPTS]='-i' _zpcompinit_fast; zpcdreplay"
z zdharma/fast-syntax-highlighting

# autosuggestions
# https://github.com/zsh-users/zsh-autosuggestions
# Note: should go _after_ syntax highlighting plugin
zt 0a compile'{src/*.zsh,src/strategies/*}' atload'_zsh_autosuggest_start'
z zsh-users/zsh-autosuggestions
export ZSH_AUTOSUGGEST_USE_ASYNC=1
export ZSH_AUTOSUGGEST_MANUAL_REBIND=1

# zsh-history-substring-search
# https://github.com/zsh-users/zsh-history-substring-search
z zsh-users/zsh-history-substring-search

# multi-word, syntax highlighted history searching
# https://github.com/zdharma/history-search-multi-word
zstyle ":history-search-multi-word" page-size "50"
zt 1a trackbinds bindmap'^R -> ^S'; z load zdharma/history-search-multi-word

# ─── unset helpers ────────────────────────────────────────────────────────────
unset -f zt
unset -f z
