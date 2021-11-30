#!/usr/bin/env pwsh

Set-StrictMode -Version latest
$ErrorActionPreference = "Stop"

$component = Get-Content -Path "component.json" | ConvertFrom-Json
$testImage="$($component.registry)/$($component.name):$($component.version)-test"
$rcImage="$($component.registry)/$($component.name):$($component.version)-$($component.build)-rc"
$latestImage="$($component.registry)/$($component.name):latest"

# Clean up build directories
if (Test-Path "dist") {
    Remove-Item -Recurse -Force -Path "dist"
}

# Remove docker images
docker rmi $testImage --force
docker rmi $rcImage --force
docker rmi $latestImage --force
docker image prune --force

# Remove existed containers
$exitedContainers = docker ps -a | Select-String -Pattern "Exit"
foreach($c in $exitedContainers) { docker rm $c.ToString().Split(" ")[0] }
