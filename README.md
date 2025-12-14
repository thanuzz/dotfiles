# Personal Dotfiles

My dotfiles setup using [chezmoi](https://chezmoi.io/) for macOS.

## Quick Start

Run the setup script:
```sh
curl -sfL https://raw.githubusercontent.com/thanuzz/dotfiles/main/.setup.sh | bash
```

## What Gets Set Up

The setup script will:

1. ✅ Install Xcode command line tools (if not already installed)
2. ✅ Install Homebrew (if not already installed)
3. ✅ Install chezmoi (if not already installed)
4. ✅ Initialize chezmoi with your dotfiles

Chezmoi will then:
- 📦 Install macOS applications (brews and casks) from `packages.yaml`
- ⚙️ Apply macOS system settings and preferences

During initialization, you'll be prompted for:
- **Work laptop** - Choose "y" for work or "n" for personal (determines which casks are installed)

## Directory Structure

```
.
├── .setup.sh                                 # Initial setup script
├── .chezmoi.json.tmpl                        # Chezmoi config template
├── .chezmoiignore.tmpl                       # Files to ignore
├── .chezmoidata/
│   └── packages.yaml                         # Brew packages and casks
├── run_onchange_after_darwin-defaults.sh     # macOS settings
└── run_onchange_install-packages-darwin.sh   # Package installer
```

## Updating

After the initial setup, update your dotfiles by running:

```sh
chezmoi update
```

This will pull the latest changes and apply them.

## Customizing

### Add Packages

Edit [.chezmoidata/packages.yaml](.chezmoidata/packages.yaml) to add or remove:
- **brews** - Command line tools (always installed)
- **casks** - GUI applications (always installed)
- **caskspersonal** - Personal apps (only if not a work laptop)
- **caskswork** - Work apps (only if a work laptop)

### Modify macOS Settings

Edit [run_onchange_after_darwin-defaults.sh](run_onchange_after_darwin-defaults.sh) to adjust system preferences.

## Resources

- [Chezmoi Documentation](https://chezmoi.io/)
- [macOS defaults reference](https://github.com/mathiasbynens/dotfiles)
