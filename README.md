# gab-dev-7/dotfiles

This repository contains my personal dotfiles for my Arch Linux setup. It is configured for a minimal, modern, and productive Hyprland desktop environment, primarily managed using GNU Stow.

## Overview

This setup is designed to provide a streamlined and efficient desktop experience on Arch Linux. It leverages a collection of native packages, AUR packages, and custom configurations to create a tailored environment.

### Features

- **Window Manager:** [Hyprland](https://hyprland.org/) (Wayland compositor)
- **Configuration Management:** [GNU Stow](https://www.gnu.org/software/stow/)
- **Shell:** [Fish](https://fishshell.com/)
- **Terminal:** [Foot](https://codeberg.org/dnkl/foot)
- **Editor:** [Neovim](https://neovim.io/)
- **Prompt:** [Starship](https://starship.rs/)
- **Ricing:** Utilizes tools like `pywal16`, `wpgtk`, `kvantum`, and custom themes for dynamic theming.
- **Package Management:** Uses `pacman` and `yay` for installation, with `pacman.conf` modifications for `illogical-impulse` repository.

## Included Configurations

The repository includes configurations for various applications and system components, including but not limited to:

- **Hyprland** (`hypr`)
- **Neovim** (`nvim`)
- **Kitty Terminal** (`kitty`)
- **Waybar** (Status bar, `waybar`)
- **Wofi** (Application launcher, `wofi`)
- **Dunst** (Notification daemon, `dunst`)
- **Rofi** (Alternative launcher/dmenu, `rofi`)
- **Tmux** (Terminal multiplexer, `tmux`)
- **Yazi** (Terminal file manager, `yazi`)
- **Btop** (System monitor, `btop`)
- **GTK** themes and settings (`gtk`)
- **Thunar** file manager (`thunar`)
- **Wal** and **WPG** for dynamic theming (`wal`, `wpg`)

## Installation

> [!WARNING]
> This script is tailored for a fresh Arch Linux installation and assumes you are comfortable with the system. It installs a large number of packages and modifies your system. Please review the `install.sh` script before running it.

1.  Ensure your system is up-to-date and Git is installed:
    ```bash
    sudo pacman -Syu git
    ```
2.  Clone this repository to your home directory under the name `dotfiles`:
    ```bash
    git clone https://github.com/gab-dev-7/dotfiles.git "$HOME/dotfiles"
    ```
3.  **Important:** This setup uses the `illogical-impulse` custom repository. Before running the installer, you must add this repository to your `/etc/pacman.conf`. Follow the instructions provided by the [illogical-impulse repository](https://github.com/Illogical-impulse/illogical-impulse) or its documentation.
4.  Navigate to the cloned repository:
    ```bash
    cd "$HOME/dotfiles"
    ```
5.  Make the `install.sh` script executable:
    ```bash
    chmod +x install.sh
    ```
6.  Run the installation script:
    ```bash
    ./install.sh
    ```
7.  **Reboot** your system after the installation completes to ensure all changes are applied correctly.

## Post-Installation

- After rebooting, you should be able to select Hyprland as your session at the login manager (SDDM is included in the installation).
- The script uses `stow` to symlink the configuration files into the appropriate locations in your `$HOME/.config` directory.
- Explore the configurations within the `dotfiles` directory to understand and potentially customize the setup further.
