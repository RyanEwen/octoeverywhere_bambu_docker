#!/bin/bash

echo "Building base image"
docker build -t bambu_octoeverywhere .

echo "Installing Octoeverywhere"
docker rm bambu_octoeverywhere_tmp
docker run -it --name bambu_octoeverywhere_tmp bambu_octoeverywhere

echo "Creating Octoeverywhere image for $1"
docker commit --change='CMD ["bash", "/root/start.sh"]' bambu_octoeverywhere_tmp $1
docker rm bambu_octoeverywhere_tmp

cat >> docker-compose.yml<< EOF
  $1:
    image: $1
    restart: unless-stopped

EOF
