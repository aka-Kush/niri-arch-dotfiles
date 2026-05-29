---
name: file-notetaking
description: Use when the user points to a file containing rough words, bullets, or pointers and asks to replace that file with clean human-style markdown notes based only on those points.
---

# File Notetaking Skill

Create clean notes from an existing file that contains rough words, bullets, phrases, or pointers.

## Main Goal

Read the pointed file, understand the rough points inside it, and replace the file content with clear, simple, human-style Markdown notes.

## Important Rule

Only make notes around the points already present in the file.

Do not add extra important topics, best practices, advanced concepts, or related sections unless the user explicitly asks for them.

## Input Style

The source file may contain simple rough points like:

```markdown
- run
- what is container
- why container
- why docker
- docker compose
```

Treat these as note prompts, not final content.

## Output Style

- Use Markdown format.
- Keep the tone natural and human.
- Make the notes concise.
- Explain where needed.
- Keep paragraphs short.
- Use headings and bullets clearly.
- Prefer simple explanations over long definitions.
- Do not copy large content from the internet.
- Do not over-expand the topic.

## File Replacement Rule

When the user points to a file, replace the existing rough content with polished notes.

Before replacing, understand the existing content and preserve the intended scope.

## Properties / Frontmatter Rule

If the pointed note starts with a `---` block, treat it as properties/frontmatter.

Example:

```markdown
---
tags:
  - root
  - directory
---

- rough note starts here
```

Do not edit, remove, rewrite, or move this top properties block.

Start applying the normal file-notetaking logic only after the closing `---`.

If the file also uses `---` section dividers later, only treat `---` lines after the frontmatter block as section dividers.

## Section Split Rule

If the pointed file uses section dividers, split the notes into multiple files.

A section divider is a line that contains only:

```markdown
---
```

When section dividers are present:

- Keep only the content before the first `---` in the original file.
- Polish that top section normally in the original file.
- For each section after a `---`, create a separate Markdown file in the same folder as the original file.
- Use the first non-empty line after `---` as the new file name.
- Add `.md` to the new file name if it does not already end with `.md`.
- Put only that section's polished notes in the new file.
- In the original file, replace each moved section with a Markdown link to the new file.
- Do not include the `---` divider lines in the original file or the new files.

Example input:

```markdown
- what is a database
- sql
- nosql

---
MySQL Basics
- about mysql
- show databases command

---
MongoDB Basics
- about mongodb
- show dbs
```

Expected output in the original file:

```markdown
# Database Basics

...polished notes from the top section...

## More Sections

- [MySQL Basics](MySQL%20Basics.md)
- [MongoDB Basics](MongoDB%20Basics.md)
```

Also create these files in the same folder:

- `MySQL Basics.md`
- `MongoDB Basics.md`

Each created file should contain polished notes only for its own section.

If there are no `---` section dividers, do not create extra files.

## Structure

Use a structure that fits the pointers in the file.

A common structure can be:

```markdown
# Topic Name

## Summary

Short explanation of the topic.

## Key Points

### Point 1

Simple explanation.

### Point 2

Simple explanation.

## Example

Add only if useful.

## Quick Revision

- Short recall point
- Short recall point
```

Do not force this structure if another clean Markdown structure works better.

## Code Blocks

Use code blocks only when useful, such as:

- commands
- configuration examples
- syntax examples
- terminal output
- small code snippets

Do not add code blocks everywhere.

## Diagrams

Use diagrams only when they genuinely help understanding.

Prefer Mermaid diagrams when a diagram is useful.

Do not add diagrams by default.

## Images

Use images only when:

- the user explicitly asks for them
- the file already references an image
- an image is clearly required to explain the topic

Do not add random image placeholders.

## Extra Information Rule

Do not add sections like:

- Advanced Concepts
- Best Practices
- Common Mistakes
- Related Topics
- Interview Questions
- More Important Things

unless the user explicitly asks for them.

If the user asks for extra important things, then add a short section named:

```markdown
## Extra Important Points
```

Keep that section concise.

## Output Rules

- Replace rough notes with clean notes.
- Stay within the scope of the file's pointers.
- Do not expand unnecessarily.
- Do not add unrelated information.
- End with `Quick Revision` when appropriate.
