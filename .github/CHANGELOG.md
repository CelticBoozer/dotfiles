# Changelog
<!-- markdownlint-disable MD024 -->
<!-- cSpell:disable -->
## 1.2.0 (2025-06-25)

### Feat

- too much diffs, especially codestyle, docs and unify tabs in different progs
- **.ideavimrc**: add a bit new functions to the ideavim

### Fix

- yazi fix icon
- cspell fix
- **yamlfmt**: another fix workflow
- **yamlfmt.yaml**: fix yamlfmt workflow
- **sworkstyle**: fix idea icon, when edit ideavimrc
- **.bin/random-background.sh**: #284 bug fix, add new wallpapers

### Refactor

- a bit refactored
- **.bin/initial-installation.sh**: rearranged stages
- Just few little updates
- **logind.conf**: add new logind.conf features

## 1.1.0 (2024-11-21)

### Feat

- **FUNDING.yaml**: add funding yaml file and donation in README
- **firefox**: add firefox backup. All plugins, etc
- **rofi-power-menu**: migrate from modified script to package
- **sworkstyle**: add missing sworkstyle icons
- **mpv**: added good mpv configuration
- add most needed apps to mime
- **.editorconfig**: add .editorconfig file

### Fix

- **rofi**: fix rofi fails because of rofi-calc support deprecated
- **nnn**: delete nnn update plugin from update script
- fix problem with envvars
- fix problem with bug and feature templates
- fix shellcheck workflow, to do not fail on .zprofile
- **.editorconfig**: add .editorconfig option, to add new line at EOF
- fix problem with environment variables declared in .zshenv and ingrore by sway

### Refactor

- fix few things to let ci complete successfuly
- A bit code refactor in rofi and sway

## 1.0.3 (2024-10-21)

### Fix

- **markdownlint.yaml**: fix markdownlint workflow, to lint dots

## 1.0.2 (2024-10-15)

### Fix

- **CHANGELOG**: fix changelog

## 1.0.1 (2024-10-15)

### Fix

- **CHANGELOG**: fix changelog

## 1.0.0 (2024-10-15)

### Feat

- **CHANGELOG.md**: move CHANGELOG.md to .github directory
- **.cz.yaml**: add commitizen config
- add fzf config. #243 implemented
- add ripgrep config
- migrate to the yazi. #220 implemented.
- much new, f.e. nnn etc
- Add yamlfmt step to workflow.

### Fix

- **CHANGELOG**: try to fix CHANGELOG
- **CHANGELOG.md**: fix CHANGELOG
- **.cz.yaml**: fix versions in cz bump
- **cz.yaml**: fix wrong versions in commit messages
- **.cz.yaml**: trying to fix .cz.yaml
- just to check
- fix shellcheck

### Refactor

- unify workflows
