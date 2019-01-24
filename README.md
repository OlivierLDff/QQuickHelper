Qt Quick Helper
===============

A collection of helper for QtQuick and QtQuickControls to build faster UI using Qml. This library contain multiple override of QtQuickControls (Material) to match better google guideline and allow more customization.

## Dependencies

- [Doxygen](https://github.com/doxygen/doxygen) : To generate the documentation.
- [DoxygenBootstrapped](https://github.com/OlivierLDff/DoxygenBootstrapped) : Integrate doxygen with CMake. *v1.3.2*.
- *QtCore QtGui QtQuick QtQuickControls2*

## API

* The documentation can be found [here](https://olivierldff.github.io/QQuickHelperDoc/)

## Release

* `5.11` : Based on QtQuick 5.11 

## CMake

### Build

```bash
git clone https://github.com/OlivierLDff/QtQuickHelper
cd QQuickHelper && mkdir build && cd build
cmake -DQT_DIR="path/to/Qt/toolchain" -DQQUICKHELPER_BUILD_SHARED=ON -DQQUICKHELPER_USE_NAMESPACE=ON -DQQUICKHELPER_BUILD_DOC=ON ..
make
```

### Input

- **QQUICKHELPER_TARGET** : Name of the library target. *Default : "QQuickHelper"*
- **QQUICKHELPER_PROJECT** : Name of the project. *Default : "QQuickHelper"*
- **QQUICKHELPER_BUILD_SHARED** : Build shared library [ON OFF]. *Default: OFF.*
- **QQUICKHELPER_BUILD_STATIC** : Build static library [ON OFF]. *Default: ON.*
- **QQUICKHELPER_USE_NAMESPACE** : If the library compile with a namespace [ON OFF]. *Default: ON.*
- **QQUICKHELPER_NAMESPACE** : Namespace for the library. Only relevant if QQUICKHELPER_USE_NAMESPACE is ON. *Default: "Qqh".*

### Output

- **QQUICKHELPER_TARGET** : Output target to link to.
- **QQUICKHELPER_VERSION** : Current version of the library

### Integration in CMake project

The main goal of this CMake project is to big included into another CMake project.

```cmake
SET( QQUICKHELPER_TARGET QQuickHelper )
SET( QQUICKHELPER_PROJECT QQuickHelper )
SET( QQUICKHELPER_BUILD_SHARED OFF )
SET( QQUICKHELPER_BUILD_STATIC ON )
ADD_SUBDIRECTORY(${CMAKE_CURRENT_SOURCE_DIR}/path/to/QQuickHelper ${CMAKE_CURRENT_BINARY_DIR}/QQuickHelper_Build)
```

It is also possible to download the repository with the scripts inside `cmake/`. folder Simply call `BuildQQuickHelper.cmake`.

You will need:

- `DownloadProject.cmake`
- `DownloadProject.CMakeLists.cmake.in`
- `BuildQQuickHelper.cmake`

```cmake
SET( QQUICKHELPER_TARGET QQuickHelper )
SET( QQUICKHELPER_PROJECT QQuickHelper )
SET( QQUICKHELPER_BUILD_SHARED OFF )
SET( QQUICKHELPER_BUILD_STATIC ON )
SET( QQUICKHELPER_USE_NAMESPACE ON )
SET( QQUICKHELPER_REPOSITORY "https://github.com/OlivierLDff/QQuickHelper.git" )
SET( QQUICKHELPER_TAG v1.0.1 )
INCLUDE(path/to/BuildQQuickHelper.cmake)
```