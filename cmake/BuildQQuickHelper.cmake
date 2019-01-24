#
#	Download Script by Olivier Le Doeuff
#
## CMAKE INPUT	
#	
#	-QQUICKHELPER_REPOSITORY : QQuickHelper repository url
#	-QQUICKHELPER_TAG : QQuickHelper git tag
#
## CMAKE OUTPUT
# 
#

MESSAGE(STATUS "Build QQuickHelper Started")
# repository path & tag
IF( NOT QQUICKHELPER_REPOSITORY )
	SET( QQUICKHELPER_REPOSITORY "https://github.com/OlivierLDff/QQuickHelper.git" CACHE STRING "QQuickHelper repository, can be a local URL" FORCE )
ENDIF()
MESSAGE(STATUS "QQuickHelper repository folder: " ${QQUICKHELPER_REPOSITORY})

IF( NOT DEFINED QQUICKHELPER_TAG )
	SET( QQUICKHELPER_TAG master CACHE STRING "QQuickHelper git tag" FORCE )
ENDIF()
MESSAGE( STATUS "QQuickHelper repository tag: " ${QQUICKHELPER_TAG} )

INCLUDE( ${PROJECT_SOURCE_DIR}/cmake/DownloadProject.cmake )

DOWNLOAD_PROJECT(PROJ 	QQuickHelper
	GIT_REPOSITORY 		${QQUICKHELPER_REPOSITORY}
	GIT_TAG 			${QQUICKHELPER_TAG}
	UPDATE_DISCONNECTED 1
	QUIET
	)

ADD_SUBDIRECTORY( ${QQuickHelper_SOURCE_DIR} ${QQuickHelper_BINARY_DIR} )