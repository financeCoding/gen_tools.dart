/* This file has been generated from notifications.idl - do not edit */

library chrome.notifications;

import '../src/common.dart';

/**
 * Accessor for the `chrome.notifications` namespace.
 */
final ChromeNotifications notifications = new ChromeNotifications._();

class ChromeNotifications extends ChromeApi {
  static final JsObject _notifications = chrome['notifications'];

  ChromeNotifications._();

  bool get available => _notifications != null;

  /**
   * Creates and displays a notification.
   * [notificationId]: Identifier of the notification. If it is empty, this
   * method generates an id. If it matches an existing notification, this method
   * first clears that notification before proceeding with the create operation.
   * [options]: Contents of the notification.
   * [callback]: Returns the notification id (either supplied or generated) that
   * represents the created notification.
   */
  Future<String> create(String notificationId, NotificationOptions options) {
    if (_notifications == null) _throwNotAvailable();

    var completer = new ChromeCompleter<String>.oneArg();
    _notifications.callMethod('create', [notificationId, jsify(options), completer.callback]);
    return completer.future;
  }

  /**
   * Updates an existing notification.
   * [notificationId]: The id of the notification to be updated. This is
   * returned by [notifications.create] method.
   * [options]: Contents of the notification to update to.
   * [callback]: Called to indicate whether a matching notification existed.
   */
  Future<bool> update(String notificationId, NotificationOptions options) {
    if (_notifications == null) _throwNotAvailable();

    var completer = new ChromeCompleter<bool>.oneArg();
    _notifications.callMethod('update', [notificationId, jsify(options), completer.callback]);
    return completer.future;
  }

  /**
   * Clears the specified notification.
   * [notificationId]: The id of the notification to be cleared. This is
   * returned by [notifications.create] method.
   * [callback]: Called to indicate whether a matching notification existed.
   */
  Future<bool> clear(String notificationId) {
    if (_notifications == null) _throwNotAvailable();

    var completer = new ChromeCompleter<bool>.oneArg();
    _notifications.callMethod('clear', [notificationId, completer.callback]);
    return completer.future;
  }

  /**
   * Retrieves all the notifications.
   * [callback]: Returns the set of notification_ids currently in the system.
   */
  Future<dynamic> getAll() {
    if (_notifications == null) _throwNotAvailable();

    var completer = new ChromeCompleter<dynamic>.oneArg();
    _notifications.callMethod('getAll', [completer.callback]);
    return completer.future;
  }

  /**
   * Retrieves whether the user has enabled notifications from this app or
   * extension.
   * [callback]: Returns the current permission level.
   */
  Future<PermissionLevel> getPermissionLevel() {
    if (_notifications == null) _throwNotAvailable();

    var completer = new ChromeCompleter<PermissionLevel>.oneArg(_createPermissionLevel);
    _notifications.callMethod('getPermissionLevel', [completer.callback]);
    return completer.future;
  }

  Stream<OnClosedEvent> get onClosed => _onClosed.stream;

  final ChromeStreamController<OnClosedEvent> _onClosed =
      new ChromeStreamController<OnClosedEvent>.twoArgs(_notifications, 'onClosed', _createOnClosedEvent);

  Stream<String> get onClicked => _onClicked.stream;

  final ChromeStreamController<String> _onClicked =
      new ChromeStreamController<String>.oneArg(_notifications, 'onClicked', selfConverter);

  Stream<OnButtonClickedEvent> get onButtonClicked => _onButtonClicked.stream;

  final ChromeStreamController<OnButtonClickedEvent> _onButtonClicked =
      new ChromeStreamController<OnButtonClickedEvent>.twoArgs(_notifications, 'onButtonClicked', _createOnButtonClickedEvent);

  Stream<PermissionLevel> get onPermissionLevelChanged => _onPermissionLevelChanged.stream;

  final ChromeStreamController<PermissionLevel> _onPermissionLevelChanged =
      new ChromeStreamController<PermissionLevel>.oneArg(_notifications, 'onPermissionLevelChanged', _createPermissionLevel);

