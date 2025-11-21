---
layout: default
title: Home
---

<header>
    <h1>.dotfiles</h1>
    <p class="subtitle">Hyprland // Zsh // Neovim // Arch</p>
    <a href="https://github.com/gab-dev-7/dotfiles" class="btn">View on GitHub</a>
</header>

## The Philosophy

This setup is designed for a **keyboard-centric workflow**. It minimizes distractions, maximizes screen real estate, and uses a dark, high-contrast aesthetic inspired by cyberpunk themes. It leverages **GNU Stow** for symlink management, keeping the home directory clean and the config history versioned.

<div class="grid">
    <div class="card">
        <h3>Hyprland</h3>
        <p>A dynamic tiling window manager for Wayland. Includes smooth animations, blur effects, and rounded corners.</p>
    </div>
    <div class="card">
        <h3>Zsh</h3>
        <p>Optimized for speed and compliance. Configured with autocomplete, syntax highlighting, and a custom prompt.</p>
    </div>
    <div class="card">
        <h3>Neovim</h3>
        <p>A full IDE replacement. Custom LSP setup, treesitter, telescope, and fast navigation keybinds.</p>
    </div>
    <div class="card">
        <h3>Pywal</h3>
        <p>Dynamic theming engine. The entire system color scheme adapts to your current wallpaper instantly.</p>
    </div>
</div>

---

## Installation

> **Note:** This script is destructive. It is tailored for a fresh Arch Linux install and will overwrite existing configurations.

### 1. Update System

Ensure your system is up to date and git is installed.

```bash
sudo pacman -Syu git
```
````

### 2\. Clone Repository

Clone the repo to your home directory.

```bash
git clone [https://github.com/gab-dev-7/dotfiles.git](https://github.com/gab-dev-7/dotfiles.git) "$HOME/dotfiles"
cd "$HOME/dotfiles"
```

### 3\. Run Installer

Make the script executable and run it. This will handle package installation and symlinking.

```bash
chmod +x install.sh
./install.sh
```

**Post-Install:** Reboot your system. Select "Hyprland" from your login manager (SDDM).

---

## Directory Structure

Using **GNU Stow**, the repository maps directly to your `.config` folder. This keeps your home directory clean.

```text
dotfiles/
├── hypr/       →  ~/.config/hypr
├── nvim/       →  ~/.config/nvim
├── zsh/        →  ~/.zshrc
├── kitty/      →  ~/.config/kitty
├── waybar/     →  ~/.config/waybar
└── dunst/      →  ~/.config/dunst
```

---

## Key Bindings

These are the core shortcuts to get started with the workflow.

| Key                 | Action                   |
| :------------------ | :----------------------- |
| `Super + Return`    | Open Terminal (Kitty)    |
| `Super + E`         | File Manager (Yazi)      |
| `Super + Space`     | App Launcher (Wofi/Rofi) |
| `Super + Q`         | Close Window             |
| `Super + Shift + Q` | Exit Hyprland            |
| `Super + F`         | Toggle Fullscreen        |

---

## Gallery

_Screenshots coming soon._

```

```
