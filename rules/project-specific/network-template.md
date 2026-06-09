# Project Network Setup (Template)

Plain template (not an active rule). Copy the relevant parts into your project's `context.mdc` or a project-specific rule when needed.

Use this rule only in projects that require a managed network proxy, VPN, or specific local setup for git, package managers, MCP launchers, or external HTTP calls.

## What To Document Here

- Whether the project requires direct access, a managed proxy, VPN, or a specific local setup step.
- Which commands need the network helper, such as git, npm/npx, curl, or MCP launchers.
- Any project-safe troubleshooting steps that do not expose internal hostnames, domains, credentials, or tokens.

## Where Proxy Values Belong

Follow `rules/security/secrets-and-config.mdc`: keep private proxy URLs, internal domains, and credentials out of the repo and reusable rules.

Store local values in user-local config:

```bash
# ~/.cursor/network.env
CURSOR_NETWORK=work
CURSOR_PROXY_URL=http://proxy.example:8080
```

If the proxy endpoint is sensitive, keep it out of the repository entirely and refer users to internal setup docs.
