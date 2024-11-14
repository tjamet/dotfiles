# My dotfiles

Those dotfiles uses [chezmoi](https://www.chezmoi.io/) to bootstrap a personal computer.

## Usage

To bootstrap a computer, run:

```bash
sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply tjamet
```

Later, follow the chezmoi documentation to update the laptop configuration
