# Project network and git push setup (template)

Plain template — **not** an active rule. Copy to `network-setup.local.md` and fill in your values.

Add `network-setup.local.md` to the project `.gitignore`. Never commit real proxy URLs or internal hostnames.

## Network helper

```bash
source "${HOME}/.cursor/cursor-network.sh" && apply_cursor_network
```

Override file: `~/.cursor/network.env` (see your Cursor user-config setup).

## Git remotes

Document your remotes here (primary fetch/pull, optional mirrors):

| Remote   | Role                                      |
| -------- | ----------------------------------------- |
| `origin` | Primary fetch/pull; push to all push URLs |
| `mirror` | Optional explicit mirror remote           |

## Work network (proxy prefix)

Replace `<proxy-url>` with Cursor `http.proxy` or `CORP_PROXY` from `~/.cursor/network.env`:

```bash
cd /path/to/repo

HTTPS_PROXY=<proxy-url> HTTP_PROXY=<proxy-url> git push origin main

HTTPS_PROXY=<proxy-url> HTTP_PROXY=<proxy-url> git pull --rebase origin main
HTTPS_PROXY=<proxy-url> HTTP_PROXY=<proxy-url> git push origin main
```

Or source the helper first (sets proxy env vars automatically):

```bash
cd /path/to/repo
source "${HOME}/.cursor/cursor-network.sh" && apply_cursor_network
git pull --rebase origin main
git push origin main
```

## No proxy

```bash
cd /path/to/repo
git pull --rebase origin main
git push origin main
```
