# Prepare

[oh-my-fish](https://github.com/oh-my-fish/oh-my-fish)

## Installation

```sh
pacman -S procps-ng
```

## Theme

```sh
omf install bobthefish
omf reload
```

## Modify

Add the below script in `~/.config/fish/function/fish_prompt.fish`

```fish
# Time
function __bobthefish_timestamp -S -d 'Show the current timestamp'
  [ "$theme_display_date" = "no" ]; and return
  set -q theme_date_format
    or set -l theme_date_format "+%c"

  printf (date $theme_date_format)
end
```

and the `__bobthefish_timestamp` into the `fish_prompt` function in `~/.config/fish/function/fish_prompt.fish`
