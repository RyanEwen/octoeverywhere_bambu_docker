## Dockerized OctoEverywhere for Bambu Printers

### Getting Started

1. Open `docker-compose.yml` and replace the example service with your own (one for each of your printers). Eg:
    ```yaml
    my_printer_1:
        image: technicallyreal/octoeverywhere_bambu
        build: ./
        environment:
        - IP_ADDRESS=192.168.0.10
        - ACCESS_CODE=12345678
        - SERIAL_NUMBER=101010101010101
    my_printer_2:
        image: technicallyreal/octoeverywhere_bambu
        build: ./
        environment:
        - IP_ADDRESS=192.168.0.11
        - ACCESS_CODE=87654321
        - SERIAL_NUMBER=202020202020202
    ```

1. Start your OctoEverywhere services:
    ```bash
    docker-compose up -d
    ```

1. Connect the OctoEverywhere services to your OctoEverywhere account by visiting the links in the logs.
    ```bash
    docker-compose logs | grep https://octoeverywhere.com/getstarted
    ```
    It may take a few moments before the services are ready and the links created. If you don't see a link for each service, simply wait a moment and run the command again. Alternatively, run `docker-compose logs -f` to watch the logs in real time.
