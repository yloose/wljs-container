#!/bin/bash

PUID=${PUID:-1000}
PGID=${PGID:-1000}

groupmod -o -g "$PGID" wljs
usermod -o -u "$PUID" wljs

chown -R wljs:wljs /wljs
chown -R wljs:wljs /home/wljs


mkdir -p /home/wljs/.WolframEngine/Licensing
cp /Licensing/mathpass /home/wljs/.WolframEngine/Licensing/mathpass
chown -R wljs:wljs /home/wljs/.WolframEngine

su - wljs -c "/usr/bin/wolframscript -f /wljs/Scripts/start.wls host 0.0.0.0 http 4000 ws 4001 ws2 4002 docs 4003 folder '/Workspace'"
