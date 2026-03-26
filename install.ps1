param(
  [ValidateSet("codex", "claude", "openclaw", "openclaw-workspace")]
  [string]$Target = "codex",
  [string]$RepoUrl = "https://github.com/GloriaGuo/opencli-skill.git"
)

$ErrorActionPreference = "Stop"

switch ($Target) {
  "codex" {
    $targetDir = Join-Path ($(if ($env:CODEX_HOME) { $env:CODEX_HOME } else { Join-Path $HOME ".codex" })) "skills/opencli"
  }
  "claude" {
    $targetDir = Join-Path $HOME ".claude/skills/opencli"
  }
  "openclaw" {
    $targetDir = Join-Path $HOME ".openclaw/skills/opencli"
  }
  "openclaw-workspace" {
    $targetDir = Join-Path (Get-Location) "skills/opencli"
  }
}

$parentDir = Split-Path $targetDir -Parent
New-Item -ItemType Directory -Force -Path $parentDir | Out-Null

if (Test-Path (Join-Path $targetDir ".git")) {
  Write-Host "Updating existing install at $targetDir"
  git -C $targetDir pull --ff-only
} else {
  Write-Host "Cloning $RepoUrl to $targetDir"
  git clone $RepoUrl $targetDir
}

Write-Host ""
Write-Host "Installed OpenCLI skill to:"
Write-Host "  $targetDir"
Write-Host ""
Write-Host "Next steps:"
Write-Host "  1. Ensure OpenCLI is installed: npm install -g @jackwener/opencli"
Write-Host "  2. Run: opencli doctor"
Write-Host '  3. Trigger the skill with: Use $opencli to inspect the installed OpenCLI surface and run a read-first workflow.'
