TEMPLATE = lib
TARGET = FreeCADBase

win32{
    DEFINES += FCBase
    DEFINES += PYCXX_DLL
    DEFINES += BOOST_DYN_LINK
    DEFINES += ZIPIOS_UTF8
}

INCLUDEPATH += \
#    $$OUT_PWD/src \
#    $$PWD/src \
    $$PWD/.. \
#    $$CMAKE_CURRENT_BINARY_DIR} \
#    $$CMAKE_CURRENT_SOURCE_DIR} \
    $$Boost_INCLUDE_DIRS \
    $$PYTHON_INCLUDE_DIRS \
    $$XercesC_INCLUDE_DIRS \
    $$ZLIB_INCLUDE_DIR \
    $$PYCXX_INCLUDE_DIR \

msvc{
    FreeCADBase_LIBS += \
        $$Boost_LIBRARIES \
        $$XercesC_LIBRARIES \
        $$ZLIB_LIBRARIES \
        Rpcrt4.lib \
        version.lib \

        debug{
            FreeCADBase_LIBS += MSVCRTD.LIB MSVCPRTD.LIB
        } else {
            FreeCADBase_LIBS += MSVCRT.LIB MSVCPRT.LIB
        }

        #if (NOT (CMAKE_CXX_COMPILER_VERSION VERSION_LESS "19"))
        debug{
            FreeCADBase_LIBS += vcruntimed.lib ucrtd.lib concrtd.lib
        } else {
            FreeCADBase_LIBS += vcruntime.lib ucrt.lib concrt.lib
        }
}

QT += core

#if (BUILD_DYNAMIC_LINK_PYTHON)
#    list(APPEND FreeCADBase_LIBS ${PYTHON_LIBRARIES})
#endif (BUILD_DYNAMIC_LINK_PYTHON)

#generate_from_xml(TypePy)
#generate_from_xml(BaseClassPy)
#generate_from_xml(BoundBoxPy)
#generate_from_xml(CoordinateSystemPy)
#generate_from_xml(PersistencePy)
#generate_from_xml(VectorPy)
#generate_from_xml(MatrixPy)
#generate_from_xml(RotationPy)
#generate_from_xml(PlacementPy)
#generate_from_xml(AxisPy)
#generate_from_xml(UnitPy)
#generate_from_xml(QuantityPy)
#generate_from_any(Parameter.xsd Parameter.inl xmlSchemeString)

#if(SWIG_FOUND)
#    # Create the file swigpyrun.hh and then compare with the file swigpyrun.h.
#    # If the files are different or if swigpyrun.h doesn't exist then copy swigpyrun.hh.
#    # This is to avoid to having to build the target each time cmake configure is executed.
#    execute_process(COMMAND ${SWIG_EXECUTABLE} -python -external-runtime ${CMAKE_CURRENT_BINARY_DIR}/swigpyrun.hh)

#    fc_copy_file_if_different(
#        "${CMAKE_CURRENT_BINARY_DIR}/swigpyrun.hh"
#        "${CMAKE_CURRENT_BINARY_DIR}/swigpyrun.h"
#    )
#    add_definitions(-DHAVE_SWIG=1)
#endif(SWIG_FOUND)

#if (EXISTS ${CMAKE_SOURCE_DIR}/src/zipios++ AND NOT FREECAD_USE_EXTERNAL_ZIPIOS)
exists($$PWD/../zipios++): include($$PWD/../zipios++/zipios++.pri)

#SOURCE_GROUP("pycxx" FILES ${PYCXX_SOURCES})

OTHER_FILES += \
#SET(FreeCADBase_XML_SRCS
    AxisPy.xml \
    BaseClassPy.xml \
    BoundBoxPy.xml \
    CoordinateSystemPy.xml \
    MatrixPy.xml \
    PersistencePy.xml \
    PlacementPy.xml \
    RotationPy.xml \
    VectorPy.xml \
    QuantityPy.xml \
    TypePy.xml \
    UnitPy.xml \
#)
#SOURCE_GROUP("XML" FILES ${FreeCADBase_XML_SRCS})

HEADERS += \
#set(FreeCADBase_MOC_HDRS
    Debugger.h \
    FutureWatcherProgress.h \
#)
#fc_wrap_cpp(FreeCADBase_MOC_SRCS ${FreeCADBase_MOC_HDRS})

include(UnitAPI.pri)

#if(PYTHON_VERSION_MAJOR LESS 3)
#SET(SWIG_SRCS
#    swigpyrun_1.3.25.cpp
#    swigpyrun_1.3.33.cpp
#    swigpyrun_1.3.36.cpp
#    swigpyrun_1.3.38.cpp
#    swigpyrun_1.3.40.cpp
#    swigpyrun.cpp
#)
#else(PYTHON_VERSION_MAJOR LESS 3)
#SET(SWIG_SRCS
#    swigpyrun.cpp
#)
#endif(PYTHON_VERSION_MAJOR LESS 3)
SOURCES += swigpyrun.cpp

