# The Homebrew tap

The tap holds one formula for each repository that releases a Perl distribution,
and a gate that installs each formula. Tooling WFL-BREW states the release side:
the release workflow of each distribution bumps its formula. This document
specifies the formula shape and the gate.

<a id="tap-formula"></a>

## The formulae

- **TAP-FORMULA-1** — The tap must hold one formula for each release repository:
  Fugu, FuguVM, FuguWeb, FuguBench and FuguSeed. The formula name must be the
  repository name in lower case, and the path must be `Formula/<name>.rb`.
- **TAP-FORMULA-2** — The `url` line must name the versioned tarball
  `<dist>-<version>.tar.gz` of the GitHub release. The `sha256` line must hold
  the digest of that tarball.
- **TAP-FORMULA-3** — A formula must carry no `version` line. Homebrew reads the
  version from the file name, and the bump of Tooling WFL-BREW changes the `url`
  line and the `sha256` line alone.
- **TAP-FORMULA-4** — Each formula must depend on the Homebrew `perl`, with
  `depends_on "perl"`. The system perl of macOS is 5.30 or 5.34, and the floors
  of the distributions are 5.34 and 5.36.
- **TAP-FORMULA-5** — Each CPAN prerequisite outside the core must be a
  `resource` of the formula, and the resources must install in dependency order.
- **TAP-FORMULA-6** — Each `App-` formula must depend on `fugubsd/tap/fugu`, and
  must put the module tree of Fugu on the `PERL5LIB` of its wrapper.
- **TAP-FORMULA-7** — Each runtime program that the executable runs must be a
  `depends_on` of the formula.
- **TAP-FORMULA-8** — Each `test do` block must run the executable of the
  distribution, or must load a module of Fugu.

<a id="tap-gate"></a>

## The brew gate

- **TAP-GATE-1** — `mk/local.mk` must add `brew-check` to `CHECK_TARGETS`, so
  `make check` runs the gate.
- **TAP-GATE-2** — The gate must install each formula from source, must run
  `brew test` on each one, and must run `brew audit --strict` on the tap.
- **TAP-GATE-3** — The check workflow must run `make check` on `macos-latest`,
  and must run the sync drift job of every consumer.
- **TAP-GATE-4** — The check workflow must run on each push to `main`. A push
  over the deploy key raises the push event, so the gate runs after each bump,
  and a broken formula turns `main` red.
