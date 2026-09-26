# homebrew-tap

The Homebrew tap of the FuguBSD organization. `brew install fugubsd/tap/<name>`
installs a Perl distribution of the organization from its GitHub release, and
`brew upgrade` carries each update.

The release workflow of each distribution bumps its formula, per Tooling
WFL-BREW. The specification in [spec/](spec/index.md) states the formula shape
and the gate. No hand edits a formula after a release.

## Commands

```sh
make deps        # install gitleaks into ~/.local/bin
make check       # run every gate; run it before each commit
make brew-check  # install, test and audit each formula
```
