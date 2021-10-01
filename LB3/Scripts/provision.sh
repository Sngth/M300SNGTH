git clone https://github.com/creationix/nvm.git ~/.nvm ↵
  && cd ~/.nvm ↵
  && git checkout `git describe --abbrev=0 --tags`
echo "source ~/.nvm/nvm.sh" >> ~/.profile
source ~/.profile
nvm install 0.10
nvm alias default 0.10
npm install -g browserify
npm install -g eslint
npm install -g grunt-cli
npm install -g harp
npm install -g http-server
npm install -g less
npm install -g mocha
npm install -g uglify-js