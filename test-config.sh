sudo docker run --name test --rm -v ./config:/etc/nginx/conf.d -v ./certs:/etc/letsencrypt/live/mqtt.academy.nordicsemi.com nscacademycontainerregistry.azurecr.io/mqtt-ingress