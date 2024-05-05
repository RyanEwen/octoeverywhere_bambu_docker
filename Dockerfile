FROM ubuntu:latest
WORKDIR /root
RUN apt update
RUN DEBIAN_FRONTEND=noninteractive apt install -y git sudo tzdata
RUN git clone https://github.com/QuinnDamerell/OctoPrint-OctoEverywhere octoeverywhere
COPY ./scripts/ /scripts/
ENV USER=root
WORKDIR /root/octoeverywhere
CMD ["bash", "/scripts/container_setup.sh"]
