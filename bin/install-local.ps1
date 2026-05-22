param(
  [ValidateSet("codex", "claude", "all", "list")]
  [string]$Target = "all",

  [string]$SkillName = "",

  [ValidateSet("user", "project")]
  [string]$Scope = "user"
)

$ErrorActionPreference = "Stop"

$ScriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$Repo = Resolve-Path (Join-Path $ScriptDir "..")

function Get-HomePath {
  if ($env:USERPROFILE) {
    return $env:USERPROFILE
  }
  return $HOME
}

function Install-Skills {
  param(
    [string]$Destination,
    [string]$Label
  )

  $InstalledAny = $false
  New-Item -ItemType Directory -Force -Path $Destination | Out-Null

  Get-ChildItem -Path (Join-Path $Repo "skills") -Directory | ForEach-Object {
    $SkillDir = $_
    $SkillMd = Join-Path $SkillDir.FullName "SKILL.md"
    if (-not (Test-Path $SkillMd -PathType Leaf)) {
      return
    }
    if ($SkillName -and $SkillName -ne $SkillDir.Name) {
      return
    }

    $TargetSkill = Join-Path $Destination $SkillDir.Name
    if (Test-Path $TargetSkill) {
      Remove-Item -Recurse -Force $TargetSkill
    }
    Copy-Item -Recurse -Path $SkillDir.FullName -Destination $Destination
    $InstalledAny = $true
  }

  if (-not $InstalledAny) {
    $Suffix = if ($SkillName) { ": $SkillName" } else { "" }
    throw "No matching skills found for $Label$Suffix"
  }
  Write-Host "Installed $Label skills to $Destination"
}

function Install-Codex {
  $Base = if ($Scope -eq "project") { Join-Path $Repo ".codex" } elseif ($env:CODEX_HOME) { $env:CODEX_HOME } else { Join-Path (Get-HomePath) ".codex" }
  Install-Skills -Destination (Join-Path $Base "skills") -Label "Codex"
}

function Install-Claude {
  $Base = if ($Scope -eq "project") { Join-Path $Repo ".claude" } elseif ($env:CLAUDE_HOME) { $env:CLAUDE_HOME } else { Join-Path (Get-HomePath) ".claude" }
  Install-Skills -Destination (Join-Path $Base "skills") -Label "Claude"
}

function List-Skills {
  Get-ChildItem -Path (Join-Path $Repo "skills") -Directory |
    Where-Object { Test-Path (Join-Path $_.FullName "SKILL.md") -PathType Leaf } |
    ForEach-Object { $_.Name }
}

switch ($Target) {
  "codex" {
    Install-Codex
  }
  "claude" {
    Install-Claude
  }
  "all" {
    Install-Codex
    Install-Claude
  }
  "list" {
    List-Skills
  }
}
