i.PHONY: setup lint test notebooks git-clean-ignored help

help:
	@echo ""
	@echo "📦 Project Makefile – Available commands:"
	@echo ""
	@echo "  make setup               Create virtual environment and install dependencies"
	@echo "  make lint                Run linter (ruff)"
	@echo "  make test                Run unit tests (pytest)"
	@echo "  make notebooks           Start Jupyter Lab"
	@echo "  make git-clean-ignored   Remove tracked files now ignored by .gitignore"
	@echo ""

setup:
	@echo "🔧 Setting up virtual environment and installing dependencies..."
	@python3 -m venv .venv
	@source .venv/bin/activate && pip install --upgrade pip && pip install -r requirements.txt

lint:
	@echo "🔍 Running ruff linting..."
	@ruff src/ notebooks/

test:
	@echo "🧪 Running tests with pytest..."
	@pytest

notebooks:
	@echo "📓 Starting Jupyter Lab..."
	@jupyter lab

git-clean-ignored:
	@echo "🔍 Finding tracked files that are now ignored..."
	@git ls-files --cached --ignored --exclude-standard > .tmp_gitignored
	@if [ -s .tmp_gitignored ]; then \
		echo "🧹 Removing from Git index (but keeping on disk):"; \
		cat .tmp_gitignored; \
		cat .tmp_gitignored | xargs git rm --cached; \
		rm .tmp_gitignored; \
		echo "✅ Done. Now commit the changes."; \
	else \
		echo "✅ No ignored, tracked files found."; \
		rm .tmp_gitignored; \
	fi

log-change:
	@echo "📝 Logging change to CHANGELOG.md..."
	@echo "" >> CHANGELOG.md
	@echo "### [`$$(date +%Y-%m-%d)`] - Auto Log Entry" >> CHANGELOG.md
	@echo "- Target: $(target)" >> CHANGELOG.md
	@echo "- Description: $(desc)" >> CHANGELOG.md
	@echo "✅ Entry added to CHANGELOG.md"

changelog:
	@echo "📖 Showing last changelog entries:"
	@tail -n 20 CHANGELOG.md
