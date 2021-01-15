#!/bin/bash

G_MESSAGES_DEBUG=Dialogs.DRun rofi -show drun -drun-display-format {name} -theme slate -filter "$1" 
