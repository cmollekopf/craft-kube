git clone --recurse-submodules https://github.com/cmollekopf/craft-kube ~/CraftRoot


/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew install cmake wget coreutils p7zip gettext ninja python3 bison boost shared-mime-info pkg-config readline

Make sure all installed dependencies will be found (Update versions as necessary):

export CMAKE_LIBRARY_PATH=/usr/local/Cellar/gettext/0.19.8.1/lib:/usr/local/Cellar/readline/7.0.3_1/lib
export CMAKE_INCLUDE_PATH=/usr/local/Cellar/gettext/0.19.8.1/include:/usr/local/Cellar/readline/7.0.3_1/include
export PATH=/usr/local/Cellar/gettext/0.19.8.1/bin:$PATH

You are ready to go:
    craft extragear/kube

To package on mac:
    Run macdeploy.sh
