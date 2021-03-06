#!/bin/sh
# Author : Andreas Mueller <mail@amueller.org>
# Creation Date : 03/10/2005
# Licence : GNU GPL
#
# provides a send_file_as_email_to link for all files
# the file is sent as an attachment using mozilla-thunderbird
# if thunderbird is already running, open the compose window
# otherwise start thunderbird and open the compose window
#
#

thunderbird_path="/usr/bin/mozilla-thunderbird"

for args
do
#filter the desktop path
if [ "$NAUTILUS_SCRIPT_CURRENT_URI" = "x-nautilus-desktop:///" ];
then
cd ~
dir=`pwd`
NAUTILUS_SCRIPT_CURRENT_URI=file://$dir/Desktop
fi

#is thunderbird already running?
$thunderbird_path -remote 'ping()'

if [ $? -eq 0 ]; then
    $thunderbird_path -remote
"xfeDoCommand(composeMessage,attachment=$NAUTILUS$else
    $thunderbird_path -compose
"attachment=$NAUTILUS_SCRIPT_CURRENT_URI/$args"
fi
done
