#!/bin/bash
set -eufo pipefail

echo "🚀 Setting up dotfiles."

# Check and install Xcode command line tools
if xcode-select -p &> /dev/null; then
  echo "✅ Xcode command line tools are already installed."
else
  echo "🔧 Installing Xcode command line tools..."
  xcode-select --install &> /dev/null
  
  while ! xcode-select -p &> /dev/null; do
    sleep 5
  done
  echo "✅ Xcode command line tools installed successfully."
fi

# Check and install Homebrew
if which -s "brew"; then
  echo "✅ Homebrew is already installed."
else
  echo "🍺 Installing Homebrew..."
  NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  echo "✅ Homebrew installed successfully."
fi

# Check and install chezmoi
if which -s "chezmoi"; then
  echo "✅ Chezmoi is already installed."
else
  echo "📦 Installing chezmoi..."
  brew install chezmoi
  echo "✅ Chezmoi installed successfully."
fi

# Initialize or update chezmoi
if [ -d "$HOME/.local/share/chezmoi/.git" ]; then
  echo "ℹ️ Chezmoi already initialized, pulling latest changes..."
  chezmoi update
  echo "✅ Chezmoi updated."
else
  echo "🔨 Initializing chezmoi..."
  chezmoi init --apply https://github.com/thanuzz/dotfiles.git
  echo "✅ Chezmoi initialized and applied."
fi

echo "✨ Setup complete!"
