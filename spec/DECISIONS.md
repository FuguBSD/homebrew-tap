# Decisions

This document holds the decisions that govern homebrew-tap. A plan must not go
against a decision. To change a decision, propose the change and get human
approval first.

| ID   | Decision                                                   | Rationale                                                                   |
| ---- | ---------------------------------------------------------- | --------------------------------------------------------------------------- |
| D-01 | The tap installs from source. No formula carries a bottle. | A binary package needs a build matrix that no need asks for.                |
| D-02 | A formula carries no `version` line.                       | The bump changes two lines: `url` and `sha256`.                             |
| D-03 | The formulae use the Homebrew perl, not the system perl.   | The system perl of macOS is 5.30 or 5.34, and FuguVM and FuguWeb need 5.36. |
