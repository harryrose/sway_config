#!/usr/bin/env bash
killall -s SIGINT wf-recorder &> /dev/null || echo "ok" &> /dev/null
