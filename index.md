---
layout: default
title: Home
---

<header>
    <h1>.dotfiles</h1>
    <p class="subtitle">Arch Linux // Hyprland // Zsh // Pywal</p>
    <div style="margin-top: 1.5rem;">
        <a href="https://github.com/gab-dev-7/dotfiles" class="btn">View Source</a>
    </div>
</header>

## The Philosophy
This is not just a collection of config files; it is a cohesive **environment**. 

If you are coming from Windows or macOS, this setup replaces the "floating window" chaos with a strict **Tiling Window Manager**. Windows automatically snap into a grid, maximizing screen real estate and allowing you to navigate your entire OS without ever touching a mouse.

---

## The Stack

<div class="grid">
    <div class="card">
        <h3>Hyprland</h3>
        <p><strong>The Engine.</strong> A modern Wayland compositor. Unlike older X11 window managers, Hyprland offers buttery smooth animations, rounded corners, and blur effects, making the terminal feel futuristic.</p>
    </div>
    <div class="card">
        <h3>Zsh + Starship</h3>
        <p><strong>The Shell.</strong> Optimized for speed. It is paired with the <em>Starship</em> prompt, which gives you instant contextual info (Git branch, package versions, execution time) right in your command line.</p>
    </div>
    <div class="card">
        <h3>Neovim</h3>
        <p><strong>The Editor.</strong> Configured with Lua to behave like a full IDE. It includes <strong>LSP</strong> for auto-completion, <strong>Treesitter</strong> for highlighting, and <strong>Telescope</strong> for fuzzy-finding files.</p>
    </div>
    <div class="card">
        <h3>Pywal</h3>
        <p><strong>The Aesthetic.</strong> Extracts colors from your wallpaper and applies them system-wide. Change your background, and your terminal, borders, and text colors automatically update to match.</p>
    </div>
    <div class="card">
        <h3>Kitty</h3>
        <p><strong>The Terminal.</strong> A GPU-accelerated terminal emulator. It offloads rendering to the graphics card for zero latency and supports displaying images directly in the command line.</p>
    </div>
    <div class="card">
        <h3>Waybar</h3>
        <p><strong>The Status Bar.</strong> A highly customizable bar that sits at the top of the screen. It displays workspaces, media controls, volume, and battery status, styled dynamically by Pywal.</p>
    </div>
</div>

---

## Installation Guide

> **Warning:** This script assumes a fresh Arch Linux install. It uses `stow` to manage symlinks. Back up your data before running this.

### 1. Update & Prep
Ensure your system core is up to date and you have Git installed.

~~~bash
sudo pacman -Syu git
~~~

### 2. Download the Configs
Clone this repository to your home folder. The folder name *must* be `dotfiles` for the symlinks to work automatically.

~~~bash
git clone https://github.com/gab-dev-7/dotfiles.git "$HOME/dotfiles"
cd "$HOME/dotfiles"
~~~

### 3. Automated Install
Run the script. This will install the required packages (Hyprland, Neovim, etc.) and link the config files to `~/.config/`.

~~~bash
chmod +x install.sh
./install.sh
~~~

**After Install:** Reboot your machine. On the login screen (SDDM), click the gear icon and select **Hyprland** before logging in.

---

## Cheat Sheet

The workflow is designed to be entirely keyboard-driven using the `Super` key (Windows Key).

### 🚀 Applications
| Key Combo | Action |
| :--- | :--- |
| `Super + Return` | **Terminal** (Kitty) |
| `Super + E` | **File Manager** (Thunar) |
| `Super + B` | **Browser** (Zen Browser) |
| `Super + D` | **App Launcher** (Wofi) |
| `Super + Space` | **Alternative Launcher** |

### ⚙️ System Controls
| Key Combo | Action |
| :--- | :--- |
| `Super + W` | **Change Wallpaper** (Random + Pywal) |
| `Super + Shift + S` | **Screenshot** (Grimblast) |
| `Super + P` | **Power Menu** (Shutdown/Reboot) |
| `Super + L` | **Lock Screen** |
| `Super + Shift + C` | **Clipboard History** |
| `Super + Shift + B` | **Toggle Blue Light** (Gammastep) |

### 🪟 Window Management
| Key Combo | Action |
| :--- | :--- |
| `Super + Q` | **Close Active Window** |
| `Super + F` | **Toggle Fullscreen** |
| `Super + V` | **Toggle Floating Mode** |
| `Super + H/J/K/L` | **Move Focus** (Vim keys) |
| `Alt + Tab` | **Cycle Windows** |

---

## Resources & Documentation

If you are new to this ecosystem, these are the essential guides to keep bookmarked:

* [📖 Arch Linux Installation Guide](https://wiki.archlinux.org/title/Installation_guide) - The bible of Linux.
* [🐉 Hyprland Wiki](https://wiki.hyprland.org/) - Documentation for the window manager animations and variables.
* [🐚 Oh My Zsh](https://ohmyz.sh/) - How to configure the shell further.
* [🎨 Pywal](https://github.com/dylanaraps/pywal) - Understanding the color generation backend.

---

## Gallery
*Screenshots coming soon.*
