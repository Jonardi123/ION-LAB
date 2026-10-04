#!/usr/bin/env bash
set -Eeuo pipefail
cd -- "$(dirname -- "$(readlink -f -- "$0")")"
if [ ! -x .venv/bin/python ]; then
  echo 'First launch: preparing ION LAB...'
  python3 -m venv .venv || { echo 'Could not create the Python environment. Check python3 venv support.'; exit 1; }
fi
if ! .venv/bin/python -c 'import PySide6, psutil' >/dev/null 2>&1; then
  echo 'Installing ION LAB dependencies (first launch only)...'
  if ! .venv/bin/python -m pip --version >/dev/null 2>&1; then
    .venv/bin/python -m ensurepip --upgrade || { echo 'Python pip is unavailable in this virtual environment.'; exit 1; }
  fi
  .venv/bin/python -m pip install -r requirements.txt || { echo 'Could not install dependencies. See the message above.'; exit 1; }
fi
if [ ! -f "$HOME/.local/share/applications/ion-lab.desktop" ]; then
  bash INSTALL-DESKTOP-SHORTCUT.sh || echo 'App-menu shortcut skipped; you can still use ION LAB.'
fi
exec .venv/bin/python ion_lab.py
