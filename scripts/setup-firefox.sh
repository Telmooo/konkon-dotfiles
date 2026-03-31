#!/usr/bin/env bash
#
# run_once: chezmoi runs this once on first apply.
# Since chrome files are symlinked, changes to the source are immediately
# reflected. Re-run manually with: chezmoi state delete-bucket --bucket=scriptState

set -euo pipefail

CHROME_SRC="$HOME/.config/firefox/chrome"
USER_JS_SRC="$HOME/.config/firefox/user.js"

#  find default firefox profile 
PROFILES_INI="$HOME/.mozilla/firefox/profiles.ini"

if [[ ! -f "$PROFILES_INI" ]]; then
  echo "konkon: firefox profiles.ini not found - skipping firefox chrome setup" >&2
  exit 0
fi

# prefer the [Install...] section default, fall back to [Profile] with Default=1
PROFILE_PATH=$(
  awk '
    /^\[Install/ { in_install=1; next }
    /^\[/ { in_install=0 }
    in_install && /^Default=/ { sub(/^Default=/, ""); print; exit }
  ' "$PROFILES_INI"
)

if [[ -z "$PROFILE_PATH" ]]; then
  PROFILE_PATH=$(
    awk '
      /^\[Profile/ { path=""; is_default=0 }
      /^Path=/ { path=$0; sub(/^Path=/, "", path) }
      /^Default=1/ { is_default=1 }
      is_default && path != "" { print path; exit }
    ' "$PROFILES_INI"
  )
fi

if [[ -z "$PROFILE_PATH" ]]; then
  echo "konkon: could not detect firefox default profile - skipping" >&2
  exit 0
fi

# resolve relative paths (most profiles use relative= paths)
if [[ "$PROFILE_PATH" != /* ]]; then
  PROF_DIR="$HOME/.mozilla/firefox/$PROFILE_PATH"
else
  PROF_DIR="$PROFILE_PATH"
fi

echo "konkon: firefox profile → $PROF_DIR"

#  create chrome directory 
mkdir -p "$PROF_DIR/chrome"

#  symlink userChrome.css and userContent.css 
for css in userChrome.css userContent.css; do
  src="$CHROME_SRC/$css"
  dst="$PROF_DIR/chrome/$css"
  if [[ -f "$src" ]]; then
    ln -sf "$src" "$dst"
    echo "konkon: linked $css"
  fi
done

#  symlink user.js 
if [[ -f "$USER_JS_SRC" ]]; then
  ln -sf "$USER_JS_SRC" "$PROF_DIR/user.js"
  echo "konkon: linked user.js"
fi

echo "konkon: firefox chrome setup complete"
echo "        restart firefox to apply changes"
