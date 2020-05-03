TEMPLATE = lib
TARGET = FreeCADApp

win32{
DEFINES += FCApp
DEFINES += BOOST_DYN_LINK
}


#if(WIN32)
#    add_definitions(-DFCApp)
#    add_definitions(-DBOOST_DYN_LINK)
#endif(WIN32)

#if(FREECAD_RELEASE_SEH)
#    add_definitions(-DHAVE_SEH)
#endif(FREECAD_RELEASE_SEH)

## This causes some problems with the resource files to be found, especially with the StartPage
#IF(RESOURCEDIR)
#    add_definitions(-DRESOURCEDIR="${RESOURCEDIR}")
#ENDIF(RESOURCEDIR)

#IF(DOCDIR)
#    add_definitions(-DDOCDIR="${DOCDIR}")
#ENDIF(DOCDIR)

#add_definitions(-DBOOST_${Boost_VERSION})

##if you want to use the old DAG structure uncomment this line
##add_definitions(-DUSE_OLD_DAG)

## -----------------------------------------------------------------------------

##write relevant cmake variables to a file for later access with python. Exported are all variables
##starting with BUILD. As the variable only exists if the user set it to ON a dict is useless, we
##use a python list for export.
#set(_vars "const char CMakeVariables[] =\"cmake = [")
#set(_delim "")
#get_cmake_property(_variableNames VARIABLES)
#foreach (_variableName ${_variableNames})
#    if (${_variableName})
#        STRING(REGEX MATCH "^[_]?[^_]*" _prefix "${_variableName}_")
#        if(${_prefix} STREQUAL "BUILD")
#            STRING(REPLACE "\\" "\\\\" _name ${_variableName})
#            set(_vars "${_vars}${_delim}\\n\"\n\"\\\"${_name}\\\"")
#            set(_delim ",")
#        endif()
#    endif ()
#endforeach()
#set(_vars "${_vars}]\\n\" \n;")
#file(WRITE ${CMAKE_CURRENT_BINARY_DIR}/CMakeScript.hh "${_vars}" )

#fc_copy_file_if_different(
#    "${CMAKE_CURRENT_BINARY_DIR}/CMakeScript.hh"
#    "${CMAKE_CURRENT_BINARY_DIR}/CMakeScript.h"
#)

# -----------------------------------------------------------------------------

INCLUDEPATH += \
#include_directories(
#    ${CMAKE_BINARY_DIR}/src
#    ${CMAKE_SOURCE_DIR}/src
#    ${CMAKE_CURRENT_BINARY_DIR}
    $$PWD/.. \
    $$Boost_INCLUDE_DIRS\
    $$PYTHON_INCLUDE_DIRS\
    $$XercesC_INCLUDE_DIRS\
    $$ZLIB_INCLUDE_DIR\
#)

LIBS += $$Boost_LIBRARIES

#set(FreeCADApp_LIBS
#    FreeCADBase
#    ${Boost_LIBRARIES}
#)

QT      += core xml

#if (BUILD_QT5)
#    include_directories(
#        ${Qt5Core_INCLUDE_DIRS}
#        ${Qt5Xml_INCLUDE_DIRS}
#    )
#    list(APPEND FreeCADApp_LIBS
#         ${Qt5Core_LIBRARIES}
#         ${Qt5Xml_LIBRARIES}
#    )
#else()
#    include_directories(
#        ${QT_QTCORE_INCLUDE_DIR}
#        ${QT_QTXML_INCLUDE_DIR}
#    )
#    list(APPEND FreeCADApp_LIBS
#        ${QT_QTCORE_LIBRARY}
#        ${QT_QTXML_LIBRARY}
#    )
#endif()



include(Xml.pri)

# The document stuff
include(Document.pri)

# The property stuff
include(Properties.pri)

SOURCES += \
#SET(FreeCADApp_CPP_SRCS
#    ${Document_CPP_SRCS}
#    ${Properties_CPP_SRCS}
    Application.cpp\
    ApplicationPy.cpp\
    AutoTransaction.cpp\
    Branding.cpp\
    ColorModel.cpp\
    ComplexGeoData.cpp\
    ComplexGeoDataPyImp.cpp\
    Enumeration.cpp\
    Material.cpp\
    MaterialPyImp.cpp\
#)

HEADERS += \
#SET(FreeCADApp_HPP_SRCS
#    ${Document_HPP_SRCS}
#    ${Properties_HPP_SRCS}
    Application.h \
    AutoTransaction.h \
    Branding.h \
    ColorModel.h \
    ComplexGeoData.h \
    Enumeration.h \
    Material.h \
#)

#SET(FreeCADApp_SRCS
#    ${FreeCADApp_CPP_SRCS}
#    ${FreeCADApp_HPP_SRCS}
#    ${FreeCADApp_XML_SRCS}
#    FreeCADInit.py
#    FreeCADTest.py
#    PreCompiled.cpp
#    PreCompiled.h
#)

DEFINES += _PreComp_
PRECOMPILED_HEADER += PreCompiled.h
#if(FREECAD_USE_PCH)
#    add_definitions(-D_PreComp_)
#    ADD_MSVC_PRECOMPILED_HEADER(FreeCADApp PreCompiled.h PreCompiled.cpp FreeCADApp_CPP_SRCS)
#endif(FREECAD_USE_PCH)

#add_library(FreeCADApp SHARED ${FreeCADApp_SRCS})

#target_link_libraries(FreeCADApp ${FreeCADApp_LIBS})

#add_dependencies(FreeCADApp fc_version)

#SET_BIN_DIR(FreeCADApp FreeCADApp)

#if(WIN32)
#    INSTALL(TARGETS FreeCADApp
#        RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
#        LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
#    )
#else(WIN32)
#    INSTALL(TARGETS FreeCADApp
#        LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
#    )
#endif(WIN32)


OTHER_FILES += CMakeLists.txt
