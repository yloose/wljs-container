FROM docker.io/wolframresearch/wolframengine

USER root
RUN mkdir -p /wljs
WORKDIR /wljs
RUN apt-get update && apt-get install -y git
RUN git clone https://github.com/JerryI/wolfram-js-frontend .

CMD wolframscript -f Scripts/start.wls host 0.0.0.0 http 4000 ws 4001 ws2 4002 docs 4003 folder "/Workspace"
