# install.ps1
$ErrorActionPreference = "Stop"
Write-Host "Initializing AetherAI Boot Sequence..." -ForegroundColor Cyan

# Check for Node.js
if (!(Get-Command "node" -ErrorAction SilentlyContinue)) {
    Write-Host "[ ERROR ] Node.js is not installed. Please install Node.js to run AetherAI." -ForegroundColor Red
    Exit 1
}

$tempDir = Join-Path $env:TEMP "AetherAI_Session"
if (!(Test-Path $tempDir)) {
    New-Item -ItemType Directory -Path $tempDir | Out-Null
}

$scriptPath = Join-Path $tempDir "aetherai.cjs"
Write-Host "[ SYSTEM ] Establishing secure link and downloading neural pathways..." -ForegroundColor DarkGray

# In a real deployment, the URL would be https://aetherai.azzamcodex.site/aetherai.cjs
# For this example, we assume it's hosted there.
Invoke-WebRequest -Uri "https://aetherai.azzamcodex.site/aetherai.cjs" -OutFile $scriptPath -UseBasicParsing

Write-Host "[ OK ] Core systems loaded." -ForegroundColor Green
Write-Host "Launching AetherAI..." -ForegroundColor Cyan
node $scriptPath
