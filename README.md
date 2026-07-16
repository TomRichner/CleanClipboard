# CleanClipboard

A mac command that removes new lines from the last thing you coppied (e.g. when copying from Claude Code CLI)

Text copied out of terminal UIs like Claude Code or Codex is hard-wrapped, so
pasting it elsewhere leaves a newline at the end of every line. `CleanClipboard.command`
rewrites the clipboard in place: single newlines become spaces, blank-line
paragraph breaks are preserved.

## Install

Copy the script to your Desktop (or anywhere you like) and make it executable:

```bash
cp CleanClipboard.command ~/Desktop/
chmod +x ~/Desktop/CleanClipboard.command
```

Double-click it in Finder to run. macOS Gatekeeper may block the first launch —
if so, right-click the file and choose **Open**, then confirm.

## What it does

| Input | Output |
|---|---|
| `foo\nbar` | `foo bar` |
| `foo\n\nbar` | `foo\n\nbar` |
| `foo   \n   bar` | `foo bar` |

Leading and trailing whitespace is trimmed, and runs of spaces/tabs are squeezed
to one.
