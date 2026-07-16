#!/bin/bash
# Collapse single newlines in the clipboard into spaces, keeping blank-line
# paragraph breaks intact. Useful for text copied out of codex/claude CLIs.

set -euo pipefail

pbpaste | perl -0777 -pe '
  s/\r\n/\n/g;
  s/[ \t]*\n[ \t]*\n[ \t\n]*/\x00/g;   # paragraph breaks -> placeholder
  s/[ \t]*\n[ \t]*/ /g;                # single newlines -> space
  s/[ \t]{2,}/ /g;                     # squeeze runs of spaces/tabs
  s/\x00/\n\n/g;                       # restore paragraph breaks
  s/\A\s+|\s+\z//g;                    # trim leading/trailing whitespace
' | pbcopy

echo "Clipboard cleaned."
sleep 0.5
