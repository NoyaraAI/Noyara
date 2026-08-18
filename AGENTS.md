# Agent guidance

## Expo has changed

Read the exact versioned docs at https://docs.expo.dev/versions/v57.0.0/ before writing any Expo code.
Use the matching official Expo skill before changing routing, native UI, upgrades, hosting, or store configuration.

### 1. Think Before Coding

**Don't assume. Don't hide confusion. Surface tradeoffs.**

LLMs often pick an interpretation silently and run with it. This principle forces explicit reasoning:

- **State assumptions explicitly** — If uncertain, ask rather than guess
- **Present multiple interpretations** — Don't pick silently when ambiguity exists
- **Push back when warranted** — If a simpler approach exists, say so
- **Stop when confused** — Name what's unclear and ask for clarification

### 2. Simplicity First

**Minimum code that solves the problem. Nothing speculative.**

Combat the tendency toward overengineering:

- No features beyond what was asked
- No abstractions for single-use code
- No "flexibility" or "configurability" that wasn't requested
- No error handling for impossible scenarios
- If 200 lines could be 50, rewrite it

**The test:** Would a senior engineer say this is overcomplicated? If yes, simplify.

### 3. Surgical Changes

**Touch only what you must. Clean up only your own mess.**

When editing existing code:

- Don't "improve" adjacent code, comments, or formatting
- Don't refactor things that aren't broken
- Match existing style, even if you'd do it differently
- If you notice unrelated dead code, mention it — don't delete it

When your changes create orphans:

- Remove imports/variables/functions that YOUR changes made unused
- Don't remove pre-existing dead code unless asked

**The test:** Every changed line should trace directly to the user's request.

### 4. Goal-Driven Execution

**Define success criteria. Loop until verified.**

Transform imperative tasks into verifiable goals:

| Instead of... | Transform to... |
|--------------|-----------------|
| "Add validation" | "Write tests for invalid inputs, then make them pass" |
| "Fix the bug" | "Write a test that reproduces it, then make it pass" |
| "Refactor X" | "Ensure tests pass before and after" |

For multi-step tasks, state a brief plan:

```
1. [Step] → verify: [check]
2. [Step] → verify: [check]
3. [Step] → verify: [check]
```

Strong success criteria let the LLM loop independently. Weak criteria ("make it work") require constant clarification.

## Engineering principles

- Prefer simple, readable, flat code with minimal indirection.
- Search for existing implementations and installed libraries before creating new helpers or abstractions.
- Abstract when it prevents meaningful drift and makes the result simpler to maintain. Avoid speculative or one-use abstraction layers.
- Install Expo-compatible dependencies with `npx expo install`.
- Use Expo Router APIs for routing and navigation. Do not import React Navigation packages directly in application code.
- Prefer universal React Native code. Add platform-specific files only for genuine platform differences.
- Use `@expo/ui` when native SwiftUI or Jetpack Compose controls provide a concrete benefit.
- Keep secrets out of the client bundle. Values prefixed with `EXPO_PUBLIC_` are public.
- Use idiomatic TypeScript and validate untrusted data at trust boundaries.
- Prefer established project helpers and libraries over hand-rolled implementations.
- Verify user-visible changes on every affected platform available locally and report any platform not tested.

## Log papercuts

When small, non-blocking repository friction occurs — confusing setup, a reproducibly flaky repository command, stale generated files, a misleading in-repo error, or a non-obvious gotcha — use the `papercuts` skill and append it to `.agents/PAPERCUTS.md` in the moment. Continue the current task. Environment failures, transient flakiness, real bugs, and sensitive data are not papercuts.

Do not mine an entire session for papercuts or start a broad cleanup unless the user explicitly asks.

## Architecture and data standards

- Use an i18n architecture from the start: no user-facing strings in business logic, and locale-aware formatting at presentation boundaries.
- Use BCP 47 locale identifiers and locale-aware presentation formatting.
- Accessibility: WCAG 2.2 AA. Mobile security: OWASP MASVS as applicable.
- Use Semantic Versioning and Conventional Commits. Use `camelCase` for variables/functions, `PascalCase` for components/types, and kebab-case for URL paths.
