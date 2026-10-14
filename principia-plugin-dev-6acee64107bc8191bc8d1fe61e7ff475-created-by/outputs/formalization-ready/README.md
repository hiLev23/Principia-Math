# Principia formalization bundle

These files are prepared for the public repository `hiLev23/Principia-Math`. Copy the contents of this folder into the repository root, preserving the `.github/workflows` directory, then commit them to `main`.

## Contents

- `Challenge.lean` — the trusted theorem statement from Principia. Its `sorry` is an intentional comparator placeholder.
- `Solution.lean` — the Lean-checked proof assembled by Principia harness run `d602ba56`.
- `comparator.json` — identifies `principia_goal` and its allowed standard axioms.
- `formalization.yaml` — project metadata from Principia's Machine Verification files.
- `lakefile.toml`, `lean-toolchain`, `lake-manifest.json` — pinned Lean 4.35.0 / Mathlib v4.35.0 project setup.
- `.github/workflows/comparator.yml` — runs Mathlib cache setup and `lake comparator --paranoid` on pushes, pull requests, and manual dispatches.
- `LICENSE` — Apache-2.0, consistent with the project metadata.

After the commit appears on GitHub, set Principia's comparator workflow path to `.github/workflows/comparator.yml`, then refresh formalization status. The workflow runs the kernel comparison; it does not establish that the Lean theorem faithfully captures every intended financial assumption, which still needs mathematical review.

The core proof files were copied from the project's Machine Verification area. The workflow uses Lean 4.35's built-in `lake comparator` command; see the [Lean 4.35 release notes](https://lean-lang.org/doc/reference/latest/releases/v4.35.0/).
