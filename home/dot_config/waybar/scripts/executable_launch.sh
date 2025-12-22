#!/usr/bin/env bash

## Copyright (C) 2025 Telmo Baptista
## Licensed under MIT
##
## Waybar launch script
##
## Usage:
##      @script.name [OPTIONS] [ACTION]
## Options:
##      -h, --help              Show help message
##      -v, --verbose           Enable verbose output
##          --profile=NAME      Use profile (only 'default')
##      -l, --list-profiles     List available profiles
##      -k, --kill              Kill running waybar instances
##      -r, --reload            Reload waybar
##
## Actions:
##      start                   Start waybar (default)
##      stop                    Stop waybar instances
##      restart                 Restart waybar
##      toggle                  Toggle waybar
##      status                  Get waybar status

set -e

source ~/.local/lib/konkon-dotfiles/easy-options/easyoptions.sh || exit

readonly WAYBAR_CONFIG_DIR="$HOME/.config/waybar"
readonly LOG_DIR="$HOME/.cache/waybar"
readonly LOG_FILE="$LOG_DIR/waybar.log"
readonly PID_FILE="$LOG_DIR/waybar.pid"

mkdir -p "$LOG_DIR"

log() {
    local level="$1"
    shift
    local message="$*"
    local timestamp
    timestamp="$(date '+%Y-%m-%d %H:%M:%S')"

    if [[ ${verbose:-no} == yes ]] || [[ $level == "ERROR" ]] || [[ $level == "INFO" ]]; then
        echo "[$timestamp] [$level] $message" | tee -a "$LOG_FILE"
    else
        echo "[$timestamp] [$level] $message" >> "$LOG_FILE"
    fi
}

start_waybar() {
    # kill all waybar instances
    killall -q waybar 2>/dev/null || true
    while pgrep -x waybar >/dev/null; do sleep 0.1; done

    log "INFO" "Starting waybar"

    # Waybar profile
    local profile_name="default"

    if [[ -n ${profile:-} ]]; then
        profile_name="$profile"
        log "INFO" "Using profile from command line: $profile_name"
    else
        log "INFO" "Using default profile"
    fi

    waybar
}

kill_waybar() {
    log "INFO" "Killing all waybar instances"
    killall -q waybar 2>/dev/null || true
    while pgrep -x waybar >/dev/null; do sleep 0.1; done
    rm -f "$PID_FILE"
    log "INFO" "Waybar stopped"
}

is_waybar_running() {
    pgrep -x waybar >/dev/null
}

toggle_waybar() {
    if is_waybar_running; then
        kill_waybar
    else
        start_waybar
    fi
}

get_waybar_status() {
    if is_waybar_running; then
        local pid_count
        pid_count=$(pgrep -x waybar | wc -l)
        echo "Waybar is running ($pid_count instance(s))"
        pgrep -x waybar | while read -r pid; do
            echo "  PID: $pid"
        done
        return 0
    else
        echo "Waybar is not running"
        return 1
    fi
}

list_profiles() {
    return 0
}

# Script entrypoint
main() {
    if [[ ${list_profiles:-no} == yes ]]; then
        list_profiles
        exit 0
    fi

    if [[ ${kill:-no} == yes ]]; then
        kill_waybar
        exit 0
    fi

    if [[ ${reload:-no} == yes ]]; then
        kill_waybar
        start_waybar
        exit 0
    fi

    local action="${arguments[0]:-start}"

    case "$action" in
        start)
            start_waybar
            ;;
        stop)
            kill_waybar
            ;;
        restart)
            kill_waybar
            start_waybar
            ;;
        toggle)
            toggle_waybar
            ;;
        status)
            get_waybar_status
            ;;
        *)
            log "ERROR" "Unknown action: $action"
            echo "Action list: start, stop, restart, toggle, status"
            exit 1
            ;;
    esac
}
