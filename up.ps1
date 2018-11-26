
if (!(test-path "Temp")) {
      New-Item -ItemType Directory -Force -Path "Temp\ListeningTentaculeApplications" | Out-Null
      New-Item -ItemType Directory -Force -Path "Temp\ListeningTentaculeHome" | Out-Null
      New-Item -ItemType Directory -Force -Path "Temp\ListeningTentaculeApplications" | Out-Null
      New-Item -ItemType Directory -Force -Path "Temp\ListeningWorkerApplications" | Out-Null
      New-Item -ItemType Directory -Force -Path "Temp\ListeningWorkerHome" | Out-Null
      New-Item -ItemType Directory -Force -Path "Temp\PollingTentaculeApplications" | Out-Null
      New-Item -ItemType Directory -Force -Path "Temp\PollingTentaculeHome" | Out-Null
      New-Item -ItemType Directory -Force -Path "Temp\PollingWorkerApplications" | Out-Null
      New-Item -ItemType Directory -Force -Path "Temp\PollingWorkerHome" | Out-Null
}

docker-compose --project-name Octopus `
-f Tentacle\docker-compose.yml `
up `
-d
#--force-recreate -d

#$docker = docker inspect octopus_octopus_1 | convertfrom-json
$docker = docker inspect octopus_octopus_1_88fb4cfbe3cf | convertfrom-json
start "http://$($docker[0].NetworkSettings.Networks.nat.IpAddress):81"