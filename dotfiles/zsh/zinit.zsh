#!/usr/bin/env zsh
# vim:syntax=sh
# vim:filetype=sh

#
# ─── PROMPT ───────────────────────────────────────────────────────────────────
#

# ─── pure ─────────────────────────────────────────────────────────────────────
# zinit ice lucid src"zsh/zygal.zsh"
# zinit light davla/zygal

# # ─── pure ─────────────────────────────────────────────────────────────────────
# zinit ice lucid pick"async.zsh" src"pure.zsh"
# zinit light sindresorhus/pure


# ─── starship ─────────────────────────────────────────────────────────────────
# https://starship.rs/config
zinit ice lucid as"program" from"gh-r" mv"starship* -> starship" \
  bpick"*unknown-linux-gnu.tar.gz" atload"eval \"\$(starship init zsh)\""
zinit light starship/starship

#
# ─── SNIPPETS ─────────────────────────────────────────────────────────────────
#

# ─── clipboard ────────────────────────────────────────────────────────────────
zinit ice wait lucid
zinit snippet OMZ::lib/clipboard.zsh

# pet - snippet manager
# https://github.com/knqyf263/pet
# zinit ice as"program" from"gh-r" pick"pet/pet" bpick"*linux_amd64.tar.gz"
# zinit light knqyf263/pet

# navi - interactive cheatsheet tool
# https://github.com/denisidoro/navi
# navi.plugin.zsh
# zinit ice lucid as"program" from"gh-r" atload"source <(navi widget zsh)"
# zinit ice lucid as"program" from"gh-r" atload"source <(navi widget zsh)"
# zinit ice as"program" from"gh-r" nocompile'!' \
#   trackbinds bindmap'^g -> ^n' \
#   pick"c.zsh" atpull"%atclone" atclone"navi widget zsh > c.zsh"
# zinit light denisidoro/navi

# zsh-expand-all
# https://github.com/simnalamburt/zsh-expand-all
# zinit light simnalamburt/zsh-expand-all


#
# ─── FZF ──────────────────────────────────────────────────────────────────────
#

# Install `fzf` binary and tmux helper script
zinit ice from"gh-r" as'command'
zinit light junegunn/fzf-bin

zinit ice as'command' pick"bin/fzf-tmux"
zinit light junegunn/fzf

# Create and bind multiple widgets using fzf
zinit ice wait'0a' lucid id-as"junegunn/fzf_completions" pick"/dev/null" \
  multisrc"shell/{completion,key-bindings}.zsh"
zinit light junegunn/fzf

# fzf-marks, at slot 0, for quick Ctrl-G accessibility
# https://github.com/urbainvaes/fzf-marks
# zt has'fzf' bindmap'^g -> ^f'; zinit load urbainvaes/fzf-marks
# zinit ice trackbinds bindmap'^g -> ^f' lucid
# zinit light urbainvaes/fzf-marks

# ─── fuzzy movement and directory choosing ────────────────────────────────────
# autojump command
# https://github.com/rupa/z
zinit ice wait'0c' lucid
zinit light rupa/z
# zinit load agkozak/zsh-z
# zinit light skywind3000/z.lua

# Pick from most frecent folders with `Ctrl+g`
# https://github.com/andrewferrier/fzf-z
# zinit ice wait'0b' lucid
# zinit load andrewferrier/fzf-z

# lets z+[Tab] and zz+[Tab]
# https://github.com/changyuheng/fz
zinit ice wait'0b' lucid
zinit light changyuheng/fz

# Like `z` command, but opens a file in vim based on frecency
# zinit wait'0b' as'command' pick"v"
# zinit light rupa/v

# interactive-cd
# https://github.com/changyuheng/zsh-interactive-cd
# zinit light changyuheng/zsh-interactive-cd

#
# ─── GIT ─────────────────────────────────────────────────────────────────────
#

# git-now
# https://github.com/iwata/git-now
zinit ice wait"!0" lucid as"program" pick"{git-now,git-now-add,git-now-rebase,gitnow-common,gitnow-shFlags}"
zinit light "iwata/git-now"

