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
        <p><strong>The Engine.</strong> A modern Wayland compositor that manages your windows. Unlike older X11 window managers (like i3), Hyprland offers buttery smooth animations, rounded corners, and blur effects, making the terminal feel futuristic rather than ancient.</p>
    </div>
    <div class="card">
        <h3>Zsh + Starship</h3>
        <p><strong>The Shell.</strong> I use Zsh instead of Bash for its superior plugin ecosystem. It is paired with the <em>Starship</em> prompt, which gives you instant contextual info (Git branch, package versions, execution time) right in your command line.</p>
    </div>
    <div class="card">
        <h3>Neovim</h3>
        <p><strong>The Editor.</strong> This is not standard Vim. It is configured with Lua to behave like a full IDE. It includes <strong>LSP</strong> (Language Server Protocol) for auto-completion/error checking, <strong>Treesitter</strong> for advanced syntax highlighting, and <strong>Telescope</strong> for fuzzy-finding files instantly.</p>
    </div>
    <div class="card">
        <h3>Pywal</h3>
        <p><strong>The Aesthetic.</strong> This tool extracts the dominant colors from your wallpaper and applies them system-wide. Change your background, and your terminal, borders, and text colors automatically update to match the mood.</p>
    </div>
</div>

---

## Dynamic Theming Explained
One of the most complex parts of this setup is the color synchronization. I use a tool called **Pywal**.

1.  You set a wallpaper using the command line.
2.  Pywal analyzes the image and generates a 16-color palette (dark, light, and accents).
3.  It "hot-reloads" these colors into **Kitty** (terminal), **Waybar** (status bar), and **Hyprland** (window borders) instantly.

_Result:_ Your system always looks perfectly coordinated without you manually editing hex codes.

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
The entire workflow is keyboard-driven. The `Super` key is the Windows/Command key.

| Key Combo | Action | Explanation |
| :--- | :--- | :--- |
| `Super + Return` | **Open Terminal** | Launches Kitty. |
| `Super + E` | **File Manager** | Launches Yazi (terminal-based file manager). |
| `Super + Space` | **App Launcher** | Opens Wofi (like Spotlight/Search). |
| `Super + Q` | **Close Window** | Kills the active window. |
| `Super + F` | **Fullscreen** | Toggles the active window to full screen. |
| `Super + Shift + Q` | **Exit** | Logs out of Hyprland. |

---

## Gallery
*Screenshots coming soon.*
