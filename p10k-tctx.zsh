# Specific prompt for powerline 10k

# Handle $0 according to the standard:
# https://zdharma-continuum.github.io/Zsh-100-Commits-Club/Zsh-Plugin-Standard.html
0="${${ZERO:-${0:#$ZSH_ARGZERO}}:-${(%):-%N}}"
0="${${(M)0:#/*}:-$PWD/$0}"

source ${0:h}/tctx-prompt.zsh

function prompt_tctx() {
  TCTX_PROMPT=$(get_tctx_prompt)
  if [[ -n "$TCTX_PROMPT" ]]; then
    p10k segment -t "$TCTX_PROMPT" 
  fi
}
