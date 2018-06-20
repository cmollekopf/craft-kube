set -e

export CMAKE_LIBRARY_PATH=/usr/local/Cellar/gettext/0.19.8.1/lib:/usr/local/Cellar/readline/7.0.3_1/lib
export CMAKE_INCLUDE_PATH=/usr/local/Cellar/gettext/0.19.8.1/include:/usr/local/Cellar/readline/7.0.3_1/include
export PATH=/usr/local/Cellar/gettext/0.19.8.1/bin:$PATH
export MACOSX_DEPLOYMENT_TARGET=10.9.0 #Minimum version to find the required type_traits header
export SDKROOT=/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/

. craft/craftenv.sh

craft --install-deps --fetch --unpack --compile --install extragear/sink
craft --install-deps --fetch --unpack --compile --install --package extragear/kube
