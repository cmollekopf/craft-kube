
APP=Applications/KDE/kube.app
macdeployqt $PWD/$APP -always-overwrite -qmldir=$PWD/lib/qml

#Install qml files
cp -R $PWD/lib/qml/org $PWD/$APP/Contents/Resources/qml/

# create the final disk image
macdeployqt Applications/KDE/kube.app -dmg

