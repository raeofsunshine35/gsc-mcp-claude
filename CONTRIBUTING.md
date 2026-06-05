# Contributing to gsc-mcp-claude

Thank you for your interest in improving this resource. Contributions are welcome
from anyone who has used the GSC MCP connection and wants to help others set it up.

---

## What We Welcome

- **Troubleshooting additions** — new error messages and their fixes
- **Prompt additions** — real prompts that produced useful results in client work
- **Client workflow examples** — anonymised case studies showing what you discovered
- **Platform-specific notes** — setup quirks on specific OS versions or Python versions
- **Translation** — setup instructions in other languages (French, Spanish, Portuguese, Patois)
- **Corrections** — if a step is out of date or a tool name changed

---

## What to Do

1. **Fork** this repository
2. Create a branch: `git checkout -b your-improvement-name`
3. Make your changes
4. **Test** — if adding a prompt, confirm it worked in Claude Desktop with live GSC data
5. Submit a **Pull Request** with a clear description of what you changed and why

---

## File Map — Where Things Live

| File | Purpose |
|---|---|
| `SKILL.md` | Claude Code skill — setup steps + tools reference |
| `README.md` | GitHub landing page — public-facing description |
| `sample_prompts.md` | Full library of ready-to-use prompts |
| `claude_desktop_config.template.json` | Config file template (Option A + Option B) |
| `setup_helper_windows.bat` | Windows automation script |
| `setup_helper_mac.sh` | Mac automation script |
| `references/gsc-tools.md` | Detailed reference for all 20 tools |
| `references/client-workflows.md` | Real-world workflow examples from consulting work |
| `references/troubleshooting.md` | Common errors + fixes |
| `.gitignore` | Keeps credentials out of the repo |

---

## Guidelines

- Keep language clear and non-technical — this resource is used by consultants and VAs, not just developers
- Never include real credentials, API keys, or client data
- Keep prompts generic enough to work across different sites (use `[site.com]` as placeholder)
- Match the existing tone — direct, practical, no fluff

---

## Questions?

Open an issue or email **info@raeofsunshineconsulting.co**

Built by [Rae of Sunshine Consulting](https://raeofsunshineconsulting.co) · Cape Coast, Ghana
