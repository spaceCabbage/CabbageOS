# CabbageOS Project TODO

## Implemented / In-Progress Tweaks
- [x] Rename ISO definitions to `cabbageos` in `profiledef.sh`.
- [x] Update system identity files (`os-release`, `cabbageos-release`, `hostname`) to CabbageOS.
- [x] Inject CabbageOS string replacements into the Calamares branding payload at runtime.
- [x] Rebrand bootloader entries (GRUB, Syslinux, Systemd-boot) and welcome messages.
- [x] Append essential packages (Brave, git, neovim, tmux, etc.) to `packages_desktop.x86_64`.
- [x] Append Nerd Fonts to package list.
- [x] Update README.md with upstream sync instructions and Makefile usage.
- [x] Capture host KDE configuration (panels, widgets, themes, shortcuts) into `/etc/skel/`.
- [x] Create a custom Calamares `shellprocess` hook (`shellprocess-cabbage.conf`) to clone dotfiles and run your `install.sh` on the target system.
- [x] Implement custom Calamares software selection (`netinstall-cabbage.yaml`) with mandatory foundation and optional groups.
- [x] Create the root `Makefile` with `build`, `build-ram`, `test`, and `clean` targets.

## Post-Build / Manual Tasks
- [ ] Run `make build` to verify ISO generation succeeds without errors.
- [ ] Run `make test` to ensure the generated CabbageOS ISO boots correctly via QEMU with UEFI support.
- [ ] Verify that the Calamares installer successfully displays "CabbageOS" instead of "CachyOS" during the live session.
- [ ] Verify that the "CabbageOS Selection" page appears in Calamares with correct groups.
- [ ] Complete a test installation in QEMU and confirm the resulting user defaults to `/bin/bash` and your KDE setup is preserved.
- [ ] Verify that `~/dotfiles` is automatically cloned and your `install.sh` runs correctly during installation.
- [ ] Verify that all selected optional packages from the netinstall page are correctly installed.
- [ ] Test the `sd` / `syncdot` alias in the installed system to ensure manual dotfile syncing works.
- [ ] Run git commands to sync any upstream changes from CachyOS:
  ```bash
  git remote add upstream https://github.com/CachyOS/cachyos-archiso.git
  git fetch upstream
  git rebase upstream/master
  ```