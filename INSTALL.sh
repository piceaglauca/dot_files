#!/bin/sh

IGNORE_FILES="INSTALL.sh"
PWD="$(pwd)"

for dotfile in ./*; do

    # skip files listed in $IGNORE_FILES
    if [ "test$(echo $IGNORE_FILES | grep `basename $dotfile`)" = "test" ]; then
        linkName="$HOME/.`basename $dotfile`"
        target="$PWD/`basename $dotfile`"

        echo "Working with vars:"
        echo "\tlinkName = $linkName"
        echo "\ttarget = $target"
        echo "\tdotfile = $dotfile"
        echo "\tPWD = $PWD"

        if [ -h "$linkName" ]; then
            echo "$linkName is a symbolic link. removing"
            rm $linkName
        fi

        if [ -e "$linkName" ]; then
            timestamp=$(date "+%FT%H%M%S")
            backupLink="$linkName.bak-$timestamp"

            echo "$linkName exists. backing up to $backupLink"
            mv $linkName "$linkName.bak-$timestamp"
        fi

        echo "creating symlink for $target to $linkName"
        ln -s $target $linkName
    fi
done
