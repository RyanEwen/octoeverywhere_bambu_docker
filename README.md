## Dockerized OctoEverywhere for Bambu Printers

### !!! IMPORTANT UPDATE !!!
OctoEverywhere now officially supports Docker itself. Please use that instead of this project.  
https://blog.octoeverywhere.com/setup-bambu-connect-with-docker-or-docker-compose/

### Getting Started

1. Create a `docker-compose.yml` file following this example:
    ```yaml
    version: '2.2'
    services:
        my_printer_1:
            image: technicallyreal/octoeverywhere_bambu
            environment:
            - IP_ADDRESS=192.168.0.10
            - ACCESS_CODE=12345678
            - SERIAL_NUMBER=101010101010101
        my_printer_2:
            image: technicallyreal/octoeverywhere_bambu
            environment:
            - IP_ADDRESS=192.168.0.11
            - ACCESS_CODE=87654321
            - SERIAL_NUMBER=202020202020202
    ```

1. Start your OctoEverywhere services:
    ```bash
    docker-compose up -d
    ```

1. Connect your OctoEverywhere services to your OctoEverywhere account by visiting the links in the logs.
    ```bash
    docker-compose logs | grep https://octoeverywhere.com/getstarted
    ```
    It may take a few moments before the services are ready and the links created. If you don't see a link for each service, simply wait a moment and run the command again. Alternatively, run `docker-compose logs -f` to watch the logs in real time.

1. You're finished! You can now monitor your Bambu prints from OctoEverywhere :)
