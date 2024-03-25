#!/bin/sh

# Generate the Mosquitto configuration file
cat <<EOF > /mosquittoconf/mosquitto.conf
allow_anonymous true
listener 1883
listener 9001
protocol websockets

log_type payload

# Bridge configuration for broker B
connection bridge-to-cloud
address ${CLOUD_BROKER_HOST}:${CLOUD_BROKER_PORT}

# For bridging topics
topic asol/# both 0
topic mega/# both 0

# Add this section if broker A requires authentication
remote_username ${CLOUD_BROKER_USERNAME}
remote_password ${CLOUD_BROKER_PASSWORD}

# Add this section if you want to use TLS for the connection
bridge_capath /etc/ssl/certs/
EOF

# Start Mosquitto with the generated configuration file
exec /usr/sbin/mosquitto -c /mosquittoconf/mosquitto.conf
