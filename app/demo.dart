
import 'dart:html';

import 'package:gen_tools/chrome_app.dart' as chrome;

/**
 * For non-trivial uses of the Chrome apps API, please see the 'chrome'
 * package.
 *
 * http://pub.dartlang.org/packages/chrome
 * http://developer.chrome.com/apps/api_index.html
 */
void main() {
  label('i18n');
  action("message", handleI18NMessage);
  action("languages", handleI18NLanguages);
  br();

  label('idle');
  action('queryState', handleIdleQueryState);
  br();

  label('permissions');
  action('getAll', handlePermissionsGetAll);
  action('getAll().origins', handlePermissionsOrigins);
  br();

  label('runtime');
  action("id", handleRuntimeId);
  action("path", handleRuntimeURL);
  action("reload", handleRuntimeReload);
  action('getPlatformInfo', handleGetPlatformInfo);
  action('getPackageDirectoryEntry', handleGetPackageDirectoryEntry);
  br();

  label('tts');
  action('getVoices', handleGetVoices);
  br();
}

void label(String str) {
  SpanElement span = new SpanElement();
  span.text = str;
  query('#container_id').children.add(span);
}

void action(String name, Function callback) {
  ButtonElement button = new ButtonElement();
  button.text = name;
  button.onClick.listen((e) => callback());

  query('#container_id').children.add(button);
}

void br() {
  query('#container_id').children.add(new BRElement());
}

void summary(String str) {
  query("#summary").text = "[${str}]";
}

void notes(String str) {
  query("#notes").text = str;
}

// actions

void handleI18NMessage() {
  summary(chrome.i18n.getMessage('foo'));
}

void handleI18NLanguages() {
  chrome.i18n.getAcceptLanguages().then((List<String> list) {
    summary(list.join(', '));
  });
}

void handleRuntimeId() {
  summary(chrome.runtime.id);
}

void handleRuntimeURL() {
  summary(chrome.runtime.getURL('foo'));
}

void handleRuntimeReload() {
  chrome.runtime.reload();
}

void handleIdleQueryState() {
  chrome.idle.queryState(15).then((String state) {
    summary(state);
  });
}

void handlePermissionsGetAll() {
  chrome.permissions.getAll().then((chrome.Permissions perms) {
    summary(perms.permissions.toString());
  });
}

void handlePermissionsOrigins() {
  chrome.permissions.getAll().then((chrome.Permissions perms) {
    summary(perms.origins.toString());
  });
}

void handleGetVoices() {
  // TODO: the list JsObject conversion still needs to be implemented
  chrome.tts.getVoices().then((List<chrome.TtsVoice> voices) {
    summary(voices.map((v) => "${v.voiceName} ${v.lang}").toString());
  });
}

void handleGetPlatformInfo() {
  chrome.runtime.getPlatformInfo().then((Map m) {
    summary(m.toString());
  });
}

void handleGetPackageDirectoryEntry() {
  chrome.runtime.getPackageDirectoryEntry().then((chrome.DirectoryEntry dir) {
    summary(dir.toString());
  });
}