#!/bin/bash

# upgrade_uf.sh - Upgrade Splunk Universal Forwarder using .tgz, .rpm, or .deb packages
# Author: JG91

# -----------------------------
# CONFIGURATION
# -----------------------------
UF_INSTALLER_PATH="/path/to/splunkforwarder-installer"  # <-- Edit this
SPLUNK_HOME="/opt/splunkforwarder"
BACKUP_DIR="/opt/splunkforwarder_backup_$(date +%F_%H-%M-%S)"
SPLUNK_USER="splunk"
SPLUNK_GROUP="splunk"

# -----------------------------
# FUNCTIONS
# -----------------------------

check_root() {
  if [[ $EUID -ne 0 ]]; then
    echo "❌ This script must be run as root"
    exit 1
  fi
}

detect_installer_type() {
  if [[ "$UF_INSTALLER_PATH" == *.tgz ]]; then
    INSTALL_TYPE="tgz"
  elif [[ "$UF_INSTALLER_PATH" == *.rpm ]]; then
    INSTALL_TYPE="rpm"
  elif [[ "$UF_INSTALLER_PATH" == *.deb ]]; then
    INSTALL_TYPE="deb"
  else
    echo "❌ Unsupported installer format. Use .tgz, .rpm, or .deb."
    exit 1
  fi
}

stop_splunk() {
  echo "🔻 Stopping Splunk Universal Forwarder..."
  $SPLUNK_HOME/bin/splunk stop
}

backup_config() {
  echo "📦 Backing up config to $BACKUP_DIR"
  mkdir -p "$BACKUP_DIR"
  cp -r "$SPLUNK_HOME/etc" "$BACKUP_DIR/"
}

install_tgz() {
  echo "📦 Installing from .tgz..."
  tar -xvzf "$UF_INSTALLER_PATH" -C /opt
  chown -R "$SPLUNK_USER:$SPLUNK_GROUP" "$SPLUNK_HOME"
}

install_rpm() {
  echo "📦 Installing from .rpm..."
  rpm -Uvh "$UF_INSTALLER_PATH"
}

install_deb() {
  echo "📦 Installing from .deb..."
  dpkg -i "$UF_INSTALLER_PATH"
}

restore_config() {
  echo "🔁 Restoring previous configuration..."
  cp -r "$BACKUP_DIR/etc/"* "$SPLUNK_HOME/etc/"
}

start_splunk() {
  echo "▶️ Starting Splunk Universal Forwarder..."
  sudo -u "$SPLUNK_USER" "$SPLUNK_HOME/bin/splunk" start --accept-license --answer-yes
}

# -----------------------------
# MAIN
# -----------------------------

check_root
detect_installer_type
stop_splunk
backup_config

case $INSTALL_TYPE in
  tgz) install_tgz ;;
  rpm) install_rpm ;;
  deb) install_deb ;;
esac

restore_config
start_splunk

echo "✅ Upgrade complete using $INSTALL_TYPE installer."
