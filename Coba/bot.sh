#!/bin/bash

# ==============================================================================
# Stealth Web Bot Engine (24/7 Non-Stop)
# ==============================================================================

# Load config
CONFIG_FILE="config.sh"
if [ ! -f "$CONFIG_FILE" ]; then
    echo "Error: config.sh not found!"
    exit 1
fi
source "$CONFIG_FILE"

# Function: Smooth Mouse Movement
FUNCTION_SMOOTH_MOVE() {
    local target_x=$1
    local target_y=$2
    local current_x=$(xdotool getmouselocation | grep -oP 'x:\K\d+')
    local current_y=$(xdotool getmouselocation | grep -oP 'y:\K\d+')
    
    # Calculate steps for smooth moving
    local steps=20
    for ((i=1; i<=steps; i++)); do
        local nx=$((current_x + (target_x - current_x) * i / steps))
        local ny=$((current_y + (target_y - current_y) * i / steps))
        xdotool mousemove $nx $ny
        sleep 0.05
    done
}

# Function: Human-like Scroll
FUNCTION_HUMAN_SCROLL() {
    echo "Simulating scrolling..."
    for i in {1..5}; do
        local scroll_count=$((RANDOM % 10 + 5))
        for ((j=1; j<=scroll_count; j++)); do
            # 5 is scroll down, 4 is scroll up
            xdotool click 5
            sleep 0.1
        done
        sleep $((RANDOM % 3 + 1))
    done
}

# Main Loop
SESSION_COUNT=0
while true; do
    SESSION_COUNT=$((SESSION_COUNT + 1))
    echo "======================================================================"
    echo "SESSION #$SESSION_COUNT - $(date)"
    echo "======================================================================"

    # 1. Rotate VPN
    if command -v windscribe &> /dev/null; then
        # Pick random location from config
        LOCATION_ARRAY=($VPN_LOCATIONS)
        RANDOM_LOC=${LOCATION_ARRAY[$RANDOM % ${#LOCATION_ARRAY[@]}]}
        echo "Rotating IP... Connecting to: $RANDOM_LOC"
        windscribe disconnect
        windscribe connect "$RANDOM_LOC"
        sleep 10 # Wait for connection
    else
        echo "Windscribe CLI not found, skipping VPN rotation..."
    fi

    # 2. Launch Chrome
    echo "Launching Stealth Chrome..."
    temp_profile="/tmp/chrome-bot-$(date +%s)"
    mkdir -p "$temp_profile"
    
    google-chrome-stable \
        --user-data-dir="$temp_profile" \
        --disable-blink-features=AutomationControlled \
        --no-first-run \
        --no-default-browser-check \
        --disable-infobars \
        --window-size="$CHROME_WIDTH,$CHROME_HEIGHT" \
        --window-position="$CHROME_POS_X,$CHROME_POS_Y" \
        "$TARGET_URL" &
    
    CHROME_PID=$!
    sleep 10 # Wait for browser load

    # 3. Human Interaction (Tasks)
    echo "Running Tasks..."
    # Parse TASKS string (X,Y,Delay|...)
    IFS='|' read -ra TASK_LIST <<< "$TASKS"
    for task in "${TASK_LIST[@]}"; do
        IFS=',' read -r x y delay <<< "$task"
        echo "Executing task: Click ($x, $y) then wait $delay seconds"
        FUNCTION_SMOOTH_MOVE "$x" "$y"
        sleep 0.5
        xdotool click 1
        sleep "$delay"
    done

    # Random Scrolling
    FUNCTION_HUMAN_SCROLL

    # 4. Wait for view time
    VIEW_DURATION=$((RANDOM % (VIEW_TIME_MAX - VIEW_TIME_MIN + 1) + VIEW_TIME_MIN))
    echo "Watching for $VIEW_DURATION seconds..."
    sleep "$VIEW_DURATION"

    # 5. Clean up
    echo "Closing Chrome and cleaning profile..."
    kill $CHROME_PID
    sleep 5
    rm -rf "$temp_profile"

    # Break if MAX_LOOPS reached
    if [ "$MAX_LOOPS" -gt 0 ] && [ "$SESSION_COUNT" -ge "$MAX_LOOPS" ]; then
        echo "Reached MAX_LOOPS ($MAX_LOOPS). Stopping bot."
        break
    fi

    # Rest between sessions
    REST_TIME=$((RANDOM % 120 + 60)) # Rest 1-3 minutes
    echo "Resting for $REST_TIME seconds before next session..."
    sleep "$REST_TIME"
done
