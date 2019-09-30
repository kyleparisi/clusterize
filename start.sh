#!/usr/bin/env bash

# Random 8 character uuid
NAME=$(cat /dev/urandom | LC_CTYPE=C tr -dc 'a-zA-Z0-9' | fold -w 8 | head -n 1)
# 10.242 is zerotier which will always be sequentially last, otherwise use the private
# 10.0 address space.
IP=$(ifconfig  | grep -E '10\.242|10\.0' | awk '{print $2}' | tail -n1)
# Install dependencies
mix deps.get
# Start the app
elixir --name $NAME@$IP --cookie test -S mix run --no-halt
