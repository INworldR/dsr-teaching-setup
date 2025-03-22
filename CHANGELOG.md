# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [0.1.0] - 2025-03-22

### Added

- Introduced initial `Makefile` with the following targets:
  - `make setup` – Create virtual environment and install dependencies
  - `make lint` – Run linter (`ruff`) on `src/` and `notebooks/`
  - `make test` – Run unit tests using `pytest`
  - `make notebooks` – Start Jupyter Lab
  - `make git-clean-ignored` – Remove tracked files that are now ignored by `.gitignore`
  - `make help` – Show available commands with short descriptions

- `.gitignore` updated to exclude:
  - `data/`, `results/`, `notebooks/`
  - Python/venv/IDE-specific and common build artifacts

- Initial `CHANGELOG.md` following Keep a Changelog format

- Added `make log-change` target for automated changelog entries:
  - Usage: `make log-change target=setup desc="Initial setup of venv and deps"`

- Added my_test notebook
- Added start-juypterlab.sh to start daemon in a screen
  - multiserver setup mamba/dogo to enable https://dsr.inworld.net/lab (client cert is mandatory)
- Initial project setup
  - added some folders and files
  - pip freeze > requirements_pip_freeze.txt for discussing before running into trouble

## [Unreleased]

### Changed

### Deprecated

### Removed

### Fixed

### Security
