# Claude Code Usage

This document shows how to install and use the OpenCLI skill in Claude Code.

## Install

Clone this repository into Claude Code's skills directory:

```bash
git clone git@github.com:GloriaGuo/opencli-skill.git ~/.claude/skills/opencli
```

If the folder already exists, update it:

```bash
cd ~/.claude/skills/opencli
git pull
```

## Triggering The Skill

Claude Code can often pick the skill from context, but explicit invocation is more reliable:

```text
Use $opencli to inspect the local OpenCLI setup and run the correct command.
```

## Example Prompts

### Browser-backed sites

```text
Use $opencli to fetch the top 10 Bilibili hot videos as JSON.
```

```text
Use $opencli to search Zhihu for "Android 性能优化" and summarize the top results.
```

### Desktop adapters

```text
Use $opencli to inspect the local OpenCLI setup and tell me whether Codex and Cursor adapters are available.
```

```text
Use $opencli to read the current Codex desktop conversation and summarize the latest progress.
```

### Troubleshooting

```text
Use $opencli to diagnose why my browser-backed command is returning empty data.
```

```text
Use $opencli to compare the installed OpenCLI command surface with the README and tell me what is actually available.
```

## Recommended Prompt Pattern

The most reliable structure is:

1. mention `$opencli`
2. describe the target site or app
3. state the expected output format or outcome
4. ask for read-first behavior if the task could become write-capable

Example:

```text
Use $opencli to inspect the installed command surface, then run a read-first workflow against Zhihu and return JSON only.
```
