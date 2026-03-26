# Command Recipes

## 1. Environment Check

```bash
opencli doctor
opencli list -f yaml
```

## 2. Public Data

```bash
opencli hackernews top --limit 5 -f json
opencli google news --limit 10 -f json
opencli wikipedia trending -f json
```

## 3. Chinese Platforms

```bash
opencli bilibili hot --limit 10 -f json
opencli zhihu hot -f json
opencli zhihu search "Android 性能优化" -f json
opencli xiaohongshu search "AI Agent" --limit 10 -f yaml
opencli weibo hot -f yaml
opencli weixin download --url "https://mp.weixin.qq.com/s/xxx" --output ./weixin
```

## 4. Desktop Adapters

```bash
opencli codex --help
opencli codex read -f json
opencli codex history -f json
opencli codex model -f json
opencli codex export

opencli cursor --help
opencli cursor read -f json
opencli cursor history -f json
opencli cursor model -f json
opencli cursor ask "Summarize the latest workspace conversation"
opencli cursor export
```

## 5. Downloads

```bash
opencli zhihu download "https://zhuanlan.zhihu.com/p/xxx" --output ./zhihu
opencli zhihu download "https://zhuanlan.zhihu.com/p/xxx" --download-images
opencli xiaohongshu download abc123 --output ./xhs
opencli bilibili download BV1xxx --output ./bilibili
```

## 6. External CLI Hub

```bash
opencli gh pr list --limit 5
opencli docker ps
opencli obsidian search query="AI"
opencli gws docs list
```

## 7. Adapter Development

```bash
opencli explore https://example.com --site mysite
opencli synthesize mysite
opencli generate https://example.com --goal "hot"
opencli cascade https://api.example.com/data
```
