#!/usr/bin/env pwsh

Set-StrictMode -Version latest
$ErrorActionPreference = "Stop"

$component = Get-Content -Path "component.json" | ConvertFrom-Json
$rcImage="$($component.registry)/$($component.name):$($component.version)-$($component.build)-rc"
$latestImage="$($component.registry)/$($component.name):latest"

# Build docker image
docker build -f docker/Dockerfile -t $rcImage -t $latestImage .

# Set environment variables
$env:IMAGE = $rcImage

# Set docker machine ip (on windows not localhost)
if ($env:DOCKER_IP -ne $null) {
    $dockerMachineIp = $env:DOCKER_IP
} else {
    $dockerMachineIp = "localhost"
}

try {
    # Workaround to remove dangling images
    docker-compose -f ./docker/docker-compose.yml down

    docker-compose -f ./docker/docker-compose.yml up -d

    # Wait for containers to start
    $sleep = 10
    Write-Host "Waiting for containers to start ($sleep sec)"
    Start-Sleep -Seconds $sleep

    Invoke-WebRequest -Uri "http://$($dockerMachineIp):8080/heartbeat"

    # Write-Host "The container was successfully built."
    
    # Save the result to avoid overwriting it with the "down" command below
    $exitCode = $LastExitCode 
} finally {
    docker-compose -f ./docker/docker-compose.yml down
}

# Return the exit code of the "docker-compose.yml up" command
exit $exitCode 
