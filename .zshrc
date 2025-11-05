export EDITOR="code -w"

# Aliases
[ -f ~/.aliases ] && source ~/.aliases

# History بهتر
HISTSIZE=5000
SAVEHIST=5000
setopt HIST_IGNORE_ALL_DUPS

# Python: venv helper
mkvenv() {
  python3 -m venv .venv && source .venv/bin/activate && python -m pip install --upgrade pip
}
usevenv() { [ -f .venv/bin/activate ] && source .venv/bin/activate || echo "no .venv"; }

# Node: اگر npx هست
hash npx 2>/dev/null && export PATH="$HOME/.npm-global/bin:$PATH"
