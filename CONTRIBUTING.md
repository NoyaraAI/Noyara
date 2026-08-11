# Contributing

Use `development` for integration, `preview` for pre-production validation, and `main` for production. Create focused branches from `development` and open pull requests back to it; production promotions go through `preview` and then `main`.

## Local checks

```sh
npm ci
npx tsc --noEmit
npx expo export --platform web
```

Follow Conventional Commits, update documentation for behavior changes, and include verification steps in every pull request. Report vulnerabilities according to [SECURITY.md](SECURITY.md), not in public issues.
