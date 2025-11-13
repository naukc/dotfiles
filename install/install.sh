#!/bin/zsh
#
# MASTER INSTALL SCRIPT
# Führt alle Unter-Skripte im /install Ordner aus.

echo "🚀 Starte das Setup für den neuen Mac..."

# Den Pfad zum Skript-Verzeichnis finden
SCRIPT_DIR=$(dirname "$0")/install

# Alle Skripte im install-Ordner ausführbar machen
chmod +x $SCRIPT_DIR/*.sh

# Die Skripte in logischer Reihenfolge ausführen
$SCRIPT_DIR/brew.sh
$SCRIPT_DIR/zsh.sh
$SCRIPT_DIR/tmux.sh
# ... (Füge hier zukünftige Skripte hinzu, z.B. macos.sh)

echo "--------------------------------------"
echo "✅ Alle Installationen abgeschlossen!"
echo "--------------------------------------"
echo ""
echo "NÄCHSTE SCHRITTE:"
echo "1. Starte dein Terminal neu (iTerm2)."
echo "2. Führe 'cd ~/dotfiles && stow .' aus."
echo "3. Starte tmux (t) und drücke Präfix + I (Shift+i), um die tmux-Plugins zu installieren."
