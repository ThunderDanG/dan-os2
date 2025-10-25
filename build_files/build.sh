#!/bin/bash

set -ouex pipefail

### Install packages

# Packages can be installed from any enabled yum repo on the image.
# RPMfusion repos are available by default in ublue main images
# List of rpmfusion packages can be found here:
# https://mirrors.rpmfusion.org/mirrorlist?path=free/fedora/updates/39/x86_64/repoview/index.html&protocol=https&redirect=1

# this installs a package from fedora repos
dnf5 install -y tmux fish neovim duf fzf lsd fd-find httpie procs texstudio distrobox system76-keyboard-configurator cosmic-term gnome-tweaks 

# codecs install
dnf5 install gstreamer1-plugins-bad-free gstreamer1-plugins-bad-freeworld gstreamer1-plugins-ugly gstreamer1-libav

# Use a COPR Example:
#
# dnf5 -y copr enable ublue-os/staging
# dnf5 -y install package
# Disable COPRs so they don't end up enabled on the final image:
# dnf5 -y copr disable ublue-os/staging
dnf5 -y copr enable atim/starship
dnf5 -y install starship
dnf5 -y copr disable atim/starship
#### Example for enabling a System Unit File

systemctl enable podman.socket
