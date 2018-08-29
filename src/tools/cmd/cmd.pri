#-------------------------------------------------
#
# Project created by QtCreator 2015-02-11T09:55:20
#
#-------------------------------------------------

#QT       -= core gui

#TARGET = cmd
#TEMPLATE = lib

#DEFINES += CMD_LIBRARY

#SOURCES += cmd.cpp

#HEADERS += cmd.h

DEFINES += PROJECT_TEMPLATE_SUBDIRS

OTHER_FILES += \
    $$PWD/cmd.bat \
    $$PWD/cmd_debug.bat \
    $$PWD/cmd_release.bat \
    $$PWD/cmd.sh \

unix {
    message("sh $$PWD/cmd.sh begin...")
    system(sudo sh $$PWD/cmd.sh "$$PROJECTS_DEPLOY_PATH")
}

win32 | win64 {    
    CONFIG(debug, debug|release) : message("cmd $$PWD/cmd_debug.bat begin..." "debug" "$$PROJECTS_DEPLOY_PATH")
    CONFIG(debug, debug|release) : system(cmd $$PWD/cmd_debug.bat "debug" "$$PROJECTS_DEPLOY_PATH")
    CONFIG(release, debug|release) : message("cmd $$PWD/cmd_release.bat begin..." "release" "$$PROJECTS_DEPLOY_PATH")
    CONFIG(release, debug|release) : system(cmd $$PWD/cmd_release.bat "release" "$$PROJECTS_DEPLOY_PATH")
}
