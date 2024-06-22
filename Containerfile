FROM docker.io/wolframresearch/wolframengine

USER root

RUN useradd -m wljs

RUN apt-get update && apt-get install -y git

RUN mkdir -p /wljs
WORKDIR /wljs
RUN git clone https://github.com/JerryI/wolfram-js-frontend .

COPY run.sh /run.sh
RUN chmod +x /run.sh

CMD /run.sh
