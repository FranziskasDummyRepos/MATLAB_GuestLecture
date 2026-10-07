# Project guidance

This is a beginner MATLAB image-analysis project using the built-in
Image Processing Toolbox image `coins.png`.

## Working style

- Explain proposed changes in plain language before editing.
- Make one small, focused change at a time.
- Prefer clear MATLAB code over compact or advanced code.
- Do not add toolboxes, packages, classes, or data files.
- Keep `analyzeCoins.m` runnable from a fresh MATLAB session.
- Run changed code after every code change and inspect its displayed output.
- For detection changes, compare the reported count with a manual count
  and inspect whether the binary image matches the visible coins.
- Report what changed, what you observed, and any discrepancies.
- Keep the introductory live script focused on observation and discussion;
  do not add the detection solution or expected count to it.

## Project boundaries

- Work only in `src/` and documentation when needed.
- Preserve the public interface:
  `results = analyzeCoins(minimumArea,showFigure)`.
- Do not change default values without explaining why.
- Do not edit `.gitignore` or repository metadata unless asked.

## Git workflow

- Do not use terminal Git commands, Git GUIs, or edit `.git` files.
- Use MATLAB Git commands only: `gitclone`, `gitrepo`, `status`, `add`,
  `commit`, `push`, `pull`, and `log`.
- Never access, print, store, or commit tokens or other secrets.
- Only commit or push after confirmation. Propose a commit message and wait for the
  user.
- Inspect repository status before and after changes.
- Stage only files relevant to the current change.

## Commit messages

- Make one logical change per commit.
- Use an imperative verb plus the changed behavior.
- Keep the first line under 60 characters and omit the final period.
- Describe what changed, not vague activity or the agent used.

Good examples:

- `Add binary image display`
- `Filter small background objects`
- `Report mean coin area`
- `Explain coin detection goal`
- `Fix threshold for dark regions`

Avoid:

- `changes`
- `update code`
- `fix`
- `copilot change`
- `final version`
