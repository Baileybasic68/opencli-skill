# OpenClaw Prompt Templates

These prompts are written for OpenClaw agents running in chat channels, dashboards, or workspace sessions.

## General Pattern

Use this structure:

1. mention `$opencli`
2. ask for discovery first
3. specify the site or desktop app
4. state the output shape
5. prefer read-first behavior when a command could become write-capable

Example:

```text
Use $opencli to inspect the installed OpenCLI surface, confirm the adapter exists, then run a read-first workflow and return JSON only.
```

## Multi-Channel Prompts

### Telegram / WhatsApp style

```text
Use $opencli to fetch the top 10 Bilibili hot videos as JSON and summarize the top 3 trends in one short paragraph.
```

```text
Use $opencli to search Zhihu for "Android 性能优化", return the top 10 results in JSON, then summarize the recurring themes.
```

### Slack / Discord style

```text
Use $opencli to inspect the installed OpenCLI surface, verify whether Codex and Cursor adapters are available, and report the exact commands I can use next.
```

```text
Use $opencli to diagnose why my browser-backed OpenCLI command is returning empty data. Start with doctor and list, then explain what failed.
```

### Dashboard / Control UI style

```text
Use $opencli to run a read-first workflow against Xiaohongshu for "AI Agent", return YAML results, and stop before any write-capable action.
```

```text
Use $opencli to inspect the current Codex desktop conversation and summarize the latest progress in bullet points.
```

## Safe Write-Capable Prompts

Use these when the underlying adapter can write, send, or publish:

```text
Use $opencli to inspect the target first, show me the current state, and do not send or publish anything until you summarize what will happen.
```

```text
Use $opencli to read the relevant job or conversation context first, then propose the exact write action instead of executing it immediately.
```

## Troubleshooting Prompts

```text
Use $opencli to compare the installed command surface with the README and tell me what is actually available in this environment.
```

```text
Use $opencli to diagnose browser connectivity, login state, and extension health before changing any commands.
```

## Channel-Specific Tone Tips

- Short chat channels: ask for compact output and JSON only when another tool will consume it
- Team channels: ask for explicit commands and failure reasons
- Dashboard agents: ask for read-first workflows and structured return formats
