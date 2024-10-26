# Lunar Vim Configuration

## Install

1. Install lvim (keep all prompts at default)
    ```sh
    LV_BRANCH='release-1.4/neovim-0.9' 
    bash <(curl -s https://raw.githubusercontent.com/LunarVim/LunarVim/release-1.4/neovim-0.9/utils/installer/install.sh)
    ```

2. Add my layer of configuration
    ```sh
    git clone https://github.com/proffapt/lvim-conf ~/.config/lvim
    ```

## Uninstall

```sh
bash ~/.local/share/lunarvim/lvim/utils/installer/uninstall.sh
rm -rf ~/.config/lvim
```
