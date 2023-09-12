#!/usr/bin/env bash
set -e

# Choose your compose flavor:
COMPOSE="sudo -E docker compose" # -E preserves the env vars we export below
# COMPOSE="docker compose"
# COMPOSE="podman-compose"

test_dir=$(pwd)
export HIVEMIND_CONFIG_FOLDER=$test_dir/data/config/hivemind
export HIVEMIND_SHARE_FOLDER=$test_dir/data/share/hivemind
export OVOS_CONFIG_FOLDER=$test_dir/data/config/mycroft
export OVOS_SHARE_FOLDER=$test_dir/data/share/mycroft
export OVOS_USER=ovos
export TMP_FOLDER=$test_dir/data/tmp
export TZ=Euope/Berlin
export VERSION=alpha
export XDG_RUNTIME_DIR=/run/user/$(id -u)
export VOICE_SAT_KEY=77393752def9983dfcb967e5d52788ca
export VOICE_SAT_PASSWORD=8b86f1b6a0ac451224f2921e80127e9b
export VOICE_SAT_HOST=ws://127.0.0.1
export VOICE_SAT_PORT=5678

cmd="$@"
if [ -z "$cmd" ]; then
  cmd="up -d --remove-orphans"
fi

env |grep VERSION
$COMPOSE --project-name hivemind_test  -f docker-compose.core.yml -f docker-compose.satellite.yml -f docker-compose.hivemind.yml -f docker-compose.skills.yml $cmd
