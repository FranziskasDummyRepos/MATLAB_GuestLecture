# Beginner MATLAB Image Analysis

This repository is a small practice project for the *Modern Optronics
Workflows* guest lectures at Hochschule Aalen.

How could a computer detect coins in an image and count them? Start by
exploring the built-in Image Processing Toolbox image `coins.png` in a
short live script. Count the coins by eye and discuss what distinguishes
them from the background before looking at an automatic solution.

The project is intended for students who are new to MATLAB. The goal is
to practice a simple, reproducible workflow with MATLAB and GitHub.

## Requirements

- MATLAB R2026a
- Image Processing Toolbox

For the source-control lecture, you also need a GitHub account and a
personal access token stored in the MATLAB vault.

## Quick start

1. Open this repository folder in MATLAB.
2. Open [src/introduceCoins.m](src/introduceCoins.m) in MATLAB's Live
   Editor. It is a text-based live script with an `.m` extension; MATLAB
   R2026a recognises its rich text format when you open it.
3. Click inside **Open the image** and select **Run Section**. The two
   commands load and display the image. **Run** executes the whole script.
4. Read the discussion prompts, record your own coin count, and propose
   one detection rule and a situation where it might fail.

## Next: explore an automatic solution

After the discussion, return to the repository root folder in MATLAB and
run these commands in the Command Window:

```matlab
addpath("src")
results = analyzeCoins
```

The function separates bright and dark regions, removes small regions,
and counts the remaining objects. Compare `results.ObjectCount` with
your manual count. Look at the original and binary images: does every
coin appear as one separate white region? Are any coins missing or joined
together? A matching count alone does not prove that every coin was
detected correctly.

## Folder layout

- [src/introduceCoins.m](src/introduceCoins.m) introduces the goal and
  invites students to develop detection ideas.
- [src/analyzeCoins.m](src/analyzeCoins.m) contains the existing
  image-analysis solution to explore after the discussion.
- `AGENTS.md` contains rules for coding agents and Git work.
- [docs/matlabGitCheatsheet.m](docs/matlabGitCheatsheet.m) is a runnable
  live-script guide to MATLAB Git commands and token storage. Run one
  section at a time; its action switches are initially `false`.

## First changes to try

Make one small change, run the relevant script or function, and inspect
the result before committing it.

- Improve a question or explanation in the introductory live script.
- Change the default `minimumArea` value in `analyzeCoins`.
- Change the title of one displayed image.
- Add a result field that reports the largest detected object area.

Do not commit generated figures, screenshots, tokens, or MATLAB recovery
files.
