sudo apt-get update;
sudo apt-get install curl;
curl -L get.rvm.io | bash -s stable;

echo 'Please enter a user name for RVM:';
read user;

adduser $user;

cd /etc/skel;
# Append to .bashrc:
echo 'PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting' >> .bashrc;

# Append to .bash_profile:
echo '[[ -s "$HOME/.profile" ]] && source "$HOME/.profile"
	  [[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"' >> .profile;


. ~/.rvm/scripts/rvm;
rvm requirements;
rvm install 2.1.0;
rvm use 2.1.0;
rvm use 2.1.0 --default;
gem install rails;
