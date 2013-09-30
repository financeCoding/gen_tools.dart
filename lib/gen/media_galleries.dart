/* This file has been generated from media_galleries.idl - do not edit */

library chrome.mediaGalleries;

import '../src/common.dart';

/// Accessor for the `chrome.mediaGalleries` namespace.
final ChromeMediaGalleries mediaGalleries = new ChromeMediaGalleries._();

class ChromeMediaGalleries {
  static final JsObject _mediaGalleries = context['chrome']['mediaGalleries'];

  ChromeMediaGalleries._();

  /**
   * Get the media galleries configured in this user agent. If none are
   *  configured or available, the callback will receive an empty array.
   *  Get metadata about a specific media file system.
   */
  Future getMediaFileSystems([MediaFileSystemsDetails details]) {
    ChromeCompleter completer = new ChromeCompleter.noArgs();
    _mediaGalleries.callMethod('getMediaFileSystems', [details, completer.callback]);
    return completer.future;
  }

  /**
   * 
   */
  void getMediaFileSystemMetadata(var mediaFileSystem) {
    _mediaGalleries.callMethod('getMediaFileSystemMetadata', [mediaFileSystem]);
  }
}

/**
 * Copyright (c) 2012 The Chromium Authors. All rights reserved.
 *  Use of this source code is governed by a BSD-style license that can be
 *  found in the LICENSE file.
 * Use the <code>chrome.mediaGalleries</code> API to access media files
 * (images,
 *  video, audio) from the user's local disks (with the user's consent).
 *  Do not act interactively.
 *  Do not act interactively.
 *  Ask the user to manage permitted media galleries.
 *  Ask the user to manage permitted galleries only if the return set would
 *  otherwise be empty.
 */
class GetMediaFileSystemsInteractivity extends ChromeEnum {
  static const GetMediaFileSystemsInteractivity NO = const GetMediaFileSystemsInteractivity._('no');
  static const GetMediaFileSystemsInteractivity YES = const GetMediaFileSystemsInteractivity._('yes');
  static const GetMediaFileSystemsInteractivity IF_NEEDED = const GetMediaFileSystemsInteractivity._('if_needed');

  static List<GetMediaFileSystemsInteractivity> _values = [NO, YES, IF_NEEDED];

  static List<GetMediaFileSystemsInteractivity> get values => _values;

  static GetMediaFileSystemsInteractivity create(String str) =>
      _values.singleWhere((ChromeEnum e) => e.value == str);

  const GetMediaFileSystemsInteractivity._(String str): super(str);
}

/**
 * 
 */
class MediaFileSystemsDetails extends ChromeObject {
  static MediaFileSystemsDetails create(JsObject proxy) => proxy == null ? null : new MediaFileSystemsDetails.fromProxy(proxy);

  MediaFileSystemsDetails({GetMediaFileSystemsInteractivity interactive}) {
    if (interactive != null) this.interactive = interactive;
  }

  MediaFileSystemsDetails.fromProxy(JsObject proxy): super.fromProxy(proxy);

  GetMediaFileSystemsInteractivity get interactive => GetMediaFileSystemsInteractivity.create(proxy['interactive']);
  set interactive(GetMediaFileSystemsInteractivity value) => proxy['interactive'] = value;
}

/**
 * 
 */
class MediaFileSystemMetadata extends ChromeObject {
  static MediaFileSystemMetadata create(JsObject proxy) => proxy == null ? null : new MediaFileSystemMetadata.fromProxy(proxy);

  MediaFileSystemMetadata({String name, String galleryId, String deviceId, bool isRemovable, bool isMediaDevice}) {
    if (name != null) this.name = name;
    if (galleryId != null) this.galleryId = galleryId;
    if (deviceId != null) this.deviceId = deviceId;
    if (isRemovable != null) this.isRemovable = isRemovable;
    if (isMediaDevice != null) this.isMediaDevice = isMediaDevice;
  }

  MediaFileSystemMetadata.fromProxy(JsObject proxy): super.fromProxy(proxy);

  String get name => proxy['name'];
  set name(String value) => proxy['name'] = value;

  String get galleryId => proxy['galleryId'];
  set galleryId(String value) => proxy['galleryId'] = value;

  String get deviceId => proxy['deviceId'];
  set deviceId(String value) => proxy['deviceId'] = value;

  bool get isRemovable => proxy['isRemovable'];
  set isRemovable(bool value) => proxy['isRemovable'] = value;

  bool get isMediaDevice => proxy['isMediaDevice'];
  set isMediaDevice(bool value) => proxy['isMediaDevice'] = value;
}
