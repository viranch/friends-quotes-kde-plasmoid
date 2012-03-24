#!/bin/sh
zip -r friends.plasmoid metadata.desktop contents README && plasmapkg -u friends.plasmoid
