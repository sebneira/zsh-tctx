# Defines the tctx prompt
# Make your style changes here ;)

ZSH_TCTX_PROMPT_BACKGROUND="${ZSH_TCTX_PROMPT_BACKGROUND:-}"
ZSH_TCTX_PROMPT_PREFIX="${ZSH_TCTX_PROMPT_PREFIX:-tctx}"
ZSH_TCTX_PROMPT_PREFIX_FOREGROUND="${ZSH_TCTX_PROMPT_PREFIX_FOREGROUND:-255}"
ZSH_TCTX_PROMPT_PROD_FOREGROUND="${ZSH_TCTX_PROMPT_PROD_FOREGROUND:-009}"
ZSH_TCTX_PROMPT_DEFAULT_FOREGROUND="${ZSH_TCTX_PROMPT_DEFAULT_FOREGROUND:-005}"

function tctx_context_name {
  tctx ls | grep active | cut -d " " -f1
}

function get_tctx_prompt {
  local context_name=$(tctx_context_name)

  if [[ -n "$context_name" ]]; then
    local TCTX_PROMPT=''
    TCTX_PREFIX="%{$FG[$ZSH_TCTX_PROMPT_PREFIX_FOREGROUND]%}$ZSH_TCTX_PROMPT_PREFIX"
    if [[ "$context_name" == *"prod"* ]]; then
      TCTX_PROMPT+="%{$FG[$ZSH_TCTX_PROMPT_PROD_FOREGROUND]%}$context_name"
    else
      TCTX_PROMPT="%{$FG[$ZSH_TCTX_PROMPT_DEFAULT_FOREGROUND]%}$context_name"
    fi
    echo "$TCTX_PREFIX $TCTX_PROMPT"
  fi
}

