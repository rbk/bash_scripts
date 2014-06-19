# Other bash scripts

## Users

Add a user:
`useradd -m -g users -s /bin/bash -p $(echo your_password | openssl passwd -1 -stdin) your_username`

Delete a user:
`userdel username`

## Search

Recursively search files for a string:
`grep -r "your string" .`

