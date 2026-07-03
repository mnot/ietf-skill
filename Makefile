# IETF Agent Skills — install helper.
#
# This Makefile ONLY copies the Markdown skill directories into the skills
# folders of AI assistants you already have installed. It never installs
# software and never runs anything else. `pipx install ietf-llm` (needed only
# by the ietf-corpus skill) stays a manual step — see the README.
#
# Run it from a clone of this repository.

NORMS  := ietf-contributing ietf-interpreting
CORPUS := ietf-corpus

# Per-tool config directories, checked for presence. ~/.agents is deliberately
# left out of the sweep: several tools also read it, so auto-installing there
# could register a skill twice. Copy it there by hand if you want it.
TOOL_DIRS := \
	$(HOME)/.claude \
	$(HOME)/.gemini \
	$(HOME)/.cursor \
	$(HOME)/.copilot

# The subset of the above that actually exists right now.
PRESENT := $(foreach d,$(TOOL_DIRS),$(wildcard $(d)))

.DEFAULT_GOAL := list
.PHONY: list help install-norms install-corpus update uninstall

help: list
list:
	@echo "IETF Agent Skills — installer (copies Markdown only; installs no software)"
	@echo
	@echo "Detected assistant config dirs:"
	@if [ -z "$(PRESENT)" ]; then \
		echo "  (none found — looked in: $(TOOL_DIRS))"; \
	else \
		for d in $(PRESENT); do \
			printf "  %s/skills   installed:" "$$d"; \
			found=""; \
			for s in $(NORMS) $(CORPUS); do \
				[ -d "$$d/skills/$$s" ] && printf " %s" "$$s" && found=1; \
			done; \
			[ -z "$$found" ] && printf " (none)"; \
			echo; \
		done; \
	fi
	@echo
	@echo "Targets:"
	@echo "  make install-norms    copy ietf-contributing + ietf-interpreting into every detected dir"
	@echo "  make install-corpus   also copy ietf-corpus (then: pipx install ietf-llm; don't run alongside the hosted MCP)"
	@echo "  make update           git pull, then refresh whatever is already installed in each dir"
	@echo "  make uninstall        remove all three skills from every detected dir"

install-norms:
	@if [ -z "$(PRESENT)" ]; then echo "No assistant config dirs found; nothing to do (see README for manual paths)."; exit 0; fi
	@for d in $(PRESENT); do \
		mkdir -p "$$d/skills"; \
		for s in $(NORMS); do \
			rm -rf "$$d/skills/$$s"; \
			cp -R "$$s" "$$d/skills/"; \
			echo "installed $$s -> $$d/skills/"; \
		done; \
	done

install-corpus:
	@if [ -z "$(PRESENT)" ]; then echo "No assistant config dirs found; nothing to do (see README for manual paths)."; exit 0; fi
	@for d in $(PRESENT); do \
		mkdir -p "$$d/skills"; \
		for s in $(CORPUS); do \
			rm -rf "$$d/skills/$$s"; \
			cp -R "$$s" "$$d/skills/"; \
			echo "installed $$s -> $$d/skills/"; \
		done; \
	done
	@echo
	@echo "ietf-corpus needs the CLI:  pipx install ietf-llm"
	@echo "Use the CLI path OR the hosted ietf-llm MCP, not both (see README)."

update:
	git pull --ff-only
	@for d in $(PRESENT); do \
		for s in $(NORMS) $(CORPUS); do \
			if [ -d "$$d/skills/$$s" ]; then \
				rm -rf "$$d/skills/$$s"; \
				cp -R "$$s" "$$d/skills/"; \
				echo "refreshed $$s -> $$d/skills/"; \
			fi; \
		done; \
	done

uninstall:
	@for d in $(PRESENT); do \
		for s in $(NORMS) $(CORPUS); do \
			if [ -d "$$d/skills/$$s" ]; then \
				rm -rf "$$d/skills/$$s"; \
				echo "removed $$s from $$d/skills/"; \
			fi; \
		done; \
	done
