#!/bin/zsh
echo "--- tmux (TPM) einrichten ---"

if [ ! -d "$HOME/.tmux/plugins/tpm" ]; then
  echo "TPM (Tmux Plugin Manager) wird installiert..."
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
else
  echo "TPM ist bereits installiert."
fi

echo "✅ TPM fertig."