# git-delta
# https://github.com/dandavison/delta
zinit ice wait"1b" lucid as"program" from"gh-r" mv"delta* -> delta" pick"delta/delta"
zinit light "dandavison/delta"

# diff-so-fancy
# https://github.com/so-fancy/diff-so-fancy
zinit ice wait"1b" lucid as"program" pick"bin/git-dsf"
zinit light zdharma/zsh-diff-so-fancy

# fuzzy git
# https://github.com/wfxr/forgit
zinit ice has'fzf'
zinit light wfxr/forgit

# gitignore plugin – commands gii and gi
# zinit ice wait'1b' has'git' pick'init.zsh' atload'alias gi="git-ignore"' blockf
# zinit light laggardkernel/git-ignore

# git-quick-stats
# zinit ice wait'1b' as"command" pick"$ZPFX/bin/git-quick-stats" atload"export _MENU_THEME=legacy" make"PREFIX=$ZPFX install"
# zinit load arzzen/git-quick-stats

#
# ─── PLUGINS ─────────────────────────────────────────────────────────────────
#

# sharkdp/fd
zinit ice as"command" from"gh-r" mv"fd* -> fd" pick"fd/fd"
zinit light sharkdp/fd

# sharkdp/bat
zinit ice as"command" from"gh-r" mv"bat* -> bat" pick"bat/bat" atclone"bat cache -b"
zinit light sharkdp/bat

# ogham/exa
# https://github.com/ogham/exa
zinit ice as"program" from"gh-r" mv"exa* -> exa"
zinit light ogham/exa

# # All of the above using the for-syntax and also z-a-bin-gem-node annex
# zinit wait"1" lucid from"gh-r" as"null" for \
#      sbin"**/fd"        @sharkdp/fd \
#      sbin"**/bat"       @sharkdp/bat \
#      sbin"exa* -> exa"  ogham/exa

# ────────────────────────────────────────────────────────────────────────────────

# clears previous command output
# https://github.com/Valiev/almostontop
# zinit ice wait"1c" lucid
# zinit light Valiev/almostontop

# auto-ls
# https://github.com/desyncr/auto-ls
zinit ice wait'0' lucid
zinit light desyncr/auto-ls

# zsh-fast-alias-tips
# https://github.com/sei40kr/zsh-fast-alias-tips
zinit ice from'gh-r' as'program'
zinit light sei40kr/zsh-fast-alias-tips

# zsh-autopair
# https://github.com/hlissner/zsh-autopair
zinit ice wait'1b' lucid
zinit light hlissner/zsh-autopair

# toggles "sudo" before the command by pressing [ESC][ESC]
# https://github.com/hcgraf/zsh-sudo
zinit ice wait'1b' lucid
zinit light hcgraf/zsh-sudo

# jump back to a specific directory
# https://github.com/Tarrasch/zsh-bd
zinit ice wait'1b' lucid
zinit light Tarrasch/zsh-bd

# automatically generates completion functions from getopt-style help texts
# https://github.com/RobSis/zsh-completion-generator
zstyle :plugin:zsh-completion-generator programs ''
export GENCOMPL_FPATH="$ZINIT[COMPLETIONS_DIR]"
zinit ice wait'1b' lucid
zinit light RobSis/zsh-completion-generator

# completion daemon
# https://github.com/dim-an/cod
# zinit ice wait'2a' has'go' as"command" atclone'make .' atpull'%atclone' make \
#   atload"source <(cod init $$ zsh)"
# zinit light dim-an/cod


# : zt 0a blockf
# : z marzocchi/zsh-notify

#
# ─── UI ──────────────────────────────────────────────────────────────────────
#

# base16-shell
# https://github.com/chriskempson/base16-shell
# zinit ice cloneonly
# zinit ice atclone="[ ! -f ~/base16-theme ] && ln -s $ZINIT[PLUGINS_DIR]/chriskempson---base16-shell/scripts/base16-default-dark.sh ~/.base16_theme"
# zinit light chriskempson/base16-shell

