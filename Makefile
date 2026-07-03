# IETF Agent Skills — install + release helper.
#
# The install targets ONLY copy the Markdown skill directories into the skills
# folders of AI assistants you already have installed. They install no software
# and run nothing else.
#
# The version/release targets are adapted from mnot/pyproject-tmpl, minus the
# Python bits: the version lives in the VERSION file, `check` is the no-Python
# analogue of typecheck/lint/test, and `release` tags from a git-log changelog.
#
# Run it from a clone of this repository.

SKILLS := ietf-contributing ietf-interpreting

VERSION    := $(shell cat VERSION 2>/dev/null)
VERSIONING ?= patch          # patch | minor | major — bump flavour for `make version`

# Per-tool skills dirs, installed where present. ~/.agents is Codex's personal
# dir (and a vendor-neutral location some other tools also read).
TOOL_DIRS := \
	$(HOME)/.claude \
	$(HOME)/.agents \
	$(HOME)/.gemini \
	$(HOME)/.cursor \
	$(HOME)/.copilot

# The subset of the above that actually exists right now.
PRESENT := $(foreach d,$(TOOL_DIRS),$(wildcard $(d)))

.DEFAULT_GOAL := list
.PHONY: list help install update uninstall \
	check version version-major version-minor version-patch changelog release

help: list
list:
	@echo "IETF Agent Skills — version $(VERSION) (install copies Markdown only; installs no software)"
	@echo
	@echo "Detected assistant config dirs:"
	@if [ -z "$(PRESENT)" ]; then \
		echo "  (none found — looked in: $(TOOL_DIRS))"; \
	else \
		for d in $(PRESENT); do \
			printf "  %s/skills   installed:" "$$d"; \
			found=""; \
			for s in $(SKILLS); do \
				[ -d "$$d/skills/$$s" ] && printf " %s" "$$s" && found=1; \
			done; \
			[ -z "$$found" ] && printf " (none)"; \
			echo; \
		done; \
	fi
	@echo
	@echo "Install targets:"
	@echo "  make install          copy the skills into every detected dir"
	@echo "  make update           git pull, then refresh whatever is already installed in each dir"
	@echo "  make uninstall        remove the skills from every detected dir"
	@echo
	@echo "Release targets:"
	@echo "  make check            validate every SKILL.md (name matches dir, description <= 1024 chars)"
	@echo "  make version          bump VERSION ($(VERSIONING)) and commit — also version-minor / version-major"
	@echo "  make changelog        list commit subjects since the last tag"
	@echo "  make release          tag v$(VERSION) from the changelog and push the tag"

install:
	@if [ -z "$(PRESENT)" ]; then echo "No assistant config dirs found; nothing to do (see README for manual paths)."; exit 0; fi
	@for d in $(PRESENT); do \
		mkdir -p "$$d/skills"; \
		for s in $(SKILLS); do \
			rm -rf "$$d/skills/$$s"; \
			cp -R "$$s" "$$d/skills/"; \
			echo "installed $$s -> $$d/skills/"; \
		done; \
	done

update:
	git pull --ff-only
	@for d in $(PRESENT); do \
		for s in $(SKILLS); do \
			if [ -d "$$d/skills/$$s" ]; then \
				rm -rf "$$d/skills/$$s"; \
				cp -R "$$s" "$$d/skills/"; \
				echo "refreshed $$s -> $$d/skills/"; \
			fi; \
		done; \
	done

uninstall:
	@for d in $(PRESENT); do \
		for s in $(SKILLS); do \
			if [ -d "$$d/skills/$$s" ]; then \
				rm -rf "$$d/skills/$$s"; \
				echo "removed $$s from $$d/skills/"; \
			fi; \
		done; \
	done

# ---- Validate, version, release ----

# The no-Python gate: check each SKILL.md's name matches its directory, is
# well-formed, and has a description within the 1024-char spec limit.
check:
	@ok=1; \
	for d in $(SKILLS); do \
		f="$$d/SKILL.md"; \
		[ -f "$$f" ] || { echo "$$d: missing SKILL.md"; ok=0; continue; }; \
		name=$$(awk -F': ' '/^name:/{print $$2; exit}' "$$f"); \
		[ "$$name" = "$$d" ] || { echo "$$f: name '$$name' != dir '$$d'"; ok=0; }; \
		printf '%s' "$$name" | grep -qE '^[a-z0-9]+(-[a-z0-9]+)*$$' || { echo "$$f: name '$$name' not lowercase-hyphen"; ok=0; }; \
		grep -q '^description:' "$$f" || { echo "$$f: no description"; ok=0; }; \
		dlen=$$(awk '/^description:/{sub(/^description: /,""); print length($$0); exit}' "$$f"); \
		[ "$$dlen" -le 1024 ] || { echo "$$f: description $$dlen > 1024"; ok=0; }; \
	done; \
	if [ "$$ok" = 1 ]; then echo "skills valid (version $(VERSION))"; else echo "check FAILED"; exit 1; fi

version: version-$(VERSIONING)

version-major version-minor version-patch: version-%: check
	@[ -n "$(VERSION)" ] || { echo "no VERSION file"; exit 1; }; \
	maj=$$(echo "$(VERSION)" | cut -d. -f1); \
	min=$$(echo "$(VERSION)" | cut -d. -f2); \
	pat=$$(echo "$(VERSION)" | cut -d. -f3); \
	case "$*" in \
		major) new="$$((maj+1)).0.0";; \
		minor) new="$$maj.$$((min+1)).0";; \
		patch) new="$$maj.$$min.$$((pat+1))";; \
	esac; \
	echo "$$new" > VERSION; \
	git add VERSION; \
	git commit -m "bump version to $$new"; \
	echo "bumped $(VERSION) -> $$new"

changelog:
	@prev=$$(git tag --sort=-version:refname -l 'v*' | head -1); \
	if [ -n "$$prev" ]; then range="$$prev..HEAD"; else range="HEAD"; fi; \
	git --no-pager log --no-merges --pretty="- %s" $$range

release: check
	@v="$(VERSION)"; \
	[ -n "$$v" ] || { echo "no VERSION file"; exit 1; }; \
	if git rev-parse -q --verify "refs/tags/v$$v" >/dev/null; then echo "tag v$$v already exists"; exit 1; fi; \
	prev=$$(git tag --sort=-version:refname -l 'v*' | head -1); \
	if [ -n "$$prev" ]; then range="$$prev..HEAD"; else range="HEAD"; fi; \
	{ echo "v$$v"; echo; git --no-pager log --no-merges --pretty="- %s" $$range; } > .changelog.tmp; \
	git tag -a "v$$v" -F .changelog.tmp; \
	rm -f .changelog.tmp; \
	git push origin "v$$v"; \
	echo "released v$$v"
