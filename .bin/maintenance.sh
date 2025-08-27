#!/bin/bash

# Script for maintaining optimal system state
# INFO: zsh alias: maint
# shellcheck disable=2059

set -euo pipefail
IFS=$'\n\t'

# Color codes
CYAN='\e[36m'
GREEN='\e[32m'
YELLOW='\e[33m'
RESET='\e[0m'

printf "${CYAN}=== Starting system maintenance ===${RESET}\n"

# Helper: delete if exists, and print when deletion occurs
delete_path() {
  local path=$1
  if [[ -e "$path" ]]; then
    rm -rf "$path"
    printf "${GREEN}Deleted:${RESET} %s\n" "$path"
  fi
}

# ---------------------------------------
# 1. Remove known unnecessary dirs/files
# ---------------------------------------
printf "${CYAN}[1/5] Removing unused files and directories...${RESET}\n"

delete_path "${HOME}/.android"        # Android SDK leftovers
delete_path "${HOME}/.cargo"          # Rust cache
delete_path "${HOME}/.yarn"           # Yarn cache
delete_path "${HOME}/.python_history" # Python REPL history
delete_path "${HOME}/.yarnrc"
delete_path "${HOME}/.bash_history"

# Clean Telegram Desktop downloads
TELEGRAM_DL="${HOME}/Downloads/Telegram Desktop"
if [[ -d "$TELEGRAM_DL" ]]; then
  shopt -s dotglob
  for f in "$TELEGRAM_DL"/*; do
    delete_path "$f"
  done
  shopt -u dotglob
fi

# Attempt to remove Desktop if empty
if [[ -d "${HOME}/Desktop" ]]; then
  rmdir --ignore-fail-on-non-empty "${HOME}/Desktop" &&
    printf "${GREEN}Removed empty directory:${RESET} %s\n" "${HOME}/Desktop"
fi

# ------------------------
# 2. Clear cliphist cache
# ------------------------
printf "${CYAN}[2/5] Clearing cliphist cache...${RESET}\n"
if command -v cliphist &>/dev/null; then
  cliphist wipe && printf "${GREEN}cliphist cache wiped${RESET}\n"
else
  printf "${YELLOW}cliphist not installed; skipping${RESET}\n"
fi

# -------------------------------
# 3. Vacuum systemd journal logs
# -------------------------------
printf "${CYAN}[3/5] Vacuuming journal logs older than 7 days...${RESET}\n"
sudo journalctl --vacuum-time=7d &&
  printf "${GREEN}Journal logs vacuumed${RESET}\n"

# --------------------------
# 4. Clean stale /tmp files
# --------------------------
printf "${CYAN}[4/5] Cleaning stale /tmp files (older than 3 days)...${RESET}\n"
sudo find /tmp -mindepth 1 -mtime +3 -print0 | while IFS= read -r -d '' file; do
  sudo rm -rf "$file" && printf "${GREEN}Deleted stale tmp:${RESET} %s\n" "$file"
done

# ----------------------------------
# 5. Run rmlint on selected folders
# ----------------------------------
printf "${CYAN}[5/5] Running rmlint on select folders...${RESET}\n"
RMLINT_TARGETS=(
  "${HOME}/Documents"
  "${HOME}/Videos"
  "${HOME}/Music"
  "${HOME}/Pictures"
)

for dir in "${RMLINT_TARGETS[@]}"; do
  if [[ -d "$dir" ]]; then
    printf "${CYAN}Scanning:%s${RESET}\n" "$dir"
    # rmlint will itself report duplicates/deletions as per its default output
    rmlint "$dir" --no-crossdev
  fi
done

printf "${GREEN}=== Maintenance complete ===${RESET}\n"
