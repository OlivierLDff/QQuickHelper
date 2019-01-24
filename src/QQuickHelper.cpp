// ─────────────────────────────────────────────────────────────
//					INCLUDE
// ─────────────────────────────────────────────────────────────

// C Header

// C++ Header

// Qt Header
#include <QCoreApplication>

// Dependancies Header

// Application Header
#include <QQuickHelper.hpp>

// ─────────────────────────────────────────────────────────────
//					DECLARATION
// ─────────────────────────────────────────────────────────────

// ─────────────────────────────────────────────────────────────
//					FUNCTIONS
// ─────────────────────────────────────────────────────────────

static const char* _defaultUri = "QQuickHelper";
static const char** _uri = &_defaultUri;
static void RegisterTypes() { }
static void RegisterTypes(const char* uri) { _uri = &uri; RegisterTypes(); }
static void LoadRessources() { Q_INIT_RESOURCE(QQuickHelperControls); }

Q_COREAPP_STARTUP_FUNCTION(RegisterTypes)
Q_COREAPP_STARTUP_FUNCTION(LoadRessources)

QQUICKHELPER_USING_NAMESPACE;

void QQuickHelper::RegisterTypes(const char* uri)
{
	::RegisterTypes(uri);
}

void QQuickHelper::LoadRessources()
{
	::LoadRessources();
}

uint32_t QQuickHelper::GetMajor()
{
	return QQUICKHELPER_VERSION_MAJOR;
}

uint32_t QQuickHelper::GetMinor()
{
	return QQUICKHELPER_VERSION_MINOR;
}

uint32_t QQuickHelper::GetPatch()
{
	return QQUICKHELPER_VERSION_PATCH;
}

uint32_t QQuickHelper::GetTag()
{
	return QQUICKHELPER_VERSION_TAG_HEX;
}

QString QQuickHelper::GetVersion()
{
	return QString::number(GetMajor()) + "." +
		QString::number(GetMinor()) + "." +
		QString::number(GetTag()) + "." +
		QString::number(GetTag(),16);
}
