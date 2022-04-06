# Defines the tctx prompt
# Make your style changes here ;)

ZSH_TCTX_PROMPT_PREFIX="${ZSH_TCTX_PROMPT_PREFIX:-Ƭ}"
ZSH_TCTX_PROMPT_PREFIX_STYLE="${ZSH_TCTX_PROMPT_PREFIX_STYLE:-$FG[255]}"
ZSH_TCTX_PROMPT_PROD_STYLE="${ZSH_TCTX_PROMPT_PROD_STYLE:-$FG[009]}"
ZSH_TCTX_PROMPT_DEFAULT_STYLE="${ZSH_TCTX_PROMPT_DEFAULT_STYLE:-$FG[005]}"

function tctx_context_name {
  tctx ls | grep active | cut -d " " -f1
}

function get_tctx_prompt {
  local context_name=$(tctx_context_name)

  if [[ -n "$context_name" ]]; then
    local TCTX_PROMPT=''
    TCTX_PREFIX="%{$ZSH_TCTX_PROMPT_PREFIX_STYLE%}$ZSH_TCTX_PROMPT_PREFIX%{$reset_color%}"
    if [[ "$context_name" == *"prod"* ]]; then
      TCTX_PROMPT+="%{$ZSH_TCTX_PROMPT_PROD_STYLE%}$context_name%{$reset_color%}"
    else
      TCTX_PROMPT="%{$ZSH_TCTX_PROMPT_DEFAULT_STYLE%}$context_name%{$reset_color%}"
    fi
    echo "$TCTX_PREFIX $TCTX_PROMPT"
  fi
}

