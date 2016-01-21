# Other bash scripts/shell commands

## List all files changed within the last 30 minutes (current directory, recursive)

`find . -type d -name .git -prune -o -mmin -30 -type f -print`

## Pretend you are Mozilla, download entire websites

`wget -r -p -U Mozilla <url>`

## String replace function
function str_replace( $1, $2 ){
  find . -type f -print0 | xargs -0 sed -i 's/$1/$2/g'
}

## <? to <?php (Recursively)

`find . -type f -print0 | xargs -0 sed -i 's/<?=/<?php echo /g';`

`find . -type f -print0 | xargs -0 sed -i 's/<?/<?php/g';`

`find . -type f -print0 | xargs -0 sed -i 's/phpphp/php/g';`

## Top Ten Largest Files/Folders

`du -hsx * | sort -rh | head -10`

## Better git log, just type git lg in a repository folder and see.

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

## Show all Vhosts setup in apache

`apachectl -t -D DUMP_VHOSTS`

## Permissions

Credit to Mason Frakes @ github.com/Novemburr

```
function permissions() {
echo 'who should own the directory tree?';
read owner;
sudo chown -R $owner:$owner $1;
sudo find $1 -type d -exec chmod 755 {} \;
sudo find $1 -type f -exec chmod 644 {} \;
}
alias perms='permissions';
```

## List size of all directories in current folder and sort by size

`du -a -h --max-depth=1 | sort -hr`

## Weather, thanks to someone

`weather(){ curl -s "http://api.wunderground.com/auto/wui/geo/ForecastXML/index.xml?query=${@:-74133}"|perl -ne '/<title>([^<]+)/&&printf "%s: ",$1;/<fcttext>([^<]+)/&&print $1,"\n"';}`
