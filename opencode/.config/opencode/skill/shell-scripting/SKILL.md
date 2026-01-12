---
name: shell-patterns
description: Shell scripting patterns - portability, explicit error handling, readability over cleverness
---

## Philosophy

- Shell scripts should be obvious
- Portability matters - your script will run on systems you don't control
- Explicit error handling - scripts shouldn't silently fail halfway through

## Shebang and Compatibility

- Use `#!/usr/bin/env bash` for portability, not `#!/bin/bash`
- If you need bash-specific features, use bash - don't try to make it POSIX when it's not
- For truly portable scripts, stick to POSIX sh and test on different shells
- Target systems will always be Linux by default unless explicitly told otherwise

## Functions

- Use functions for repeated logic - don't copy-paste the same shit
- Name functions clearly - `backup_config` not `bc`
- Keep functions focused - one job per function
- Return meaningful exit codes (0 for success, non-zero for failure)

## Variables

- Use `"${var}"` instead of `$var` - quote everything unless you want word splitting
- UPPER_CASE for environment/global vars, lower_case for local/function vars
- `local` keyword for function variables - don't pollute global scope
- Check if vars are set before using: `${var:-default}` or explicit checks

## Commands and Tools

- **Never** assume a non-default tool exists - ask user before
- Prefer common POSIX tools over GNU-specific extensions when possible
- Use command substitution `$(command)` instead of backticks - it's more readable

## Loops and Arrays

- Use `while read` for processing command output line by line
- Arrays in bash: `arr=("one" "two")` - but remember they're bash-specific
- Loop over files safely: `for file in *.txt; do [[ -e "$file" ]] || continue`
- Avoid parsing `ls` output - use globs or `find` with `-print0` and `while read -d ''`

## Output and Logging

- Use `echo` for simple output, `printf` when you need formatting
- stderr for errors: `echo "Error message" >&2`

## Anti-Patterns

- Not quoting variables - guaranteed to break with spaces
- Parsing `ls` output instead of using proper tools
- Ignoring error codes and letting scripts continue after failures
- Using `cd` without checking if it succeeded
- Not cleaning up temporary files
