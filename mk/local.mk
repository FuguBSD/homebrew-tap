# mk/local.mk: the consumer hook of this repository (MK-LOCAL).
# sync never touches this file. The brew gate lives here.

BREW		?= brew
TAP		= fugubsd/tap
FORMULAE	= fugu fugubench fuguseed fuguvm fuguweb

CHECK_TARGETS	+= brew-check

# The gate reads the formulae of this checkout, so it links the
# checkout as the tap directory of brew when no tap is there. Each
# formula then installs from source, runs its test block, and
# passes the strict audit.
brew-check:
	@dir=$$($(BREW) --repository $(TAP)); \
	mkdir -p "$$(dirname "$$dir")"; \
	test -e "$$dir" || ln -s "$(CURDIR)" "$$dir"
	@for f in $(FORMULAE); do \
		$(BREW) install $(TAP)/$$f || exit 1; \
		$(BREW) test $(TAP)/$$f || exit 1; \
	done
	@$(BREW) audit --strict --tap $(TAP)

.PHONY: brew-check
