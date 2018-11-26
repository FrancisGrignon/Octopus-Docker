docker-compose --project-name Octopus `
-f Tentacle\docker-compose.yml `
down

if ((test-path "Temp")) {
    Remove-Item -Path Temp -Force | Out-Null
}