#cmake . -G "Visual Studio 10 2010" --build "C:\ddd\ccpp\gcl3\build\cmake" -B"C:\ddd\ccpp\gcl3\build\cmake\ccpro-vs2010"
#cmake . -G "Visual Studio 12 2013" --build "C:\ddd\ccpp\gcl3\build\cmake" -B"C:\ddd\ccpp\gcl3\build\cmake\ccpro-vs2013"
#cmake . -G "Visual Studio 14 2015" --build "C:\ddd\ccpp\gcl3\build\cmake" -B"C:\ddd\ccpp\gcl3\build\cmake\ccpro-vs2015"
#-DQT_QMAKE_EXECUTABLE:FILEPATH=F:/qt5.5.1mingw4.9/5.5/mingw492_32/bin/qmake.exe
#-DCMAKE_PREFIX_PATH:FILEPATH=F:/qt5.5.1mingw4.9/5.5/mingw492_32



cmake_minimum_required(VERSION 3.0)

project(CCXX VERSION 1.0.1 LANGUAGES CXX C)

### depend path
#CMAKE_CURRENT_SOURCE_DIR (current file path)
if (NOT gs_project_path)
    set(gs_project_path ${CMAKE_CURRENT_SOURCE_DIR}/../..)
endif()

message('PROJECT-PATH: ' ${gs_project_path})
message(${CMAKE_C_COMPILER_ID})
message(${CMAKE_CXX_COMPILER_ID})
#message(${CMAKE_PREFIX_PATH})

set(gs_project_include_path ${gs_project_path}/include)
set(gs_project_3rd_path ${gs_project_path}/3rd)

if (NOT gs_project_deploy_path)
    set(gs_project_deploy_path ${gs_project_path}/build/deploy)
    if (UNIX)
        set(gs_project_output_path_debug ${gs_project_deploy_path}/unix/bin_d)
        set(gs_project_output_path_release ${gs_project_deploy_path}/unix/bin)
    endif()
    if (WIN32)
        set(gs_project_output_path_debug ${gs_project_deploy_path}/win32/bin_d)
        set(gs_project_output_path_release ${gs_project_deploy_path}/win32/bin)
        if(CMAKE_COMPILER_IS_GNUCC OR CMAKE_COMPILER_IS_GNUCXX)
            #        set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -static-libgcc -static-libstdc++")
            #        set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -static-libgcc -static-libstdc++")
            set(gs_project_output_path_debug ${gs_project_deploy_path}/win32/bin_gnu_d)
            set(gs_project_output_path_release ${gs_project_deploy_path}/win32/bin_gnu)
        endif()
    endif()

    SET( CMAKE_RUNTIME_OUTPUT_DIRECTORY_DEBUG "${gs_project_output_path_debug}")
    SET( CMAKE_RUNTIME_OUTPUT_DIRECTORY_RELEASE "${gs_project_output_path_release}")
    SET( CMAKE_LIBRARY_OUTPUT_DIRECTORY_DEBUG "${gs_project_output_path_debug}")
    SET( CMAKE_LIBRARY_OUTPUT_DIRECTORY_RELEASE "${gs_project_output_path_release}")
    SET( CMAKE_ARCHIVE_OUTPUT_DIRECTORY_DEBUG "${gs_project_output_path_debug}")
    SET( CMAKE_ARCHIVE_OUTPUT_DIRECTORY_RELEASE "${gs_project_output_path_release}")

    message(${gs_project_output_path_debug})
    message(${gs_project_output_path_release})
endif()

message("----------------------------------------------------------------------")

include(local.config.cmake)
include(common.cmake)

set_property(GLOBAL PROPERTY USE_FOLDERS ON)

include_directories(${gs_project_include_path})
include_directories(${gs_project_3rd_path})

set(gs_gcl_path ${CMAKE_CURRENT_SOURCE_DIR}/../..)

###lib exe
add_subdirectory(ccxx)
add_subdirectory(gcl)

message(bging 001)
#message(MSVC)
message(end 001)
