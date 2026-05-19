<div align="center">

# epicsagas/homebrew-tap

Homebrew formulae for developer productivity tools

[![License](https://img.shields.io/badge/license-Apache--2.0-3fb950?style=for-the-badge&labelColor=0d1117)](LICENSE)
[![Formulae](https://img.shields.io/badge/formulae-7-58a6ff?style=for-the-badge&labelColor=0d1117&logo=homebrew&logoColor=white)](Formula/)
[![Stars](https://img.shields.io/github/stars/epicsagas/homebrew-tap?style=for-the-badge&labelColor=0d1117&color=ffd700&logo=github&logoColor=white)](https://github.com/epicsagas/homebrew-tap/stargazers)
[![Buy Me a Coffee](https://img.shields.io/badge/buy_me_a_coffee-FFDD00?style=for-the-badge&labelColor=0d1117&logo=buymeacoffee&logoColor=black)](https://buymeacoffee.com/epicsaga)

</div>

---

## Quick Start

```bash
brew tap epicsagas/tap
brew install <formula>
```

## Formulae

| Name | Description | Repository |
|------|-------------|------------|
| alcove | Private docs server with hybrid BM25 + semantic search for Claude Code | [epicsagas/alcove](https://github.com/epicsagas/alcove) |
| claudy | Modern multi-provider launcher for Claude CLI | [epicsagas/claudy](https://github.com/epicsagas/claudy) |
| collet | Relentless agentic coding orchestrator with zero-drop agent loops | [epicsagas/collet](https://github.com/epicsagas/collet) |
| epic-harness | Self-evolving Claude Code harness -- 6 commands, auto skills | [epicsagas/epic-harness](https://github.com/epicsagas/epic-harness) |
| llm-transpile | Token-optimized document transpiler for LLM pipelines | [epicsagas/llm-transpile](https://github.com/epicsagas/llm-transpile) |
| obscura-mcp | MCP server for Obscura headless browser — fetch, scrape, extract markdown | [epicsagas/obscura-plugin](https://github.com/epicsagas/obscura-plugin) |
| tdl | Tidal music downloader with TUI and GUI | [epicsagas/tdl](https://github.com/epicsagas/tdl) |

## Install Examples

```bash
# Private documentation search for Claude Code
brew install epicsagas/tap/alcove

# Multi-provider Claude CLI launcher
brew install epicsagas/tap/claudy

# Agentic coding orchestrator
brew install epicsagas/tap/collet

# Self-evolving Claude Code harness
brew install epicsagas/tap/epic-harness

# Document transpiler for LLM pipelines
brew install epicsagas/tap/llm-transpile

# Headless browser MCP server for AI agents
brew install epicsagas/tap/obscura-mcp

# Tidal music downloader
brew install epicsagas/tap/tdl
```

## Uninstall

```bash
brew uninstall <formula>
brew untap epicsagas/tap
```

## Contributing

Each formula corresponds to its own upstream repository. To report issues, request updates, or contribute changes:

1. Open an issue or pull request against the **upstream tool repository** for bugs or feature requests.
2. Open an issue or pull request against **this tap repository** for formula-specific problems such as broken downloads, incorrect checksums, or missing dependencies.

## License

This repository is licensed under [Apache-2.0](LICENSE).
