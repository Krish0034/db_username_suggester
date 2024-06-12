#ifndef FLUTTER_PLUGIN_DB_USERNAME_SUGGESTER_PLUGIN_H_
#define FLUTTER_PLUGIN_DB_USERNAME_SUGGESTER_PLUGIN_H_

#include <flutter/method_channel.h>
#include <flutter/plugin_registrar_windows.h>

#include <memory>

namespace db_username_suggester {

class DbUsernameSuggesterPlugin : public flutter::Plugin {
 public:
  static void RegisterWithRegistrar(flutter::PluginRegistrarWindows *registrar);

  DbUsernameSuggesterPlugin();

  virtual ~DbUsernameSuggesterPlugin();

  // Disallow copy and assign.
  DbUsernameSuggesterPlugin(const DbUsernameSuggesterPlugin&) = delete;
  DbUsernameSuggesterPlugin& operator=(const DbUsernameSuggesterPlugin&) = delete;

  // Called when a method is called on this plugin's channel from Dart.
  void HandleMethodCall(
      const flutter::MethodCall<flutter::EncodableValue> &method_call,
      std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>> result);
};

}  // namespace db_username_suggester

#endif  // FLUTTER_PLUGIN_DB_USERNAME_SUGGESTER_PLUGIN_H_
