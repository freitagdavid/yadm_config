#Android Dev Stuff

export ZSH="/Users/drfreitag/.oh-my-zsh"

#Zscaler setup
# export ZSCALER_PEM=$HOME/.zscalercert/ZscalerRootCertificate-2048-SHA256.crt
# export SSL_CERT_FILE=$ZSCALER_PEM
# export CURL_CA_BUNDLE=$ZSCALER_PEM


export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools
export PATH="/usr/local/opt/openjdk/bin:$PATH"
export PATH=$GEM_HOME/bin:$PATH
# export PATH="/usr/local/bin:$PATH"
export GEM_HOME=$HOME/.gem
export PATH=$GEM_HOME/bin:$PATH
export ANDROID_SDK_ROOT=$HOME/Library/Android/sdk
export RUBY_CONFIGURE_OPTS="--disable-install-doc --with-openssl-dir=$(brew --prefix openssl@1.1)"
export PATH=/opt/homebrew/bin:$PATH
# export PATH="/opt/homebrew/opt/curl/bin:$PATH"

# Set Java Home
. ~/.asdf/plugins/java/set-java-home.zsh

export EDITOR='nano'
