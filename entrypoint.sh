#!/bin/bash

echo "Starting entrypoint script"

# Check if LABSERVER is set, otherwise use default value
LABSERVER=${LABSERVER:-"10.109.125.126"}
echo "Using LABSERVER: $LABSERVER"

CONTAINER_ID=$(cat /proc/self/cgroup | grep 'memory' | awk -F'/' '{print $3}' | head -n 1)
echo "Container ID: $CONTAINER_ID"

# Construct the command with the expanded LABSERVER variable
CMD="/opt/ondatraOTG/otgservice.V1.*.sh --target otgservice"

# Run the constructed command
echo "Running otgservice script with command: $CMD"
$CMD
sleep 10
cd /opt/ondatraOTG/otgservice || exit 1
./otgctl --start
sleep 2
./otgctl --restserver $LABSERVER
sleep 2
./otgctl --session --with-username admin --with-session-name ${CONTAINER_ID:0:12}
status=$?

if [ $status -ne 0 ]; then
  echo "Script exited with status $status"
else
  echo "Script completed successfully"
fi

# Sleep for 5 seconds
echo "Sleeping for 5 seconds"
sleep 5

# Prevent the container from exiting
echo "Entering sleep mode to keep container running"
exec sleep infinity


