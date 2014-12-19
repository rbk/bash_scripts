# Other bash scripts/shell commands

## <? to <?php (Recursively)

find . -type f -print0 | xargs -0 sed -i 's/<?=/<?php echo /g';
find . -type f -print0 | xargs -0 sed -i 's/<?/<?php/g';
find . -type f -print0 | xargs -0 sed -i 's/phpphp/php/g';

## Top Ten Largest Files/Folders

`du -hsx * | sort -rh | head -10`

## Too cool

`git config --global alias.lg "log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"`

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

