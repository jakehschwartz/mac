# User CLAUDE.md

## Working Style

When starting a task, minimize exploration time. If you've read more than 10 files without producing any code changes, pause and ask the user for direction or start implementing with what you know.

## Implementation Guidelines

When implementing changes, always check for related cleanup: remove unused variables, dead imports, and leftover references that become unnecessary after the primary change.

## Testing

When working with tests that fail to compile (especially in Scala/Java), verify object construction matches the actual class signatures before writing test code. Read the model/case class definitions first.

## Project Knowledge Graph

You have access to a project knowledge graph via the `megamemory` MCP server and skill tool. You have no implicit memory of this project between sessions, so this graph is your only continuity for codebase concepts, architecture, and the relationships between them.

**Scope: codebases and architecture only.** Record what the code is and how it fits together: services, modules, data flow, integration points, and design decisions that explain the code. Do NOT record workflow, tooling, or automation (skills, Jira/Slack/Pinrail setup, personal process, task status). That belongs in skills, CLAUDE.md, or auto-memory.

**Workflow: understand → work → update**

1. **Session start:** call `megamemory:list_roots` before you begin work.
2. **Before each task:** call `megamemory:understand` before reading source files for project understanding.
3. **After each task:** if the task changed or revealed codebase or architecture knowledge, call `megamemory:create_concept`, `megamemory:update_concept` or `megamemory:link` for it. Skip this for tasks that only touched workflow or tooling.

Be specific in summaries: include parameter names, defaults, file locations, and rationale. Keep concepts max 3 levels deep.
