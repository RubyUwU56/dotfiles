#!/bin/bash
LANG=C nm-connection-editor


# Öffne das KDE Plasma Netzwerkmodul
qdbus org.kde.plasmashell /PlasmaShell org.kde.PlasmaShell.evaluateScript '
var service = "org.kde.plasmanetworkmanagement";
var path = "/org/kde/plasmanetworkmanagement";
var iface = "org.kde.plasmanetworkmanagement";
var dialog = workspace.showWindowForService(service, path, iface);'

chmod +x ~/.config/waybar/scripts/open-network-manager.sh

