# Script to create a location independent app bundle ready for distribution.
# Notes:
#  * mkdir calls are necessary, otherwise cp -R will not work properly (it will leave out parts of the path for whatever reason...)
#  * macdeployqt does not handle qml module interdependencies so we deal with them manually
#  * macdeployqt does not work with the -always-overwrite flag, so we always start from scratch instead
#  * To inspect dependencies run "otool -L" on the libraries in the kube.app bundle after macdeployqt was executed. All paths should be relative.

set -e

APP=Applications/KDE/kube.app

# Start from scratch
rm -Rf $APP
craft --qmerge extragear/kube

# Install necessary binaries
cp $PWD/bin/sinksh $PWD/$APP/Contents/MacOS/
cp $PWD/bin/sink_synchronizer $PWD/$APP/Contents/MacOS/

# Install resource plugins
mkdir -p $PWD/$APP/Contents/PlugIns
cp -R $PWD/lib/plugins/sink $PWD/$APP/Contents/PlugIns/

# Install icons
mkdir -p $PWD/$APP/Contents/Resources/kube/
cp share/kube/kube-icons.rcc $PWD/$APP/Contents/Resources/kube/

# Install qml files
mkdir -p $PWD/$APP/Contents/Resources/qml/
cp -R $PWD/lib/qml/org $PWD/$APP/Contents/Resources/qml/

# Let macdeployqt do most of the work
macdeployqt $PWD/$APP -qmldir=$PWD/$APP/Contents/Resources/qml -verbose=2 \
    -executable=$PWD/$APP/Contents/MacOS/sinksh -executable=$PWD/$APP/Contents/MacOS/sink_synchronizer \
    -executable=$PWD/$APP/Contents/PlugIns/sink/resources/libsink_resource_caldav.dylib \
    -executable=$PWD/$APP/Contents/PlugIns/sink/resources/libsink_resource_carddav.dylib \
    -executable=$PWD/$APP/Contents/PlugIns/sink/resources/libsink_resource_imap.dylib \
    -executable=$PWD/$APP/Contents/PlugIns/sink/resources/libsink_resource_maildir.dylib \
    -executable=$PWD/$APP/Contents/PlugIns/sink/resources/libsink_resource_mailtransport.dylib \
    -executable=$PWD/$APP/Contents/PlugIns/sink/resources/libsink_resource_dummy.dylib \
    -executable=$PWD/$APP/Contents/Resources/qml/org/kube/framework/libframeworkplugin.dylib \
    -executable=$PWD/$APP/Contents/Resources/qml/org/kube/accounts/kolabnow/libkolabnowaccountplugin.dylib \
    -executable=$PWD/$APP/Contents/Resources/qml/org/kube/accounts/maildir/libmaildiraccountplugin.dylib \
    -executable=$PWD/$APP/Contents/Resources/qml/org/kube/accounts/imap/libimapaccountplugin.dylib \
    -executable=$PWD/$APP/Contents/Resources/qml/org/kube/accounts/gmail/libgmailaccountplugin.dylib \
    -libpath=$PWD/$APP/Contents/Resources/qml/org/kube/framework/


#Fixup libframeworkplugin paths in account plugins (qml module interdependencies are not handled by macdeployqt)
install_name_tool -change $PWD/lib/libframeworkplugin.dylib @loader_path/../../framework/libframeworkplugin.dylib \
    $APP/Contents/Resources/qml/org/kube/accounts/kolabnow/libkolabnowaccountplugin.dylib
install_name_tool -change $PWD/lib/libframeworkplugin.dylib @loader_path/../../framework/libframeworkplugin.dylib \
    $APP/Contents/Resources/qml/org/kube/accounts/maildir/libmaildiraccountplugin.dylib
install_name_tool -change $PWD/lib/libframeworkplugin.dylib @loader_path/../../framework/libframeworkplugin.dylib \
    $APP/Contents/Resources/qml/org/kube/accounts/imap/libimapaccountplugin.dylib
install_name_tool -change $PWD/lib/libframeworkplugin.dylib @loader_path/../../framework/libframeworkplugin.dylib \
    $APP/Contents/Resources/qml/org/kube/accounts/gmail/libgmailaccountplugin.dylib


# create the final disk image
rm $PWD/Applications/KDE/kube.dmg
macdeployqt $PWD/$APP -dmg

