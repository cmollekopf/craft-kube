set -e

rm -R Applications

APP=Applications/KDE/kube.app

craft --qmerge kde/pim/kube

cp ./bin/sinksh $PWD/$APP/Contents/MacOS/
cp ./bin/sink_synchronizer $PWD/$APP/Contents/MacOS/

mkdir -p $PWD/$APP/Contents/PlugIns
cp -R $PWD/lib/plugins/sink $PWD/$APP/Contents/PlugIns/

#Install icons
mkdir -p $PWD/$APP/Contents/Resources/icons/
cp -R $PWD/share/icons/kube $PWD/$APP/Contents/Resources/icons/

#Install qml files
mkdir -p $PWD/$APP/Contents/Resources/qml/
cp -R $PWD/lib/qml/org $PWD/$APP/Contents/Resources/qml/

macdeployqt $PWD/$APP -qmldir=$PWD/$APP/Contents/Resources/qml -verbose=2 -executable=$PWD/$APP/Contents/MacOS/sinksh -executable=$PWD/$APP/Contents/MacOS/sink_synchronizer -executable=$PWD/$APP/Contents/PlugIns/sink/resources/libsink_resource_imap.dylib  -executable=$PWD/$APP/Contents/Resources/qml/org/kube/framework/libframeworkplugin.dylib -executable=$PWD/$APP/Contents/Resources/qml/org/kube/accounts/kolabnow/libkolabnowaccountplugin.dylib -libpath=$PWD/$APP/Contents/Resources/qml/org/kube/framework/

install_name_tool -change $PWD/lib/libframeworkplugin.dylib @loader_path/../../framework/libframeworkplugin.dylib $APP/Contents/Resources/qml/org/kube/accounts/kolabnow/libkolabnowaccountplugin.dylib
# create the final disk image
macdeployqt Applications/KDE/kube.app -dmg