  void _throwNotAvailable() {
    throw new UnsupportedError("'chrome.notifications' is not available");
  }
}

class OnClosedEvent {
  final String notificationId;
  final bool byUser;

  OnClosedEvent(this.notificationId, this.byUser);
}

class OnButtonClickedEvent {
  final String notificationId;
  final int buttonIndex;

  OnButtonClickedEvent(this.notificationId, this.buttonIndex);
}

/**
 * Copyright (c) 2013 The Chromium Authors. All rights reserved. Use of this
 * source code is governed by a BSD-style license that can be found in the
 * LICENSE file. Use the `chrome.notifications` API to create rich notifications
 * using templates and show these notifications to users in the system tray.
 * icon, title, message, expandedMessage, up to two buttons icon, title,
 * message, expandedMessage, image, up to two buttons icon, title, message,
 * items, up to two buttons icon, title, message, progress, up to two buttons
 */
class TemplateType extends ChromeEnum {
  static const TemplateType BASIC = const TemplateType._('basic');
  static const TemplateType IMAGE = const TemplateType._('image');
  static const TemplateType LIST = const TemplateType._('list');
  static const TemplateType PROGRESS = const TemplateType._('progress');

  static const List<TemplateType> VALUES = const[BASIC, IMAGE, LIST, PROGRESS];

  const TemplateType._(String str): super(str);
}

/**
 * User has elected to show notifications from the app or extension. This is the
 * default at install time. User has elected not to show notifications from the
 * app or extension.
 */
class PermissionLevel extends ChromeEnum {
  static const PermissionLevel GRANTED = const PermissionLevel._('granted');
  static const PermissionLevel DENIED = const PermissionLevel._('denied');

  static const List<PermissionLevel> VALUES = const[GRANTED, DENIED];

  const PermissionLevel._(String str): super(str);
}

class NotificationItem extends ChromeObject {
  NotificationItem({String title, String message}) {
    if (title != null) this.title = title;
    if (message != null) this.message = message;
  }
  NotificationItem.fromProxy(JsObject proxy): super.fromProxy(proxy);

  String get title => proxy['title'];
  set title(String value) => proxy['title'] = value;

  String get message => proxy['message'];
  set message(String value) => proxy['message'] = value;
}

class NotificationBitmap extends ChromeObject {
  NotificationBitmap({int width, int height, ArrayBuffer data}) {
    if (width != null) this.width = width;
    if (height != null) this.height = height;
    if (data != null) this.data = data;
  }
  NotificationBitmap.fromProxy(JsObject proxy): super.fromProxy(proxy);

  int get width => proxy['width'];
  set width(int value) => proxy['width'] = value;

  int get height => proxy['height'];
  set height(int value) => proxy['height'] = value;

  ArrayBuffer get data => _createArrayBuffer(proxy['data']);
  set data(ArrayBuffer value) => proxy['data'] = jsify(value);
}

class NotificationButton extends ChromeObject {
  NotificationButton({String title, String iconUrl, NotificationBitmap iconBitmap}) {
    if (title != null) this.title = title;
    if (iconUrl != null) this.iconUrl = iconUrl;
    if (iconBitmap != null) this.iconBitmap = iconBitmap;
  }
  NotificationButton.fromProxy(JsObject proxy): super.fromProxy(proxy);

  String get title => proxy['title'];
  set title(String value) => proxy['title'] = value;

  String get iconUrl => proxy['iconUrl'];
  set iconUrl(String value) => proxy['iconUrl'] = value;

  NotificationBitmap get iconBitmap => _createNotificationBitmap(proxy['iconBitmap']);
  set iconBitmap(NotificationBitmap value) => proxy['iconBitmap'] = jsify(value);
}

