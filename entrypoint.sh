#!/bin/bash

echo "Starting entrypoint script"

# Check if LABSERVER is set, otherwise use default value
LABSERVER=${LABSERVER:-"10.66.240.179"}
echo "Using LABSERVER: $LABSERVER"

# Construct the command with the expanded LABSERVER variable
CMD="/opt/ondatraOTG/otgservice.V1.0.*.sh --target otgservice"

# Run the constructed command
echo "Running otgservice script with command: $CMD"
$CMD
sleep 10
cd /opt/ondatraOTG/otgservice || exit 1
./otgctl --start
sleep 2
./otgctl --restserver $LABSERVER
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


