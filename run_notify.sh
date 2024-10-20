#!/bin/bash

# Load environment variables from .env file
if [ -f .env ]; then
  export $(cat .env | xargs)
fi

# Function to display usage instructions
usage() {
  echo "Usage: $0 [--notify-whatsapp] <command-to-run>"
  exit 1
}

# Check if at least one argument (the main command) is provided
if [ "$#" -lt 1 ]; then
  usage
fi

# Check if the first argument is the notification flag
SEND_WHATSAPP=false

if [[ "$1" == "--notify-whatsapp" ]]; then
  SEND_WHATSAPP=true
  shift  # Remove the flag from the arguments
fi

# Extract the command from the arguments
COMMAND="$@"

# Specify the log file path
LOG_FILE="command_output_$(date +%Y%m%d_%H%M%S).log"

# Activate the virtual environment
source $VENV_PATH

# Record the start time
START_TIME=$(date +%s)

# Spinner function to show loading animation
spinner() {
  local pid=$1
  local delay=0.1
  local spinstr='⣷⣯⣟⡿⢿⣻⣽⣾'
  # echo "Code is running..."
  
  while [ "$(ps a | awk '{print $1}' | grep $pid)" ]; do
    local temp=${spinstr#?}
    # printf "[%c] " "$spinstr"
    printf "  Running script %s " "${spinstr:$i:1}"
    spinstr=$temp${spinstr%"$temp"}
    sleep $delay
    printf "\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b"
  done
  printf "                  \b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b"
  echo "✅ Done"
}

# Run the command in the background, saving output to the log file
# Both stdout and stderr are redirected to the log file
eval "$COMMAND" > "$LOG_FILE" 2>&1 &

# Get the PID of the background process
COMMAND_PID=$!

# Start the spinner while waiting for the process to finish
spinner $COMMAND_PID

# Wait for the background process to complete
wait $COMMAND_PID

# Record the end time
END_TIME=$(date +%s)

# Calculate the time taken in seconds
TIME_TAKEN=$((END_TIME - START_TIME))

# Convert the time taken into a more readable format (hours, minutes, seconds)
HOURS=$((TIME_TAKEN / 3600))
MINUTES=$(((TIME_TAKEN % 3600) / 60))
SECONDS=$((TIME_TAKEN % 60))

# Create a human-readable time duration string
DURATION=$(printf "%02d hours %02d minutes %02d seconds" $HOURS $MINUTES $SECONDS)

# Check the exit status of the command
if [ $? -eq 0 ]; then
  SUCCESS_MESSAGE="Your script has finished executing successfully!
Time taken: $DURATION.
Logs saved to $LOG_FILE"

  # Send desktop notification
  notify-send "Script Success" "$SUCCESS_MESSAGE"

  # If the command succeeds, send a success notification
  if [ "$SEND_WHATSAPP" = true ]; then
    send-whatsapp "$SUCCESS_MESSAGE"
  fi

else
  FAILURE_MESSAGE="Your script has failed!
Time taken: $DURATION.
Logs saved to $LOG_FILE"
  
  # Send desktop notification
  notify-send "Script Failure" "$FAILURE_MESSAGE"

  # If the command fails, send a failure notification
  if [ "$SEND_WHATSAPP" = true ]; then
    send-whatsapp "$FAILURE_MESSAGE"
  fi
fi

# Deactivate the environment after the script runs
deactivate
