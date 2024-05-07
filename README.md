## Dockerized OctoEverywhere for Bambu

### How it works:
The setup script will create a Docker image and container for each of your printers. The containers can then be started/stopped using Docker-Compose.

1. Setup a printer using `./setup_printer.sh <name>`
    For example: `./setup_printer.sh fred`

    *Note: The name will be used as the Docker image name as well as the Docker-Compose service name.*

    You will be asked for your printer's Access Code, Serial, and IP address. Avoid spaces in the name - you can set a pretty name later on the OctoEverywhere dashboard.

    **Ignore the "Installer failed" error - that is expected**

1. Repeat the previous step for each of your other printers.

1. Start all of the containers using `docker-compose up -d`

1. Check the logs of each container for the OctoEverywhere setup URLs by using `docker-compose logs`.

    The URLs will be within WARNING blocks. Look for "Use the following link to finish the setup and get remote access:".

1. `CTRL-C` to get out of the log view, and you're done!
    If needed, you can stop all of the containers using `docker-compose stop`. Substitute `stop` for `restart` or `start` as-needed.

