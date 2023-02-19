#!/bin/sh
find . -type d -name 'node_modules' -prune -print0 | xargs -0 du -hs