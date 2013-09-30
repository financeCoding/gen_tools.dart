/* This file has been generated from desktop_capture.idl - do not edit */

library chrome.desktopCapture;

import '../src/common.dart';

/// Accessor for the `chrome.desktopCapture` namespace.
final ChromeDesktopCapture desktopCapture = new ChromeDesktopCapture._();

class ChromeDesktopCapture {
  static final JsObject _desktopCapture = context['chrome']['desktopCapture'];

  ChromeDesktopCapture._();

  /**
   * Shows desktop media picker UI with the specified set of sources.
   * 
   *  |sources|: Set of sources that should be shown to the user.
   * 
   *  |origin|: Optional origin of the page for which the stream is created. If
   *  not specified then the resulting stream can be used only the calling
   *  extension, otherwise the stream can be used only by a page with the
   *  specified origin.
   */
  Future chooseDesktopMedia(DesktopCaptureSourceType sources, [String origin]) {
    ChromeCompleter completer = new ChromeCompleter.noArgs();
    _desktopCapture.callMethod('chooseDesktopMedia', [sources, origin, completer.callback]);
    return completer.future;
  }
}

/**
 * Copyright 2013 The Chromium Authors. All rights reserved.
 *  Use of this source code is governed by a BSD-style license that can be
 *  found in the LICENSE file.
 *  Desktop Capture API that can be used to capture content of screen or
 *  individual windows or tabs.
 *  Enum used to define set of desktop media sources used in
 *  chooseDesktopMedia().
 *  |streamId|: An opaque string that can be passed to
 *  <code>getUserMedia()</code> API to generate media stream that corresponds
 *  to the source selected by the user. If user didn't select any source
 *  (i.e. canceled the prompt) then the callback is called with an empty
 *  <code>streamId</code>.
 */
class DesktopCaptureSourceType extends ChromeEnum {
  static const DesktopCaptureSourceType SCREEN = const DesktopCaptureSourceType._('screen');
  static const DesktopCaptureSourceType WINDOW = const DesktopCaptureSourceType._('window');
  static const DesktopCaptureSourceType TAB = const DesktopCaptureSourceType._('tab');

  static List<DesktopCaptureSourceType> _values = [SCREEN, WINDOW, TAB];

  static List<DesktopCaptureSourceType> get values => _values;

  static DesktopCaptureSourceType create(String str) =>
      _values.singleWhere((ChromeEnum e) => e.value == str);

  const DesktopCaptureSourceType._(String str): super(str);
}
