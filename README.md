## Dockerized OctoEverywhere for Bambu

### Getting Started

1. Edit `docker-compose.yml` by replacing the example service with a service for each of your printers. Eg:
    ```yaml
    my_printer_1:
        build: ./
        environment:
        - IP_ADDRESS=192.168.0.10
        - ACCESS_CODE=12345678
        - SERIAL_NUMBER=101010101010101
    my_printer_2:
        build: ./
        environment:
        - IP_ADDRESS=192.168.0.11
        - ACCESS_CODE=87654321
        - SERIAL_NUMBER=202020202020202
    ```

1. Start all of the containers using `docker-compose up -d`

1. Check the logs of each container for the OctoEverywhere setup URLs by using `docker-compose logs`.

    The URLs will be within WARNING blocks. Look for "Use the following link to finish the setup and get remote access:".

1. `CTRL-C` to get out of the log view, and you're done!
    If needed, you can stop all of the containers using `docker-compose stop`. Substitute `stop` for `restart` or `start` as-needed.

