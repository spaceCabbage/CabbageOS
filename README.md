# CabbageOS Build Engine 🥬

**CabbageOS** is a performance-tuned, Gruvbox-themed Arch Linux distribution built on the CachyOS base. A fully personalized, ready-to-work environment.

---

## Key Customizations

### Aesthetic & Desktop (KDE Plasma)
- **Deep Gruvbox Integration:** All non-Gruvbox color schemes and themes have been pruned. The UI is locked into a consistent Gruvbox Material palette.
- **Persistent State:** Panels, widgets (Simple Kickoff, Window Buttons/Title), and global shortcuts are captured directly from the architect's host machine.
- **Konsole:** Pre-configured with Gruvbox color schemes and CaskaydiaCove Nerd Font.

### Tooling & Packages
- **Default Browser:** Brave
- **Modern CLI:** `neovim`, `tmux`, `starship`, `zoxide`, `fzf`, `eza`, `ripgrep`, `bat`, `jq`, `btop`, `duf`, `direnv`, `fastfetch`.
- **Typography:** JetBrainsMono, Meslo, and FiraCode Nerd Fonts included natively.

### Automation & Selection
- **The Cabbage Hook:** Custom Calamares post-install hook (`cabbage-post-install.sh`) that clones your dotfiles and establishes symlinks.
- **Dynamic Selection:** Custom "CabbageOS Selection" page in Calamares for picking development, multimedia, and system tools on-the-fly.
- **Hebrew Support:** Native support for Hebrew typography and spellchecking tools included in the foundation.
- **Bash First:** Optimized Bash experience for the primary shell.
- **First-Login Setup:** A welcome script that triggers on first login to finalize Tailscale configuration and environmental tweaks.

---

## Build System

Use the provided `Makefile` to manage the ISO lifecycle:

| Target           | Description                                   |
|------------------|:----------------------------------------------|
| `make`           | Show help menu (default)                      |
| `make build`     | Standard ISO generation                       |
| `make build-ram` | Accelerated build in RAM (requires 23GB+ RAM) |
| `make test`      | Launch resulting ISO in QEMU (UEFI, 4GB RAM)  |
| `make clean`     | Purge build artifacts and work directories    |

---

## Maintenance & Upstream Sync

CabbageOS stays fast by rebasing on the latest [CachyOS Archiso](https://github.com/CachyOS/cachyos-archiso) updates.

### Sync Workflow
```bash
# 1. Add upstream
git remote add upstream https://github.com/CachyOS/cachyos-archiso.git

# 2. Pull updates (using rebase to keep CabbageOS tweaks on top)
git fetch upstream
git rebase upstream/master
```

### Handling Conflicts
When rebasing, you may encounter conflicts in files we have rebranded (e.g., `profiledef.sh`, `os-release`, `grub.cfg`).
- **Keep our changes** for branding and package additions.
- **Accept upstream changes** for build script logic or new kernel parameters.
- After resolving, run: `git add <file>` and `git rebase --continue`.

### Post-Sync Validation
Always run `make clean && make build && make test` after an upstream sync to ensure branding injections and post-install hooks remain functional.

