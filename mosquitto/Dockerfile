FROM eclipse-mosquitto:latest

COPY generate_config.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/generate_config.sh

CMD ["/usr/local/bin/generate_config.sh"]
