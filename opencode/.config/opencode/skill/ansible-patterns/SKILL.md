---
name: ansible-patterns
description: Ansible playbook patterns - simplicity, external files, system compatibility
---

## Philosophy

- Keep it dead simple - no mental gymnastics required
- Ansible IS the documentation - if someone can't understand it by reading the playbook, it's too complex
- Explicit and readable over clever and compact

## Shell Scripts and Complex Commands

- If a shell command gets complex, create a `.sh` file instead
- Multi-line shell blocks in tasks are a code smell - extract to script
- Script files are easier to test, debug, and maintain than inline commands
- Reference the script file from the task

## Templates and Files

- Always use actual files and Jinja2 templates - reference them from tasks
- Never write file contents directly in task YAML
- Template files go in `templates/`, static files in `files/`
- Leverage Jinja2 templating when it makes sense for dynamic content

## System Compatibility

- **Critical**: When writing shell commands, verify the tools/CLI actually exist on target systems
- Don't install missing tools just to make your command work - find a workaround
- Use built-in system tools and common utilities that are guaranteed to be present
- Test against the actual target OS - what works on Ubuntu might not work on CentOS

## Task Design

- One task, one purpose - don't chain multiple operations in a single task
- Use descriptive task names that explain what's happening
- Add comments for non-obvious logic
- Use `changed_when` and `failed_when` to make tasks idempotent and clear
- Use msg where appropriate with outputs to better understand a task running in front of a user

## Anti-Patterns

- Multi-line shell commands in YAML - extract to script if it reaches more than 15-20 lines
- Writing file contents directly in tasks
- Installing tools just to run one command
- Clever one-liners that require decoding
- Tasks that do multiple unrelated things
- Assuming tools exist without verification
