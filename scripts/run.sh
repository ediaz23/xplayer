#!/bin/bash

# Exportar DISPLAY para aplicaciones gráficas
export DISPLAY=${DISPLAY}

# Nombre del contenedor
CONTAINER_NAME="xplayer-container"

# Función para detener el contenedor cuando se reciba Ctrl+C
cleanup() {
    echo "Deteniendo el contenedor $CONTAINER_NAME..."
    docker stop "$CONTAINER_NAME" >/dev/null 2>&1
    docker rm "$CONTAINER_NAME" >/dev/null 2>&1
}

# Asegurar que cleanup se ejecute al recibir señales como SIGINT o SIGTERM
trap cleanup SIGINT SIGTERM


# Permitir acceso al servidor X11
xhost +local:docker

# Ejecutar el contenedor Docker
docker run --name "$CONTAINER_NAME" -e DISPLAY=$DISPLAY \
  -v /tmp/.X11-unix:/tmp/.X11-unix \
  -v /run/user/1000/pulse:/run/user/1000/pulse \
  -v ".:/work" \
  -v "$HOME:/home" \
  -w /work/src \
  -e GSETTINGS_SCHEMA_DIR=/work/data \
  -e G_MESSAGES_DEBUG=all \
  -e PULSE_SERVER=unix:/run/user/1000/pulse/native \
  -e XDG_RUNTIME_DIR=/run/user/1000 \
  --privileged --shm-size=3g -it xplayer-builder ./xplayer

cleanup
