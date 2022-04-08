# Handle $0 according to the standard:
# https://zdharma-continuum.github.io/Zsh-100-Commits-Club/Zsh-Plugin-Standard.html
0="${${ZERO:-${0:#$ZSH_ARGZERO}}:-${(%):-%N}}"
0="${${(M)0:#/*}:-$PWD/$0}"

source ${0:h}/tctx-prompt.zsh

function tctx_current_context {
  local TCTX_PROMPT=$(get_tctx_prompt)

  if [[ -n "$TCTX_PROMPT" ]]; then
    if [[ -n "$ZSH_TCTX_PROMPT_BACKGROUND" ]]; then
      RPROMPT="%{$BG[$ZSH_TCTX_PROMPT_BACKGROUND]%}$TCTX_PROMPT%{$reset_color%}"
    else
      RPROMPT="$TCTX_PROMPT%{$reset_color%}"
    fi
  fi
}

autoload -U add-zsh-hook
add-zsh-hook precmd tctx_current_context

