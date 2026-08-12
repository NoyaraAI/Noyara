# Contributing

Use `development` for integration, `preview` for pre-production validation, and `main` for production. Create focused branches from `development` and open pull requests back to it; production promotions go through `preview` and then `main`.

## Local checks

```sh
npm ci
npm run check
```

## Agent tooling

Claude also enables Expo's plugin through `.claude/settings.json`. The required Expo workflows are committed as project-local skills so other Agent Skills-compatible tools discover the same guidance.

Project-local skills live in `.agents/skills`:

- `humanizer` edits prose without inventing facts.
- `papercuts` records reproducible repository friction without derailing the current task.
- `noyara-merge-ready` reviews and verifies a branch before maintainer handoff.
- `expo-router`, `expo-native-ui`, `expo-ui`, `expo-upgrade`, and `eas-hosting` provide official Expo guidance for the framework features this repository uses.

Follow Conventional Commits, update documentation for behavior changes, and include verification steps in every pull request. Report vulnerabilities according to [SECURITY.md](SECURITY.md), not in public issues.
