#!/bin/bash
set -e # Exit immediately if a command exits with a non-zero status

# --- CONFIGURATION ---
DOTFILES_DIR="$HOME/dotfiles"
LOG_FILE="$HOME/install_log.txt"

# Folders to be stowed (Linked to your Home Directory)
# Added 'zsh' here to ensure your .zshrc is linked
STOW_FOLDERS="btop dunst hypr kitty nvim rofi tmux waybar wofi gtk thunar yazi wal wpg zsh"

# 1. Official Arch Packages
# Removed '*-git' packages from here (as they are AUR/Custom Repo packages)
# Added 'kitty' and 'starship'
NATIVE_PKGS="adobe-source-code-pro-fonts adobe-source-han-sans-jp-fonts adobe-source-han-serif-jp-fonts amd-ucode base base-devel bat blueman bluez bluez-utils breeze-gtk breeze-plymouth btop discord discover dnsmasq dosfstools drkonqi dunst edk2-ovmf efibootmgr fastfetch fd firefox flat-remix-gtk flatpak flatpak-kcm fzf gammastep gdb git gnome-system-monitor go greetd greetd-tuigreet grub gst-plugin-pipewire gvfs gvfs-mtp htop intellij-idea-community-edition inxi iwd k9s kanshi kde-gtk-config kdeplasma-addons kgamma kinfocenter kmenuedit krdp kscreen ksshaskpass kvantum kvantum-qt5 kwallet-pam kwin-x11 kwrited libpulse libspng libvirt linux linux-firmware linux-zen loupe lsd ly mercurial mtools nano neovim network-manager-applet networkmanager-openconnect noto-fonts noto-fonts-cjk noto-fonts-emoji npm nwg-displays nwg-look onedriver openconnect openssh-askpass os-prober otf-font-awesome otf-ipafont oxygen oxygen-sounds pacman-contrib pamixer papirus-icon-theme pavucontrol pipewire pipewire-alsa pipewire-jack plasma-browser-integration plasma-desktop plasma-disks plasma-firewall plasma-pa plasma-sdk plasma-systemmonitor plasma-thunderbolt plasma-vault plasma-welcome plasma-workspace-wallpapers plymouth-kcm power-profiles-daemon powerdevil print-manager python-pip python-pipx python-pyquery python-pywal16 python-requests qemu-desktop qt5ct qt6ct sddm sddm-kcm slack-desktop smartmontools sof-firmware spectacle spotify-launcher starship swww thunar thunar-archive-plugin thunar-volman timeshift timeshift-autosnap tmux ttf-droid ttf-fantasque-nerd ttf-fira-code ttf-hanazono ttf-jetbrains-mono ttf-victor-mono ufw umockdev unzip uwsm vim virt-manager vulkan-radeon wacomtablet waybar wdisplays wireless_tools wlr-randr wofi wpgtk xdg-utils xf86-video-amdgpu xf86-video-ati xorg-server xorg-xinit yad yazi zoxide zram-generator zsh zsh-completions kitty"

# 2. AUR Packages
# Ensured hyprland-git and others are handled here
AUR_PKGS="adw-gtk-theme-git aquamarine-git breeze-plus darkly-bin flat-remix-gtk google-breakpad grimblast-git gtk2 html2markdown hyprcursor-git hyprgraphics-git hyprland-git hyprland-guiutils-git hyprland-qt-support-git hyprlang-git hyprpaper-git hyprtoolkit-git hyprutils-git hyprwayland-scanner-git matugen-bin neovim-remote onedriver openssh-askpass otf-space-grotesk python-pywal16 qt6-avif-image-plugin slack-desktop timeshift-autosnap ttf-gabarito-git ttf-material-symbols-variable-git ttf-readex-pro ttf-roboto-flex ttf-rubik-vf ttf-twemoji ttf-victor-mono wdisplays wlogout wpgtk xdg-desktop-portal-hyprland-git yay-bin"

echo "### Arch Dotfiles Installer ###" | tee -a "$LOG_FILE"

# 1. System Update & Basics
echo "-> Updating system and installing base tools..." | tee -a "$LOG_FILE"
sudo pacman -Syu --noconfirm
sudo pacman -S --needed --noconfirm git base-devel stow

# 2. Install Yay (AUR Helper)
if ! command -v yay &>/dev/null; then
  echo "-> Installing yay..." | tee -a "$LOG_FILE"
  git clone https://aur.archlinux.org/yay-bin.git /tmp/yay-bin
  cd /tmp/yay-bin
  makepkg -si --noconfirm
  cd -
  rm -rf /tmp/yay-bin
else
  echo "-> Yay is already installed." | tee -a "$LOG_FILE"
fi

# 3. Install Native Packages
echo "-> Installing Official Packages..." | tee -a "$LOG_FILE"
# Removed CUSTOM_REPO_PKGS from this line
sudo pacman -S --needed --noconfirm $NATIVE_PKGS

# 4. Install AUR Packages
echo "-> Installing AUR Packages..." | tee -a "$LOG_FILE"
yay -S --needed --noconfirm $AUR_PKGS

# 5. Stow Dotfiles
echo "-> Stowing Dotfiles..." | tee -a "$LOG_FILE"
if [ -d "$DOTFILES_DIR" ]; then
  cd "$DOTFILES_DIR"
  for folder in $STOW_FOLDERS; do
    echo "   Linking $folder..."
    # Conflict resolution: backup existing folders if they are not symlinks
    if [ -d "$HOME/.config/$folder" ] && [ ! -L "$HOME/.config/$folder" ]; then
      echo "   ! Backup existing config: $HOME/.config/$folder to $HOME/.config/$folder.bak"
      mv "$HOME/.config/$folder" "$HOME/.config/$folder.bak"
    fi

    # Handle .zshrc specifically if it's not in .config (standard stow maps to parent dir)
    # Assuming standard stow behavior (stow package-name -> target directory)
    stow -v $folder
  done
else
  echo "❌ ERROR: $DOTFILES_DIR not found. Clone your repo there first!" | tee -a "$LOG_FILE"
  exit 1
fi

# 6. Set Zsh as default shell
echo "-> Setting Zsh as default shell..." | tee -a "$LOG_FILE"
if [ "$SHELL" != "/usr/bin/zsh" ]; then
  chsh -s /usr/bin/zsh
fi

echo "### Installation Complete! Please reboot. ###" | tee -a "$LOG_FILE"
