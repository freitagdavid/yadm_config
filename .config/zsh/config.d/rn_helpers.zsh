##################################################
##                  RN Helpers                  ##
##################################################

retvalue=-1

function cleanNode() {
    rm -rf ./node_modules &
    progress -mp $!
    rm package-lock.json
    rm -rf ./example/node_modules &
    progress -mp $!
    rm ./example/yarn.lock
    rm ./example/yarn-error.log
}

function cleanupAndroid() {
    cd ./example/android
    ./gradlew clean
    cd ../..
}

function nukePods() {
    cd ./example/ios
    rm -rf ~/Library/Caches/CocoaPods &
    progress -mp $!
    rm -rf Pods &
    progress -mp $!
    rm -rf ~/Library/Developer/Xcode/DerivedData/* &
    progress -mp $!
    pod deintegrate
    pod setup
    cd ../..
}

function pi() {
    cd ./example/ios
    pod install
    cd ../..
}

function piu() {
    cd ./example/ios
    pod install --repo-update
    cd ../..
}

function setupProject() {
    npm i
    cd example
    yarn install
    cd ios
    pod install
    cd ../..
}

function nukeAndSetup() {
    cleanNode
    nukePods
    cleanupAndroid
    cleanupWatchman
    setupProject
}

function rna() {
    cd example
    yarn run android
    cd ..
}

function rni() {
    cd example
    yarn run ios
    cd ..
}

function test() {
    node ./node_modules/jest/bin/jest.js ./
}

function watchClean() {
    watchman watch-del-all
}

function testWatch() {
    node ./node_modules/jest/bin/jest.js --watch ./
    watchman watch-del-all
}

function rnxCleanup() {
    npx @react-native-community/cli clean
}

function ycs() {
    echo "$(du -sm ~/Library/Caches/yarn | cut -f1)M"
}

function ycc() {
    max_size=10240
    size=$(du -sm ~/Library/Caches/yarn | cut -f1)
    echo "Yarn cache is ${size}M"
    if (($size > $max_size)); then
        echo "Clearing cache"
        yarn cache clean
    fi
}

function npmVersion() {
    npm view view $1 versions --json
}

function addFlavor() {
    if [ -z "$1"]
        then
            echo "No argument supplied"
            exit
        else
            echo "Adding $1 to active build flavors"
            timestamp=$(date +%s)
            cp ~/.gradle/gradle.properties ~/.gradle/gradle.properties.$timestamp
            sed "s/\(RNA\.dev\.includedFlavors=\[\)\(.*$\)/\1\'$1\', \2/g" ~/.gradle/gradle.properties > ~/.gradle/gradle.properties.tmp
            mv ~/.gradle/gradle.properties.tmp ~/.gradle/gradle.properties
    fi
}