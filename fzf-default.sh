#!/bin/bash

set -o pipefail;
(command find -L . -mindepth 1 \( -path '*/\.*' -o -fstype 'sysfs' -o -fstype 'devfs' -o -fstype 'devtmpfs' -o -fstype 'proc' \) -prune -o -type f -print -o -type l -print || command find -L . -mindepth 1 -path '*/\.*' -prune -o -type f -print -o -type l -print) 2> /dev/null | cut -b3-
