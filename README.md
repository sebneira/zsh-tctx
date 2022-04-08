# zsh-tctx

Prompt for zsh that displays the current [tctx](https://github.com/jlegrone/tctx) context.

- [Examples](#examples)
- [Installation](#installation)
  - [Oh My Zsh](#oh-my-zsh)
  - [Powerlevel10k](#powerlevel10k)
  - [Manual](#manual-git-clone)
- [Customization](#customization)

### Examples

**zsh's robbyrussell theme**

![right prompt](docs/robyrussell-prompt.png)

**p10k theme**

![p10k staging](docs/p10k-staging.png)<br/>
![p10k prod](docs/p10k-prod.png)

## Installation

### Oh My Zsh

This will add the tctx context to the right of your prompt.

1. Clone this repository into `$ZSH_CUSTOM/plugins` (by default `~/.oh-my-zsh/custom/plugins`)

    ```sh
    git clone https://github.com/sikian/zsh-tctx ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-tctx
    ```

2. Add the plugin to the list of plugins for Oh My Zsh to load (inside `~/.zshrc`):

    ```sh
    plugins=( 
        # other plugins...
        zsh-tctx
    )
    ```

3. Start a new terminal session.

### Powerlevel10k

If you're using [powerlevel10k](https://github.com/romkatv/powerlevel10k)
(highly recommended!), you can extend it with the tctx prompt as follows.

1. Clone this repository 

    ```sh
    git clone https://github.com/sikian/zsh-tctx ~/.zsh/zsh-tctx
    ```

2. Add the prompt to your `~/.p10k.zsh`. 
 
    a. Add `tctx` to whichever `PROMPT_ELEMENTS` you prefer. Example:
    ```sh
    typeset -g POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(
      # =========================[ Line #1 ]=========================
      os_icon
      dir
      vcs
      tctx                    # tctx prompt!
      # =========================[ Line #2 ]=========================
      newline
      prompt_char
    )
    ```
 
    b. Search for `POWERLEVEL9K_EXAMPLE_BACKGROUND` and source `$HOME/.zsh/zsh-tctx/p10k-tctx.zsh` after:
    ```sh
    ...
    typeset -g POWERLEVEL9K_EXAMPLE_BACKGROUND=1

    # Source tctx prompt function
    source $HOME/.zsh/zsh-tctx/p10k-tctx.zsh
    ...
    ```

3. Start a new terminal session.

### Manual (Git Clone)

1. Clone this repository somewhere on your machine. This guide will assume `~/.zsh/zsh-tctx`.

    ```sh
    git clone https://github.com/sikian/zsh-tctx ~/.zsh/zsh-tctx
    ```

2. Add the following to your `.zshrc`:

    ```sh
    source ~/.zsh/zsh-tctx/zsh-tctx.zsh
    ```

3. Start a new terminal session.

## Customization

If you'd rather have other colours, you can either change the source code or
just change the following env vars in your `~/.profile` or `~/.zshrc` to whatever suits you best:

```sh
export ZSH_TCTX_PROMPT_BACKGROUND=
export ZSH_TCTX_PROMPT_PREFIX=
export ZSH_TCTX_PROMPT_PREFIX_FOREGROUND=
export ZSH_TCTX_PROMPT_PROD_FOREGROUND=
export ZSH_TCTX_PROMPT_DEFAULT_FOREGROUND=
```

For a list of colors, run in your terminal:
```sh
for i in {0..255}; do print -Pn "%K{$i}  %k%F{$i}${(l:3::0:)i}%f " ${${(M)$((i%6)):#3}:+$'\n'}; done
```

Current defaults:
```sh
export ZSH_TCTX_PROMPT_BACKGROUND=
export ZSH_TCTX_PROMPT_PREFIX=tctx
export ZSH_TCTX_PROMPT_PREFIX_FOREGROUND=255
export ZSH_TCTX_PROMPT_PROD_FOREGROUND=009
export ZSH_TCTX_PROMPT_DEFAULT_FOREGROUND=005
```

