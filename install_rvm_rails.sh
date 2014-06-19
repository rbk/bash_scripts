sudo apt-get update;
sudo apt-get install nodejs
sudo apt-get install curl;
curl -L get.rvm.io | bash -s stable;
echo '';
echo 'Append to your .bashrc file:';
echo '========================================================================';
echo 'PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting';
echo '========================================================================';
echo '';
echo 'Append to .bash_profile/.profile:';
echo '========================================================================';
echo '[[ -s "$HOME/.profile" ]] && source "$HOME/.profile"';
echo '[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"';
echo '========================================================================';
echo '';
rvm requirements;
rvm install 2.1.0;
rvm use 2.1.0 --default;
gem install rails;

