
### mac
### brew install unixodbc

### Ubuntu: -D"OTL_ODBC_UNIX" -lodbc
### sudo apt-get install unixodbc unixodbc-dev
### sudo apt-get install uuid-dev

### CentOS: -D"OTL_ODBC_UNIX" -lodbc
### sudo yum install unixODBC-devel


###setting cmake option:
##-DQT_QMAKE_EXECUTABLE:FILEPATH=F:/qt5.5.1mingw4.9/5.5/mingw492_32/bin/qmake.exe
##-DCMAKE_PREFIX_PATH:FILEPATH=F:/qt5.5.1mingw4.9/5.5/mingw492_32

set(gs_ccxx_path /ddd/ccpp/ccxx)

# Find the QtWidgets library
if(APPLE)
    list(APPEND CMAKE_PREFIX_PATH /Users/oudream/Qt5.5.1/5.5/clang_64)
    set(gs_prefix_path_python /Library/Frameworks/Python.framework/Versions/3.6)
elseif(UNIX)
    list(APPEND CMAKE_PREFIX_PATH /fff/qt5.6.3/5.6.3/gcc_64)
elseif(WIN32)
    message("CMAKE_SIZEOF_VOID_P:" ${CMAKE_SIZEOF_VOID_P})
    if( CMAKE_SIZEOF_VOID_P EQUAL 8 )
        set(gs_prefix_path_python C:/Python/Python36-64)
    else()
        set(gs_prefix_path_python C:/Python/Python36-32)
    endif()
    if(MSVC)
        message(${MSVC_VERSION})
        if(MSVC_VERSION EQUAL 1800) # 1800 is Visual Studio 2013
            list(APPEND CMAKE_PREFIX_PATH F:/qt5.8.0msvc2013/5.8/msvc2013)
        elseif(MSVC_VERSION EQUAL 1900)
            list(APPEND CMAKE_PREFIX_PATH F:/qt5.6.1msvc2015/5.6/msvc2015)
        elseif(MSVC_VERSION GREATER 1910)
            list(APPEND CMAKE_PREFIX_PATH F:/qt5.10.1/5.10.1/msvc2017_64)
        else()
            message("can not find qt version!!!")
        endif()
    else()
        list(APPEND CMAKE_PREFIX_PATH F:/qt5.5.1mingw4.9.2x86/5.5/mingw492_32)
        #        list(APPEND CMAKE_PREFIX_PATH F:/qt5.5.1mingw4.9/5.5/mingw492_32)
    endif()
endif()

set(CMAKE_CXX_STANDARD 11)

set_property(GLOBAL PROPERTY USE_FOLDERS ON)

if(APPLE)
    # http://kescoode.com/cmake-rpath-problem/
    # https://stackoverflow.com/questions/31561309/cmake-warnings-under-os-x-macosx-rpath-is-not-specified-for-the-following-targe
    set(CMAKE_MACOSX_RPATH 0)
endif()

### qt
### if enable qt, then config "build/ccpro/local.config.cmake" 's CMAKE_PREFIX_PATH to your dir of qt
set(gs_project_enable_qt 1)
# set(gs_project_enable_qt 0)
# set(gs_project_qt_version 4)

### cpython
set(gs_project_enable_cpython 1)
#set(gs_project_enable_cpython 0)
# set(gs_project_cpython_version 2)

if (gs_project_enable_cpython AND gs_prefix_path_python)
    list(APPEND CMAKE_PREFIX_PATH ${gs_prefix_path_python})
endif()

message("CMAKE_PREFIX_PATH:" ${CMAKE_PREFIX_PATH})

