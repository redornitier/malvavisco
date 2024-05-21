cmake_minimum_required(VERSION 3.14)

project(malvavisco VERSION 0.1 LANGUAGES CXX)
add_compile_definitions(QT_DISABLE_DEPRECATED_UP_TO=0x050F00)

set(CMAKE_AUTOUIC ON)
set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(QT NAMES Qt6 REQUIRED COMPONENTS Core Quick Sql)
find_package(Qt${QT_VERSION_MAJOR} REQUIRED COMPONENTS Core Quick Sql)
find_package(Qt${QT_VERSION_MAJOR} COMPONENTS Core5Compat REQUIRED)

set(PROJECT_HEADERS
    src/controller/blancocontroller.h
    src/model/blancomodel.h
    src/model/gamemodel.h
)

set(PROJECT_SOURCES
        src/main.cpp
        src/qml/qml.qrc
        src/model/blancomodel.cpp
        src/model/gamemodel.cpp
        src/controller/blancocontroller.cpp
)

set(recursos
        src/qml/qml.qrc
        res/fonts.qrc
        res/json.qrc
        res/db.qrc
        res/image.qrc
        src/qml/qml.qrc
)

if(${QT_VERSION_MAJOR} GREATER_EQUAL 6)
    qt_add_executable(malvavisco
        MANUAL_FINALIZATION
        ${PROJECT_HEADERS}
        ${PROJECT_SOURCES}
        ${recursos}
    )
# Define target properties for Android with Qt 6 as:
#    set_property(TARGET malvavisco APPEND PROPERTY QT_ANDROID_PACKAGE_SOURCE_DIR
#                 ${CMAKE_CURRENT_SOURCE_DIR}/android)
# For more information, see https://doc.qt.io/qt-6/qt-add-executable.html#target-creation
else()
    if(ANDROID)
        add_library(malvavisco SHARED
            ${PROJECT_HEADERS}
            ${PROJECT_SOURCES}
            ${recursos}
        )
# Define properties for Android with Qt 5 after find_package() calls as:
#    set(ANDROID_PACKAGE_SOURCE_DIR "${CMAKE_CURRENT_SOURCE_DIR}/android")
    else()
        add_executable(malvavisco
            ${PROJECT_HEADERS}
            ${PROJECT_SOURCES}
            ${recursos}
        )
    endif()
endif()

target_link_libraries(malvavisco
  PRIVATE Qt${QT_VERSION_MAJOR}::Core Qt${QT_VERSION_MAJOR}::Quick Qt${QT_VERSION_MAJOR}::Sql)

install(TARGETS malvavisco
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR})

if(QT_VERSION_MAJOR EQUAL 6)
    qt_import_qml_plugins(malvavisco)
    qt_finalize_executable(malvavisco)
endif()
