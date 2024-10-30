# terminal
A list of essential commands, key bindings and general terminal shortcuts.

## `tmux`
Use the following command to download the `tmux` configuration:

```bash
curl -o ~/.tmux.config https://raw.githubusercontent.com/takitakitanana/public/main/tmux/.tmux.config
```

### Prefix
- `ctrl` + `b`

### Pane Management
- **Add New Pane**: `prefix` + `c`
- **Rename Pane**: `prefix` + `,`

### Session Management
- **Detach from Session**: `prefix` + `d`

### Window and Pane Navigation
- **Move Around Panes**: `prefix` + `arrows`
- **Vertical Split**: `prefix` + `%`
- **Horizontal Split**: `prefix` + `"`
- **Change Layout of Panes**: `prefix` + `space`
- **Resize Pane**: `prefix (hold)` + `arrows`

### Zoom and Focus
- **Zoom In/Out Pane**: `prefix` + `z`

### Copy Mode (vi)
- **Enter Copy Mode**: `prefix` + `[`
- **Exit Copy Mode**: `q`
- **Start Copying**: `space`
- **Save Copy to Buffer**: `enter`
- **Paste from Buffer**: `prefix` + `]`

## `vim`
- **Delete all text**: `:` + `%d`
- **Go to line number 1**: `:` + `1`
- **Quit without saving**: `:` + `q!`

## Miscellaneous
- **Clear**: `ctrl` + `l`
- **Delete Text in Place**: `ctrl` + `d`
