FROM grafana/loki:latest

# Copy a custom Loki configuration file
COPY loki-config.yaml /etc/loki/loki-config.yaml

# Expose necessary ports
EXPOSE 3100 9096

# Set the command to run Loki with the specified configuration
CMD ["-config.file=/etc/loki/loki-config.yaml"]
