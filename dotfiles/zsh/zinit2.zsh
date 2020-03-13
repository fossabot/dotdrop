#!/usr/bin/env zsh
# vim:syntax=sh
# vim:filetype=sh

#
# ─── PROGRAMS ───────────────────────────────────────────────────────────────────
# region

# junegunn/fzf-bin
zinit ice from"gh-r" as"program"
zinit light junegunn/fzf-bin

# sharkdp/fd
zinit ice as"command" from"gh-r" mv"fd* -> fd" pick"fd/fd"
zinit light sharkdp/fd

# sharkdp/bat
zinit ice as"command" from"gh-r" mv"bat* -> bat" pick"bat/bat"
zinit light sharkdp/bat

# ogham/exa, replacement for ls
zinit ice as"program" from"gh-r" mv"exa* -> exa" pick"exa/exa"
zinit light ogham/exa

zinit ice as"program" from"gh-r" pick"pet/pet"
zinit light pet/releases

# endregion


#
# ─── THEMES ─────────────────────────────────────────────────────────────────────
# region

zinit ice pick"async.zsh" src"pure.zsh"
zinit light sindresorhus/pure

# zinit ice wait'!' lucid nocompletions \
#          compile"{zinc_functions/*,segments/*,zinc.zsh}" \
#          atload'!prompt_zinc_setup; prompt_zinc_precmd'
# zinit load robobenklein/zinc

# # ZINC git info is already async, but if you want it
# # even faster with gitstatus in Turbo mode:
# # https://github.com/romkatv/gitstatus
# zinit ice wait'1' atload'zinc_optional_depenency_loaded'
# zinit load romkatv/gitstatus

# endregion