#SET(FreeCADBase_CPP_SRCS
SOURCES += \
    Axis.cpp \
    AxisPyImp.cpp \
    Base64.cpp \
    BaseClass.cpp \
    BaseClassPyImp.cpp \
    BoundBoxPyImp.cpp \
    Builder3D.cpp \
    Console.cpp \
    CoordinateSystem.cpp \
    CoordinateSystemPyImp.cpp \
    Debugger.cpp \
    DualQuaternion.cpp \
    Exception.cpp \
    ExceptionFactory.cpp \
    Factory.cpp \
    FileInfo.cpp \
    FileTemplate.cpp \
    FutureWatcherProgress.cpp \
    gzstream.cpp \
    gzstream.h \
    GeometryPyCXX.cpp \
    Handle.cpp \
    InputSource.cpp \
    Interpreter.cpp \
    Matrix.cpp \
    MatrixPyImp.cpp \
    MemDebug.cpp \
    Parameter.xsd \
    Parameter.cpp \
    ParameterPy.cpp \
    Persistence.cpp \
    PersistencePyImp.cpp \
    Placement.cpp \
    PlacementPyImp.cpp \
    PyExport.cpp \
    PyObjectBase.cpp \
    Reader.cpp \
    Rotation.cpp \
    RotationPyImp.cpp \
    Sequencer.cpp \
    Stream.cpp \
    Swap.cpp \
    TimeInfo.cpp  \
    Tools.cpp \
    Tools2D.cpp \
    Translate.cpp \
    Type.cpp \
    TypePyImp.cpp \
    Uuid.cpp \
    Vector3D.cpp \
    VectorPyImp.cpp \
    ViewProj.cpp \
    Writer.cpp \
    XMLTools.cpp \
#)

#if(PYTHON_VERSION_MAJOR LESS 3)
#SET(SWIG_HEADERS
#    swigpyrun_1.3.25.h
#    swigpyrun_1.3.33.h
#    swigpyrun_1.3.36.h
#    swigpyrun_1.3.38.h
#    swigpyrun_1.3.40.h
#    swigpyrun.inl
#)
#else(PYTHON_VERSION_MAJOR LESS 3)
#SET(SWIG_HEADERS
#    swigpyrun.inl
#)
#endif(PYTHON_VERSION_MAJOR LESS 3)
HEADERS += swigpyrun.inl

#SET(FreeCADBase_HPP_SRCS
HEADERS += \
    Axis.h  \
    Base64.h \
    BaseClass.h \
    BoundBox.h \
    Builder3D.h \
    Console.h \
    Converter.h \
    CoordinateSystem.h \
    Debugger.h \
    DualNumber.h \
    DualQuaternion.h \
    Exception.h \
    ExceptionFactory.h \
    Factory.h \
    FileInfo.h \
    FileTemplate.h \
    FutureWatcherProgress.h \
    fdstream.hpp \
    gzstream.h \
    GeometryPyCXX.h \
    Handle.h \
    InputSource.h \
    Interpreter.h \
    Matrix.h \
    MemDebug.h \
    Observer.h \
    Parameter.h \
    Persistence.h \
    Placement.h \
    PyExport.h \
    PyObjectBase.h \
    Reader.h \
    Rotation.h \
    Sequencer.h \
    StdStlTools.h \
    Stream.h \
    Swap.h \
#    ${SWIG_HEADERS}
    TimeInfo.h \
    Tools.h \
    Tools2D.h \
    Translate.h \
    Type.h \
    Uuid.h \
    Vector3D.h \
    ViewProj.h \
    Writer.h \
    XMLTools.h \
#)

#SET(FreeCADBase_SRCS
#    ${PYCXX_SOURCES}
#    ${FreeCADBase_CPP_SRCS}
#    ${FreeCADBase_HPP_SRCS}
#    ${FreeCADBase_XML_SRCS}
#    ${FreeCADBase_UNITAPI_SRCS}
SOURCES +=    PyTools.c
HEADERS +=    PyTools.h
SOURCES +=     PreCompiled.cpp
HEADERS +=     PreCompiled.h
#)

msvc{
HEADERS += StackWalker.h
SOURCES += StackWalker.h
}

#IF (MSVC)
#    SET(FreeCADBase_SRCS
#        ${FreeCADBase_SRCS}
#        StackWalker.cpp
#        StackWalker.h
#)
#ENDIF(MSVC)

# Use external zipios++ if specified.
#if(FREECAD_USE_EXTERNAL_ZIPIOS)
#    find_library(ZIPIOS_LIBRARY zipios)
#    find_path(ZIPIOS_INCLUDES zipios++/zipios-config.h)
#    if(ZIPIOS_LIBRARY)
#        message(STATUS "Found zipios++: ${ZIPIOS}")
#    endif()
#    if(ZIPIOS_INCLUDES)
#        message(STATUS "Found zipios++ headers.")
#    endif()
#    if(ZIPIOS_LIBRARY AND ZIPIOS_INCLUDES)
#        list(APPEND FreeCADBase_LIBS ${ZIPIOS_LIBRARY})
#        include_directories(${ZIPIOS_INCLUDES})
#    else()
#        message(FATAL_ERROR "Using external zipios++ was specified but was not found.")
#    endif()
#else(FREECAD_USE_EXTERNAL_ZIPIOS)
#    list(APPEND FreeCADBase_SRCS ${zipios_SRCS})
#endif(FREECAD_USE_EXTERNAL_ZIPIOS)

DEFINES += _PreComp_
PRECOMPILED_HEADER += PreCompiled.h
#if(FREECAD_USE_PCH)
#    add_definitions(-D_PreComp_)
#    ADD_MSVC_PRECOMPILED_HEADER(FreeCADBase PreCompiled.h PreCompiled.cpp FreeCADBase_CPP_SRCS)
#endif(FREECAD_USE_PCH)

#add_library(FreeCADBase SHARED ${FreeCADBase_SRCS})

#target_link_libraries(FreeCADBase ${FreeCADBase_LIBS})

#SET_BIN_DIR(FreeCADBase FreeCADBase)

#if(WIN32)
#    INSTALL(TARGETS FreeCADBase
#        RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
#        LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
#    )
#else(WIN32)
#    INSTALL(TARGETS FreeCADBase
#        LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
#    )
#endif(WIN32)

OTHER_FILES += CMakeLists.txt
