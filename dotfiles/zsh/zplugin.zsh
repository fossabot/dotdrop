#!/usr/bin/env zsh
# vim:syntax=sh
# vim:filetype=sh

#
# ─── PROMPT ───────────────────────────────────────────────────────────────────
#

# ─── pure ─────────────────────────────────────────────────────────────────────
zplugin ice lucid pick"async.zsh" src"pure.zsh"
zplugin light sindresorhus/pure

#
# ─── FZF ──────────────────────────────────────────────────────────────────────
#

# Install `fzf` binary and tmux helper script
zplugin ice from"gh-r" as'command'
zplugin light junegunn/fzf-bin

zplugin ice as'command' pick"bin/fzf-tmux"
zplugin light junegunn/fzf

# Create and bind multiple widgets using fzf
zplugin ice wait'0a' lucid id-as"junegunn/fzf_completions" pick"/dev/null" multisrc"shell/{completion,key-bindings}.zsh"
zplugin light junegunn/fzf

# fzf-marks, at slot 0, for quick Ctrl-G accessibility
# https://github.com/urbainvaes/fzf-marks
# zt has'fzf' bindmap'^g -> ^f'; zplugin load urbainvaes/fzf-marks
zplugin ice trackbinds bindmap'^g -> ^f' lucid
zplugin light urbainvaes/fzf-marks

# ─── fuzzy movement and directory choosing ────────────────────────────────────
# autojump command
# https://github.com/rupa/z
zplugin ice wait'0c' lucid
zplugin light rupa/z
# zplugin load agkozak/zsh-z
# zplugin light skywind3000/z.lua

# Pick from most frecent folders with `Ctrl+g`
# https://github.com/andrewferrier/fzf-z
: zplugin ice wait'0b' lucid
: zplugin load andrewferrier/fzf-z

# lets z+[Tab] and zz+[Tab]
# https://github.com/changyuheng/fz
zplugin ice wait'0b' lucid
zplugin light changyuheng/fz

# Like `z` command, but opens a file in vim based on frecency
: zplugin wait'0b' as'command' pick"v"
: zplugin light rupa/v

# interactive-cd
# https://github.com/changyuheng/zsh-interactive-cd
: zplugin light changyuheng/zsh-interactive-cd

#
# ─── GIT ─────────────────────────────────────────────────────────────────────
#

# fuzzy git
# https://github.com/wfxr/forgit
zplugin ice has'fzf'
zplugin light wfxr/forgit

# gitignore plugin – commands gii and gi
: zplugin ice wait'1b' has'git' pick'init.zsh' atload'alias gi="git-ignore"' blockf
: zplugin light laggardkernel/git-ignore

# git-quick-stats
: zplugin ice wait'1b' as"command" pick"$ZPFX/bin/git-quick-stats" atload"export _MENU_THEME=legacy" make"PREFIX=$ZPFX install"
: zplugin load arzzen/git-quick-stats

#
# ─── PLUGINS ─────────────────────────────────────────────────────────────────
#

# auto-ls
# https://github.com/desyncr/auto-ls
zplugin ice wait'0' lucid
zplugin light desyncr/auto-ls

# zsh-fast-alias-tips
# https://github.com/sei40kr/zsh-fast-alias-tips
zplugin ice has'go' make'!'
zplugin light sei40kr/zsh-fast-alias-tips

# zsh-autopair
# https://github.com/hlissner/zsh-autopair
zplugin ice wait'1b' lucid
zplugin light hlissner/zsh-autopair

# toggles "sudo" before the command by pressing [ESC][ESC]
# https://github.com/hcgraf/zsh-sudo
zplugin ice wait'1b' lucid
zplugin light hcgraf/zsh-sudo

# jump back to a specific directory
# https://github.com/Tarrasch/zsh-bd
zplugin ice wait'1b' lucid
zplugin light Tarrasch/zsh-bd

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
# zplugin ice cloneonly
zplugin ice atclone="[ ! -f ~/base16-theme ] && ln -s $ZPLGM[PLUGINS_DIR]/chriskempson---base16-shell/scripts/base16-default-dark.sh ~/.base16_theme"
zplugin light chriskempson/base16-shell

# a progress spinner
# https://github.com/psprint/revolver
# zt 2c as"command" pick"revolver" atclone'cp revolver.zsh-completion $ZPLGM[COMPLETIONS_DIR]/_revolver' atpull'%atclone'
: zplugin ice as"command" pick"revolver"
: zplugin light psprint/revolver

# highlight strings in the output
# https://github.com/paoloantinori/hhighlighter
: zplugin ice pick"h.sh" atclone"sed -i.bk 's/h()/hl()/g' h.sh" atpull"%atclone" nocompile'!'
: zplugin light paoloantinori/hhighlighter

# ansi escape codes
# https://github.com/fidian/ansi
zplugin ice as"command" pick"ansi"
zplugin light fidian/ansi

# vramsteg
# zt 2 has'cmake' as"command" pick"src/vramsteg" atclone'cmake .' atpull'%atclone' make
# zplugin load psprint/vramsteg-zsh


#
# ─── IMPORTANT ───────────────────────────────────────────────────────────────
#

# additional completion definitions
# https://github.com/zsh-users/zsh-completions
# zt 0a blockf atpull'zplugin creinstall -q .'; z zsh-users/zsh-completions
zplugin ice blockf
zplugin light zsh-users/zsh-completions

# fast-syntax-highlighting
# https://github.com/zdharma/fast-syntax-highlighting
# (compinit without `-i` spawns warning on `sudo -s`)
zplugin ice wait'0a' lucid atinit"ZPLGM[COMPINIT_OPTS]='-i' _zpcompinit_fast; zpcdreplay"
zplugin light zdharma/fast-syntax-highlighting

# zsh-history-substring-search
# https://github.com/zsh-users/zsh-history-substring-search
zplugin light zsh-users/zsh-history-substring-search

# multi-word, syntax highlighted history searching
# https://github.com/zdharma/history-search-multi-word
zplugin ice wait'1a' lucid trackbinds bindmap'^R -> ^S'
zplugin light zdharma/history-search-multi-word

# autosuggestions
# https://github.com/zsh-users/zsh-autosuggestions
# Note: should go _after_ syntax highlighting plugin
zplugin ice wait'0a' lucid atload'_zsh_autosuggest_start' compile'{src/*.zsh,src/strategies/*}'
zplugin light zsh-users/zsh-autosuggestions


# ──────────────────────────────────────────────────────────────────────────────

# Semigraphical .zshrc editor for Zplugin commands
# https://github.com/zdharma/zplugin-crasis
zplugin ice wait"1" lucid
zplugin load zdharma/zui
zplugin ice wait'[[ -n ${ZLAST_COMMANDS[(r)cras*]} ]]' lucid
zplugin light zdharma/zplugin-crasis

# ──────────────────────────────────────────────────────────────────────────────



# a collection of LS_COLORS definitions
# https://github.com/trapd00r/LS_COLORS
# on macOS, you might need to install coreutils from homebrew and use the
# g-prefix – gsed, gdircolors
: zplugin ice pick"c.zsh" atclone"local PFX=${${(M)OSTYPE:#*darwin*}:+g}
            git reset --hard;
            \${PFX}sed -i '/DIR/c\DIR                   38;5;105;1' LS_COLORS; \
            \${PFX}sed -i '/LINK/c\LINK                 38;5;115' LS_COLORS; \
            \${PFX}dircolors -b LS_COLORS > c.zsh" atpull'%atclone' nocompile'!'
: zplugin light trapd00r/LS_COLORS

