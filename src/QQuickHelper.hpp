#ifndef __QQUICKHELPER_HPP__
#define __QQUICKHELPER_HPP__

// ─────────────────────────────────────────────────────────────
//					INCLUDE
// ─────────────────────────────────────────────────────────────

// C Header
#include <stdint.h>

// C++ Header

// Qt Header
#include <QString>

// Dependancies Header

// Application Header

// ─────────────────────────────────────────────────────────────
//					DECLARATION
// ─────────────────────────────────────────────────────────────

#ifdef WIN32
	#ifdef QQUICKHELPER_SHARED	// Shared build
		#define QQUICKHELPER_API_ __declspec(dllexport)
	#elif QQUICKHELPER_STATIC 	// No decoration when building staticlly
		#define QQUICKHELPER_API_
	#else 				// Link to lib 
		#define QQUICKHELPER_API_ __declspec(dllimport)
	#endif
#else
	#define QQUICKHELPER_API_
#endif

#ifdef QQUICKHELPER_USE_NAMESPACE
#ifndef QQUICKHELPER_NAMESPACE
#define QQUICKHELPER_NAMESPACE Qqh
#endif
#define QQUICKHELPER_NAMESPACE_START namespace QQUICKHELPER_NAMESPACE {
#define QQUICKHELPER_NAMESPACE_END }
#define QQUICKHELPER_USING_NAMESPACE using namespace QQUICKHELPER_NAMESPACE;
#else
#undef QQUICKHELPER_NAMESPACE
#define QQUICKHELPER_NAMESPACE
#define QQUICKHELPER_NAMESPACE_START
#define QQUICKHELPER_NAMESPACE_END
#define QQUICKHELPER_USING_NAMESPACE
#endif

QQUICKHELPER_NAMESPACE_START

// ─────────────────────────────────────────────────────────────
//					CLASS
// ─────────────────────────────────────────────────────────────

/**
 */
class QQUICKHELPER_API_ QQuickHelper
{
public:
	static void RegisterTypes(const char* uri = nullptr);
	static void LoadRessources();
	/** Library Major Version */
	static uint32_t GetMajor();
	/** Library Minor Version */
	static uint32_t GetMinor();
	/** Library Patch Version */
	static uint32_t GetPatch();
	/** Library Tag Version */
	static uint32_t GetTag();
	/** Get version in form major.minor.patch.tag */
	static QString GetVersion();
};

QQUICKHELPER_NAMESPACE_END

#endif
