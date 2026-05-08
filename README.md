<div align="center">

# epicsagas/homebrew-tap

Homebrew formulae for developer productivity tools

[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](LICENSE)
[![GitHub stars](https://img.shields.io/github/stars/epicsagas/homebrew-tap?style=flat&logo=github)](https://github.com/epicsagas/homebrew-tap/stargazers)
[![GitHub forks](https://img.shields.io/github/forks/epicsagas/homebrew-tap?style=flat&logo=github)](https://github.com/epicsagas/homebrew-tap/forks)
[![GitHub downloads](https://img.shields.io/github/downloads/epicsagas/homebrew-tap/total?style=flat&logo=github)](https://github.com/epicsagas/homebrew-tap/releases)
[![Buy Me a Coffee](https://img.shields.io/badge/Buy%20Me%20a%20Coffee-FFDD00?style=flat&logo=buy-me-a-coffee&logoColor=black)](https://buymeacoffee.com/epicsaga)

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