class NotificationOptions extends ChromeObject {
  NotificationOptions({TemplateType type, String iconUrl, NotificationBitmap iconBitmap, String title, String message, String contextMessage, int priority, double eventTime, NotificationButton buttons, String expandedMessage, String imageUrl, NotificationBitmap imageBitmap, NotificationItem items, int progress, bool isClickable}) {
    if (type != null) this.type = type;
    if (iconUrl != null) this.iconUrl = iconUrl;
    if (iconBitmap != null) this.iconBitmap = iconBitmap;
    if (title != null) this.title = title;
    if (message != null) this.message = message;
    if (contextMessage != null) this.contextMessage = contextMessage;
    if (priority != null) this.priority = priority;
    if (eventTime != null) this.eventTime = eventTime;
    if (buttons != null) this.buttons = buttons;
    if (expandedMessage != null) this.expandedMessage = expandedMessage;
    if (imageUrl != null) this.imageUrl = imageUrl;
    if (imageBitmap != null) this.imageBitmap = imageBitmap;
    if (items != null) this.items = items;
    if (progress != null) this.progress = progress;
    if (isClickable != null) this.isClickable = isClickable;
  }
  NotificationOptions.fromProxy(JsObject proxy): super.fromProxy(proxy);

  TemplateType get type => _createTemplateType(proxy['type']);
  set type(TemplateType value) => proxy['type'] = jsify(value);

  String get iconUrl => proxy['iconUrl'];
  set iconUrl(String value) => proxy['iconUrl'] = value;

  NotificationBitmap get iconBitmap => _createNotificationBitmap(proxy['iconBitmap']);
  set iconBitmap(NotificationBitmap value) => proxy['iconBitmap'] = jsify(value);

  String get title => proxy['title'];
  set title(String value) => proxy['title'] = value;

  String get message => proxy['message'];
  set message(String value) => proxy['message'] = value;

  String get contextMessage => proxy['contextMessage'];
  set contextMessage(String value) => proxy['contextMessage'] = value;

  int get priority => proxy['priority'];
  set priority(int value) => proxy['priority'] = value;

  double get eventTime => proxy['eventTime'];
  set eventTime(double value) => proxy['eventTime'] = jsify(value);

  NotificationButton get buttons => _createNotificationButton(proxy['buttons']);
  set buttons(NotificationButton value) => proxy['buttons'] = jsify(value);

  String get expandedMessage => proxy['expandedMessage'];
  set expandedMessage(String value) => proxy['expandedMessage'] = value;

  String get imageUrl => proxy['imageUrl'];
  set imageUrl(String value) => proxy['imageUrl'] = value;

  NotificationBitmap get imageBitmap => _createNotificationBitmap(proxy['imageBitmap']);
  set imageBitmap(NotificationBitmap value) => proxy['imageBitmap'] = jsify(value);

  NotificationItem get items => _createNotificationItem(proxy['items']);
  set items(NotificationItem value) => proxy['items'] = jsify(value);

  int get progress => proxy['progress'];
  set progress(int value) => proxy['progress'] = value;

  bool get isClickable => proxy['isClickable'];
  set isClickable(bool value) => proxy['isClickable'] = value;
}

PermissionLevel _createPermissionLevel(String value) => PermissionLevel.VALUES.singleWhere((ChromeEnum e) => e.value == value);
OnClosedEvent _createOnClosedEvent(String notificationId, bool byUser) =>
    new OnClosedEvent(notificationId, byUser);
OnButtonClickedEvent _createOnButtonClickedEvent(String notificationId, int buttonIndex) =>
    new OnButtonClickedEvent(notificationId, buttonIndex);
ArrayBuffer _createArrayBuffer(JsObject proxy) => proxy == null ? null : new ArrayBuffer.fromProxy(proxy);
NotificationBitmap _createNotificationBitmap(JsObject proxy) => proxy == null ? null : new NotificationBitmap.fromProxy(proxy);
TemplateType _createTemplateType(String value) => TemplateType.VALUES.singleWhere((ChromeEnum e) => e.value == value);
NotificationButton _createNotificationButton(JsObject proxy) => proxy == null ? null : new NotificationButton.fromProxy(proxy);
NotificationItem _createNotificationItem(JsObject proxy) => proxy == null ? null : new NotificationItem.fromProxy(proxy);
