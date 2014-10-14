# Other bash scripts

## Just for fun

`yes "$(seq 1 255)" | while read i; do printf "\x1b[48;5;${i}m\n"; sleep .01; done`

## Users

Add a user:

`useradd -m -g users -s /bin/bash -p $(echo your_password | openssl passwd -1 -stdin) your_username`

Delete a user:

`userdel username`

## Search

Recursively search files for a string:

`grep -r "your string" .`

Recursive string replace:

`find . -type f -print0 | xargs -0 sed -i 's/<search>/<replace>/g'`

