# Code Quality Check

A Ruby on Rails gem that enforces automated code quality checks via Git hooks using [Overcommit](https://github.com/sds/overcommit). It runs **RuboCop**, **Brakeman**, **Rails Best Practices**, and **BundleAudit** on every commit to catch style, security, and architectural issues before they enter the codebase.

## Features

| Tool | Purpose |
|------|---------|
| **RuboCop** | Static code analysis based on the community Ruby style guide |
| **Brakeman** | Security vulnerability scanner for Rails applications |
| **Rails Best Practices** | Code metric tool that checks Rails architectural patterns |
| **BundleAudit** | Checks Gemfile.lock for known vulnerable gem versions (CVEs) |
| **Overcommit** | Git hook framework that orchestrates all checks on pre-commit |

Additional checks enabled by default:
- **AuthorName** / **AuthorEmail** — Ensures commits have valid author metadata
- **BrokenSymlinks**, **CaseConflicts**, **MergeConflicts** — Prevents common Git issues
- **TrailingWhitespace** — Disabled by default (configurable in `.overcommit.yml`)

Optional hooks (disabled by default; add the gem and enable in `.overcommit.yml`):
- **Reek** — Code smell detection
- **Flay** — Code duplication detection
- **Fasterer** — Performance improvement suggestions

---

## Requirements

- **Ruby** >= 3.1.0
- **Rails** (any recent version)
- **Overcommit** (add as a peer dependency in your Gemfile)

---

## Installation

### 1. Add the gems to your Gemfile

```ruby
# Gemfile
gem 'overcommit', '~> 0.30'
gem 'code_quality_check', '~> 0.1.6'
```

The gem includes RuboCop, Brakeman, Rails Best Practices, RuboCop Performance, and Bundler Audit. You only need to add `overcommit` separately.

### 2. Install dependencies

```bash
bundle install
```

### 3. Run the installer generator

```bash
rails generate code_quality_check:install
```

This generator will:

1. Run `bundle exec overcommit --install` to set up Overcommit
2. Create `config/initializers/code_quality_check.rb` — Rails initializer that verifies the gem is installed and ensures Overcommit hooks are set up in development/test
3. Create `.overcommit.yml` — Overcommit hook configuration (RuboCop, Brakeman, Rails Best Practices, BundleAudit, etc.)
4. Create `.rubocop.yml` — RuboCop style configuration
5. Copy pre-commit and post-checkout hook entrypoints to `.git/hooks/`

### 4. Sign the hooks (first-time setup)

```bash
bundle exec overcommit --sign
```

### Gem verification (initializer)

The initializer (`config/initializers/code_quality_check.rb`) does two things:

1. **Checks that the `code_quality_check` gem is installed**  
   If a developer clones the repo and runs the app without having the gem in their bundle, Rails will **raise an error** at boot with instructions to add the gem to the Gemfile and run the installer. This ensures the team doesn’t silently skip code quality tooling.

2. **Ensures Overcommit hooks are present (development/test only)**  
   If the `.git/hooks/pre-commit` hook is missing, it runs `bundle exec overcommit --install` and signs the hooks so pre-commit checks run on the next commit.

---

## Usage

### Automatic checks on commit

Once installed, every `git commit` triggers the pre-commit hooks. If any check fails, the commit is blocked until issues are fixed.

### Running checks manually

```bash
# Run all Overcommit hooks
bundle exec overcommit --run

# Run individual tools
bundle exec rubocop
bundle exec brakeman --skip-libs -w3
bundle exec rails_best_practices
bundle exec bundle-audit check
```

### Temporarily disabling hooks

Hooks run in the developer’s environment, so they can be skipped with:

```bash
OVERCOMMIT_DISABLE=1 git commit -m "WIP: bypass checks"
```

To enforce quality even when someone bypasses local hooks, run the same checks in **CI** (e.g. `bundle exec overcommit --run` or individual tools) and use branch protection so commits must pass CI before merge.

---

## Configuration

### Overcommit (`.overcommit.yml`)

You can enable/disable hooks and adjust behavior in `.overcommit.yml`. For example:

```yaml
PreCommit:
  RuboCop:
    enabled: true
  RailsBestPractices:
    enabled: true
  Brakeman:
    enabled: true
  BundleAudit:
    enabled: true
  TrailingWhitespace:
    enabled: false
```

To use optional hooks (Reek, Flay, Fasterer), add the gem to your Gemfile and set `enabled: true` for the corresponding hook in `.overcommit.yml`.

See [Overcommit configuration docs](https://github.com/sds/overcommit#configuration) for options.

### RuboCop (`.rubocop.yml`)

The installer creates a relaxed `.rubocop.yml` suitable for many projects. Customize it for your team's style (line length, complexity limits, exclusions, etc.).

---

## Uninstalling

To remove code quality checks from your project:

```bash
rails generate code_quality_check:uninstall
```

This will:

1. Remove `config/initializers/code_quality_check.rb`
2. Remove `.overcommit.yml`
3. Remove `.rubocop.yml`
4. Run `bundle exec overcommit --uninstall`

---

## Project structure (generated files)

| File | Purpose |
|------|---------|
| `config/initializers/code_quality_check.rb` | Verifies `code_quality_check` gem is installed; in development/test, installs Overcommit hooks if `.git/hooks/pre-commit` is missing |
| `.overcommit.yml` | Overcommit hook configuration (RuboCop, Brakeman, Rails Best Practices, BundleAudit, etc.) |
| `.rubocop.yml` | RuboCop style and lint configuration |
| `.git/hooks/pre-commit` | Git pre-commit hook (Overcommit entrypoint) |
| `.git/hooks/post-checkout` | Git post-checkout hook (Overcommit entrypoint) |

---

## Development

### Setup

```bash
bin/setup
```

### Run RuboCop

```bash
bundle exec rake rubocop
# or
bundle exec rubocop
```

### Console

```bash
bin/console
```

### Installing the gem locally

```bash
bundle exec rake install
```

### Releasing a new version

1. Bump the version in `lib/code_quality_check/version.rb`
2. Run `bundle exec rake release` to create a git tag, push commits, and publish to [RubyGems](https://rubygems.org)

---

## Contributing

Bug reports and pull requests are welcome on [GitHub](https://github.com/aniruddhami/code_quality_check/issues).

---

## License

This gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
