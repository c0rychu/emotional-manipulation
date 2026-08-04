# Install this repo's CLAUDE.md as Claude Code's user-level memory by symlink,
# so edits here take effect immediately without a copy step.
#
#   make install            -> ~/.claude/CLAUDE.md  (user-level, all projects)
#   make install DEST=...   -> any other path, e.g. DEST=/path/to/proj/CLAUDE.md
#   make uninstall          -> remove the symlink (only if it points here)

SRC  := $(abspath CLAUDE.md)
DEST ?= $(HOME)/.claude/CLAUDE.md

.PHONY: help install uninstall status

help:
	@echo "install    symlink $(DEST) -> $(SRC)"
	@echo "uninstall  remove $(DEST) if it is our symlink"
	@echo "status     show what $(DEST) currently is"
	@echo ""
	@echo "Override the target with: make install DEST=/some/where/CLAUDE.md"

install:
	@mkdir -p "$(dir $(DEST))"
	@# A real file there is someone's hand-written config: back it up, never clobber it.
	@if [ -e "$(DEST)" ] && [ ! -L "$(DEST)" ]; then \
		backup="$(DEST).bak.$$(date +%Y%m%d%H%M%S)"; \
		mv "$(DEST)" "$$backup"; \
		echo "backed up existing file -> $$backup"; \
	fi
	@# -n keeps us from creating a link *inside* an existing symlinked directory.
	@ln -sfn "$(SRC)" "$(DEST)"
	@echo "linked $(DEST) -> $(SRC)"

uninstall:
	@if [ "$$(readlink "$(DEST)" 2>/dev/null)" = "$(SRC)" ]; then \
		rm "$(DEST)"; \
		echo "removed $(DEST)"; \
	else \
		echo "not ours, leaving alone: $(DEST)"; \
	fi

status:
	@if [ -L "$(DEST)" ]; then \
		echo "symlink: $(DEST) -> $$(readlink "$(DEST)")"; \
	elif [ -e "$(DEST)" ]; then \
		echo "regular file (not a symlink): $(DEST)"; \
	else \
		echo "missing: $(DEST)"; \
	fi
