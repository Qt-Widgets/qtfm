QT+= core gui dbus widgets
include(../qtfm.pri)

CONFIG(basic) {
    CONFIG += no_udisks no_tray no_dbus
}

TARGET = $${QTFM_TARGET}
TARGET_NAME = $${QTFM_TARGET_NAME}
VERSION = $${QTFM_MAJOR}.$${QTFM_MINOR}.$${QTFM_PATCH}
TEMPLATE = app

DEPENDPATH += . src
INCLUDEPATH += . src ../libfm
LIBS += -L../libfm -lQtFM

HEADERS += src/mainwindow.h \
    src/bookmarkmodel.h \
    src/tabbar.h
SOURCES += src/main.cpp \
    src/mainwindow.cpp \
    src/bookmarks.cpp \
    src/tabbar.cpp \
    src/actiondefs.cpp \
    src/actiontriggers.cpp

OTHER_FILES += $${TARGET}.desktop
RESOURCES += ../$${TARGET}.qrc

DEFINES += APP=\"\\\"$${TARGET}\\\"\"
DEFINES += APP_NAME=\"\\\"$${TARGET_NAME}\\\"\"
DEFINES += APP_VERSION=\"\\\"$${VERSION}\\\"\"

isEmpty(PREFIX) {
    PREFIX = /usr/local
}
isEmpty(DOCDIR) {
    DOCDIR = $$PREFIX/share/doc
}

target.path = $${PREFIX}/bin
desktop.files += $${TARGET}.desktop
desktop.path += $${PREFIX}/share/applications
docs.path += $${DOCDIR}/$${TARGET}-$${VERSION}
docs.files += ../LICENSE ../README.md ../AUTHORS ../ChangeLog
man.files += qtfm.1
man.path += $${MANDIR}/man1
INSTALLS += target desktop docs man

icon128.files = hicolor/128x128/apps/qtfm.png
icon128.path = $${PREFIX}/share/icons/hicolor/128x128/apps
icon160.files = hicolor/160x160/apps/qtfm.png
icon160.path = $${PREFIX}/share/icons/hicolor/160x160/apps
icon16.files = hicolor/16x16/apps/qtfm.png
icon16.path = $${PREFIX}/share/icons/hicolor/16x16/apps
icon192.files = hicolor/192x192/apps/qtfm.png
icon192.path = $${PREFIX}/share/icons/hicolor/192x192/apps
icon20.files = hicolor/20x20/apps/qtfm.png
icon20.path = $${PREFIX}/share/icons/hicolor/20x20/apps
icon22.files = hicolor/22x22/apps/qtfm.png
icon22.path = $${PREFIX}/share/icons/hicolor/22x22/apps
icon24.files = hicolor/24x24/apps/qtfm.png
icon24.path = $${PREFIX}/share/icons/hicolor/24x24/apps
icon256.files = hicolor/256x256/apps/qtfm.png
icon256.path = $${PREFIX}/share/icons/hicolor/256x256/apps
icon32.files = hicolor/32x32/apps/qtfm.png
icon32.path = $${PREFIX}/share/icons/hicolor/32x32/apps
icon36.files = hicolor/36x36/apps/qtfm.png
icon36.path = $${PREFIX}/share/icons/hicolor/36x36/apps
icon48.files = hicolor/48x48/apps/qtfm.png
icon48.path = $${PREFIX}/share/icons/hicolor/48x48/apps
icon512.files = hicolor/512x512/apps/qtfm.png
icon512.path = $${PREFIX}/share/icons/hicolor/512x512/apps
icon64.files = hicolor/64x64/apps/qtfm.png
icon64.path = $${PREFIX}/share/icons/hicolor/64x64/apps
icon72.files = hicolor/72x72/apps/qtfm.png
icon72.path = $${PREFIX}/share/icons/hicolor/72x72/apps
icon96.files = hicolor/96x96/apps/qtfm.png
icon96.path = $${PREFIX}/share/icons/hicolor/96x96/apps
iconSVG.files = hicolor/scalable/apps/qtfm.svg
iconSVG.path = $${PREFIX}/share/icons/hicolor/scalable/apps

INSTALLS += icon128 icon160 icon16 icon192 icon20 icon22 \
            icon24 icon256 icon32 icon36 icon48 icon512 icon64 \
            icon72 icon96 iconSVG

CONFIG(release, debug|release):DEFINES += QT_NO_DEBUG_OUTPUT
CONFIG(deploy) : DEFINES += DEPLOY
CONFIG(no_udisks): DEFINES += NO_UDISKS
CONFIG(no_dbus): DEFINES += NO_DBUS

CONFIG(staticlib) {
    include (../libfm/static.pri)
}
