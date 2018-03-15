
macdeployqt $PWD/Applications/KDE/kube.app

#    rm -rf Applications/KDE/kube.app/Contents/Frameworks/Qt3DCore.framework
#    rm -rf Applications/KDE/kube.app/Contents/Frameworks/Qt3DRender.framework
#    rm -rf Applications/KDE/kube.app/Contents/Frameworks/QtLocation.framework
#    rm -rf Applications/KDE/kube.app/Contents/Frameworks/QtMultimedia.framework
#    rm -rf Applications/KDE/kube.app/Contents/Frameworks/QtMultimediaWidgets.framework
#    rm -rf Applications/KDE/kube.app/Contents/Frameworks/QtPositioning.framework
#    rm -rf Applications/KDE/kube.app/Contents/Frameworks/QtSerialBus.framework
#    rm -rf Applications/KDE/kube.app/Contents/Frameworks/QtSerialPort.framework
#    rm -rf Applications/KDE/kube.app/Contents/Frameworks/QtWebChannel.framework
#    rm -rf Applications/KDE/kube.app/Contents/Frameworks/QtWebEngineCore.framework
#    rm -rf Applications/KDE/kube.app/Contents/Frameworks/QtWebEngineWidgets.framework
#    rm -rf Applications/KDE/kube.app/Contents/PlugIns/qmltooling
#    rm -rf Applications/KDE/kube.app/Contents/PlugIns/position
#    rm -rf Applications/KDE/kube.app/Contents/PlugIns/playlistformats
#    rm -rf Applications/KDE/kube.app/Contents/PlugIns/mediaservice
#    rm -rf Applications/KDE/kube.app/Contents/PlugIns/geoservices
#    rm -rf Applications/KDE/kube.app/Contents/PlugIns/canbus
#    rm -rf Applications/KDE/kube.app/Contents/PlugIns/sceneparsers
#    rm -rf Applications/KDE/kube.app/Contents/PlugIns/sensorgestures
#    rm -rf Applications/KDE/kube.app/Contents/PlugIns/sensors

# create the final disk image
macdeployqt Applications/KDE/kube.app -dmg

