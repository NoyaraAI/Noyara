---
name: noyara-merge-ready
description: Prepare a Noyara change or branch for the maintainer's final review. Use when asked to make work merge-ready, review a branch, prepare a pull request, or complete verification before handoff.
---

# Noyara Merge Ready

Take the current work to a verified handoff. Never merge, push, publish, or open a pull request unless the user explicitly asks.

## 1. Establish scope

- Read `AGENTS.md` and the files touched by the change.
- Use `development` as the normal comparison branch. Use another base only when the user names it or the work is a promotion between `development`, `preview`, and `main`.
- Review committed, staged, unstaged, and relevant untracked files. Preserve pre-existing user changes.

## 2. Review the change

Check only issues supported by the diff and surrounding call paths:

1. Unnecessary complexity, unused scaffolding, duplicated helpers, and unrelated edits.
2. Expo SDK 57, Expo Router, React Native, and `@expo/ui` correctness. Consult the matching official Expo skill and versioned documentation.
3. iOS, Android, and web behavior, including accessibility, localization boundaries, and platform-specific fallbacks.
4. Privacy and security: embedded secrets, unsafe `EXPO_PUBLIC_` values, permissions, deep links, untrusted input, and data loss.
5. Release quality: logs, TODOs, generated artifacts, documentation, and CI coverage.

Trace callers before proposing a bug fix. Reject theoretical findings that do not apply to the current product or change.

## 3. Fix verified findings

- Fix blockers and clear correctness issues with the smallest coherent change.
- Add one focused regression check for non-trivial logic or a reproduced bug.
- Do not refactor adjacent code or add speculative infrastructure.

## 4. Verify

- Run `npm run check` until it passes.
- For user-visible changes, exercise every affected platform available locally and capture screenshots when useful.
- State any platform that was not tested. Never report an unrun check as passing.
- Re-read the final diff and run `git diff --check`.

## 5. Hand off

Report:

- what changed and why;
- exact automated and manual verification performed;
- untested platforms or remaining maintainer decisions;
- whether the branch is ready for final review.
