FROM debian:12
WORKDIR /root

ENV USER=root
ENV REPO_DIR=/root/octoeverywhere
ENV VENV_DIR=/root/octoeverywhere-env

RUN apt update
RUN apt install -y curl git ffmpeg jq python3 python3-pip python3-venv virtualenv
RUN git clone https://github.com/QuinnDamerell/OctoPrint-OctoEverywhere ${REPO_DIR}
RUN virtualenv -p /usr/bin/python3 ${VENV_DIR}
RUN ${VENV_DIR}/bin/python -m pip install --upgrade pip
RUN ${VENV_DIR}/bin/pip3 install --require-virtualenv --no-cache-dir -q -r ${REPO_DIR}/requirements.txt

COPY ./scripts/entrypoint.sh /entrypoint.sh

WORKDIR /root/octoeverywhere

CMD ["/bin/bash", "/entrypoint.sh"]
