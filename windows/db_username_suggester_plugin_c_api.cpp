#include "include/db_username_suggester/db_username_suggester_plugin_c_api.h"

#include <flutter/plugin_registrar_windows.h>

#include "db_username_suggester_plugin.h"

void DbUsernameSuggesterPluginCApiRegisterWithRegistrar(
    FlutterDesktopPluginRegistrarRef registrar) {
  db_username_suggester::DbUsernameSuggesterPlugin::RegisterWithRegistrar(
      flutter::PluginRegistrarManager::GetInstance()
          ->GetRegistrar<flutter::PluginRegistrarWindows>(registrar));
}