# a progress spinner
# https://github.com/psprint/revolver
# zt 2c as"command" pick"revolver" atclone'cp revolver.zsh-completion $ZINIT[COMPLETIONS_DIR]/_revolver' atpull'%atclone'
# zinit ice as"command" pick"revolver"
# zinit light psprint/revolver

# highlight strings in the output
# https://github.com/paoloantinori/hhighlighter
# zinit ice pick"h.sh" atclone"sed -i.bk 's/h()/hl()/g' h.sh" atpull"%atclone" nocompile'!'
# zinit light paoloantinori/hhighlighter

# ansi escape codes
# https://github.com/fidian/ansi
zinit ice as"command" pick"ansi"
zinit light fidian/ansi

# vramsteg
# https://github.com/psprint/vramsteg-zsh
# zt 2 has'cmake' as"command" pick"src/vramsteg" atclone'cmake .' atpull'%atclone' make
# zinit load psprint/vramsteg-zsh


#
# ─── IMPORTANT ───────────────────────────────────────────────────────────────
#

# additional completion definitions
# https://github.com/zsh-users/zsh-completions
# zt 0a blockf atpull'zinit creinstall -q .'; z zsh-users/zsh-completions
zinit ice blockf
zinit light zsh-users/zsh-completions

zinit ice as"completion"
zinit snippet https://github.com/deadc0de6/dotdrop/blob/master/completion/_dotdrop.sh-completion.zsh

# fast-syntax-highlighting
# https://github.com/zdharma/fast-syntax-highlighting
# (compinit without `-i` spawns warning on `sudo -s`)
zinit ice wait'0a' lucid atinit"ZINIT[COMPINIT_OPTS]='-i' _zpcompinit_fast; zpcdreplay"
zinit light zdharma/fast-syntax-highlighting

# zsh-history-substring-search
# https://github.com/zsh-users/zsh-history-substring-search
zinit light zsh-users/zsh-history-substring-search

# multi-word, syntax highlighted history searching
# https://github.com/zdharma/history-search-multi-word
zinit ice wait'1a' lucid trackbinds bindmap'^R -> ^S'
zinit light zdharma/history-search-multi-word

# autosuggestions
# https://github.com/zsh-users/zsh-autosuggestions
# Note: should go _after_ syntax highlighting plugin
zinit ice wait'0a' lucid atload'_zsh_autosuggest_start' compile'{src/*.zsh,src/strategies/*}'
zinit light zsh-users/zsh-autosuggestions


# ──────────────────────────────────────────────────────────────────────────────

# zshell user interface library
# https://github.com/zdharma/zui
# zinit ice wait"1" lucid
# zinit load zdharma/zui

# curses consolette for Zsh-Zinit plugin manager
# https://github.com/zinit-zsh/zinit-console
# zinit wait lucid for zinit-zsh/zinit-console

# Semigraphical .zshrc editor for zinit commands
# https://github.com/zdharma/zplugin-crasis
# zinit ice wait'[[ -n ${ZLAST_COMMANDS[(r)cras*]} ]]' lucid
# zinit light zdharma/zplugin-crasis

# ──────────────────────────────────────────────────────────────────────────────


# a collection of LS_COLORS definitions
# https://github.com/trapd00r/LS_COLORS
# on macOS, you might need to install coreutils from homebrew and use the
# g-prefix – gsed, gdircolors
# zinit ice pick"c.zsh" atclone"local PFX=${${(M)OSTYPE:#*darwin*}:+g}
#             git reset --hard;
#             \${PFX}sed -i '/DIR/c\DIR                   38;5;105;1' LS_COLORS; \
#             \${PFX}sed -i '/LINK/c\LINK                 38;5;115' LS_COLORS; \
#             \${PFX}dircolors -b LS_COLORS > c.zsh" atpull'%atclone' nocompile'!'
# zinit light trapd00r/LS_COLORS
