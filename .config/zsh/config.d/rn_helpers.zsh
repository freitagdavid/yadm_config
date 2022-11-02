##################################################
##                  RN Helpers                  ##
##################################################

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

function setupProject() {
    npm i
    cd example
    yarn install
    cd ios
    pod install
    cd ../..
}

function cleanupWatchman() {
    watchman watch-del ./
}

function nukeAndSetup() {
    cleanNode
    nukePods
    cleanupAndroid
    cleanupWatchman
    setupProject
}

function and() {
    cd example
    yarn run android
    cd ..
}

function ios() {
    cd example
    yarn run ios
    cd ..
}

function test() {
    node ./node_modules/jest/bin/jest.js ./
}

function testWatch() {
    node ./node_modules/jest/bin/jest.js --watch ./
    watchman watch-del-all
}
