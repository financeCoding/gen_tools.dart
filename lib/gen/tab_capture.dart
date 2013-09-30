/* This file has been generated from tab_capture.idl - do not edit */

library chrome.tabCapture;

import '../src/common.dart';

/// Accessor for the `chrome.tabCapture` namespace.
final ChromeTabCapture tabCapture = new ChromeTabCapture._();

class ChromeTabCapture {
  static final JsObject _tabCapture = context['chrome']['tabCapture'];

  ChromeTabCapture._();

  /**
   * Captures the visible area of the currently active tab.
   *  This method can only be used on the currently active page after the
   *  extension has been <em>invoked</em>, similar to the way that
   *  <a href="activeTab.html">activeTab</a> works.
   *  Note that Chrome internal pages cannot be captured.
   *  |options| : Configures the returned media stream.
   *  |callback| : Callback with either the stream returned or null.
   *  Returns a list of tabs that have requested capture or are being
   *  captured, i.e. status != stopped and status != error.
   *  This allows extensions to inform the user that there is an existing
   *  tab capture that would prevent a new tab capture from succeeding (or
   *  to prevent redundant requests for the same tab).
   */
  Future capture(CaptureOptions options) {
    ChromeCompleter completer = new ChromeCompleter.noArgs();
    _tabCapture.callMethod('capture', [options, completer.callback]);
    return completer.future;
  }

  /**
   * 
   */
  Future getCapturedTabs() {
    ChromeCompleter completer = new ChromeCompleter.noArgs();
    _tabCapture.callMethod('getCapturedTabs', [completer.callback]);
    return completer.future;
  }

  /**
   * Event fired when the capture status of a tab changes.
   *  This allows extension authors to keep track of the capture status of
   *  tabs to keep UI elements like page actions and infobars in sync.
   */
  Stream<CaptureInfo> get onStatusChanged => _onStatusChanged.stream;

  final ChromeStreamController<CaptureInfo> _onStatusChanged =
      new ChromeStreamController<CaptureInfo>.oneArg(_tabCapture['onStatusChanged'], CaptureInfo.create);
}

/**
 * Copyright (c) 2012 The Chromium Authors. All rights reserved.
 *  Use of this source code is governed by a BSD-style license that can be
 *  found in the LICENSE file.
 *  Use the <code>chrome.tabCapture</code> API to interact with tab media
 *  streams.
 */
class TabCaptureState extends ChromeEnum {
  static const TabCaptureState PENDING = const TabCaptureState._('pending');
  static const TabCaptureState ACTIVE = const TabCaptureState._('active');
  static const TabCaptureState STOPPED = const TabCaptureState._('stopped');
  static const TabCaptureState ERROR = const TabCaptureState._('error');

  static List<TabCaptureState> _values = [PENDING, ACTIVE, STOPPED, ERROR];

  static List<TabCaptureState> get values => _values;

  static TabCaptureState create(String str) =>
      _values.singleWhere((ChromeEnum e) => e.value == str);

  const TabCaptureState._(String str): super(str);
}

/**
 * MediaTrackConstraints for the media streams that will be passed to WebRTC.
 *  See section on MediaTrackConstraints:
 *  http://dev.w3.org/2011/webrtc/editor/getusermedia.html
 */
class CaptureInfo extends ChromeObject {
  static CaptureInfo create(JsObject proxy) => proxy == null ? null : new CaptureInfo.fromProxy(proxy);

  CaptureInfo({int tabId, TabCaptureState status, bool fullscreen}) {
    if (tabId != null) this.tabId = tabId;
    if (status != null) this.status = status;
    if (fullscreen != null) this.fullscreen = fullscreen;
  }

  CaptureInfo.fromProxy(JsObject proxy): super.fromProxy(proxy);

  int get tabId => proxy['tabId'];
  set tabId(int value) => proxy['tabId'] = value;

  TabCaptureState get status => TabCaptureState.create(proxy['status']);
  set status(TabCaptureState value) => proxy['status'] = value;

  bool get fullscreen => proxy['fullscreen'];
  set fullscreen(bool value) => proxy['fullscreen'] = value;
}

/**
 * Whether we are requesting tab video and/or audio and the
 *  MediaTrackConstraints that should be set for these streams.
 */
class MediaStreamConstraint extends ChromeObject {
  static MediaStreamConstraint create(JsObject proxy) => proxy == null ? null : new MediaStreamConstraint.fromProxy(proxy);

  MediaStreamConstraint({var mandatory}) {
    if (mandatory != null) this.mandatory = mandatory;
  }

  MediaStreamConstraint.fromProxy(JsObject proxy): super.fromProxy(proxy);

  dynamic get mandatory => proxy['mandatory'];
  set mandatory(var value) => proxy['mandatory'] = value;
}

/**
 * 
 */
class CaptureOptions extends ChromeObject {
  static CaptureOptions create(JsObject proxy) => proxy == null ? null : new CaptureOptions.fromProxy(proxy);

  CaptureOptions({bool audio, bool video, MediaStreamConstraint audioConstraints, MediaStreamConstraint videoConstraints}) {
    if (audio != null) this.audio = audio;
    if (video != null) this.video = video;
    if (audioConstraints != null) this.audioConstraints = audioConstraints;
    if (videoConstraints != null) this.videoConstraints = videoConstraints;
  }

  CaptureOptions.fromProxy(JsObject proxy): super.fromProxy(proxy);

  bool get audio => proxy['audio'];
  set audio(bool value) => proxy['audio'] = value;

  bool get video => proxy['video'];
  set video(bool value) => proxy['video'] = value;

  MediaStreamConstraint get audioConstraints => MediaStreamConstraint.create(proxy['audioConstraints']);
  set audioConstraints(MediaStreamConstraint value) => proxy['audioConstraints'] = value;

  MediaStreamConstraint get videoConstraints => MediaStreamConstraint.create(proxy['videoConstraints']);
  set videoConstraints(MediaStreamConstraint value) => proxy['videoConstraints'] = value;
}
