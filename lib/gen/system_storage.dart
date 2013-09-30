/* This file has been generated from system_storage.idl - do not edit */

library chrome.system_storage;

import '../src/common.dart';

/// Accessor for the `chrome.system.storage` namespace.
final ChromeSystemStorage system_storage = new ChromeSystemStorage._();

class ChromeSystemStorage {
  static final JsObject _system_storage = context['chrome']['system']['storage'];

  ChromeSystemStorage._();

  /**
   * Get the storage information from the system. The argument passed to the
   *  callback is an array of StorageUnitInfo objects.
   *  Ejects a removable storage device.
   */
  Future getInfo() {
    ChromeCompleter completer = new ChromeCompleter.noArgs();
    _system_storage.callMethod('getInfo', [completer.callback]);
    return completer.future;
  }

  /**
   * 
   */
  Future ejectDevice(String id) {
    ChromeCompleter completer = new ChromeCompleter.noArgs();
    _system_storage.callMethod('ejectDevice', [id, completer.callback]);
    return completer.future;
  }

  /**
   * Fired when a new removable storage is attached to the system.
   *  Fired when a removable storage is detached from the system.
   */
  Stream<StorageUnitInfo> get onAttached => _onAttached.stream;

  final ChromeStreamController<StorageUnitInfo> _onAttached =
      new ChromeStreamController<StorageUnitInfo>.oneArg(_system_storage['onAttached'], StorageUnitInfo.create);

  /**
   * 
   */
  Stream<String> get onDetached => _onDetached.stream;

  final ChromeStreamController<String> _onDetached =
      new ChromeStreamController<String>.oneArg(_system_storage['onDetached'], selfConverter);
}

/**
 * Copyright 2013 The Chromium Authors. All rights reserved.
 *  Use of this source code is governed by a BSD-style license that can be
 *  found in the LICENSE file.
 *  Use the <code>chrome.system.storage</code> API to query storage device
 *  information and be notified when a removable storage device is attached and
 *  detached.
 *  The storage has fixed media, e.g. hard disk or SSD.
 *  The storage has fixed media, e.g. hard disk or SSD.
 *  The storage is removable, e.g. USB flash drive.
 *  The storage type is unknown.
 */
class StorageUnitType extends ChromeEnum {
  static const StorageUnitType FIXED = const StorageUnitType._('fixed');
  static const StorageUnitType REMOVABLE = const StorageUnitType._('removable');
  static const StorageUnitType UNKNOWN = const StorageUnitType._('unknown');

  static List<StorageUnitType> _values = [FIXED, REMOVABLE, UNKNOWN];

  static List<StorageUnitType> get values => _values;

  static StorageUnitType create(String str) =>
      _values.singleWhere((ChromeEnum e) => e.value == str);

  const StorageUnitType._(String str): super(str);
}

/**
 * The ejection command is successful -- the application can prompt the user
 *  to remove the device.
 *  The ejection command is successful -- the application can prompt the user
 *  to remove the device.
 *  The device is in use by another application. The ejection did not
 *  succeed; the user should not remove the device until the other
 *  application is done with the device.
 *  There is no such device known.
 *  The ejection command failed.
 */
class EjectDeviceResultCode extends ChromeEnum {
  static const EjectDeviceResultCode SUCCESS = const EjectDeviceResultCode._('success');
  static const EjectDeviceResultCode IN_USE = const EjectDeviceResultCode._('in_use');
  static const EjectDeviceResultCode NO_SUCH_DEVICE = const EjectDeviceResultCode._('no_such_device');
  static const EjectDeviceResultCode FAILURE = const EjectDeviceResultCode._('failure');

  static List<EjectDeviceResultCode> _values = [SUCCESS, IN_USE, NO_SUCH_DEVICE, FAILURE];

  static List<EjectDeviceResultCode> get values => _values;

  static EjectDeviceResultCode create(String str) =>
      _values.singleWhere((ChromeEnum e) => e.value == str);

  const EjectDeviceResultCode._(String str): super(str);
}

/**
 * 
 */
class StorageUnitInfo extends ChromeObject {
  static StorageUnitInfo create(JsObject proxy) => proxy == null ? null : new StorageUnitInfo.fromProxy(proxy);

  StorageUnitInfo({String id, String name, StorageUnitType type, double capacity}) {
    if (id != null) this.id = id;
    if (name != null) this.name = name;
    if (type != null) this.type = type;
    if (capacity != null) this.capacity = capacity;
  }

  StorageUnitInfo.fromProxy(JsObject proxy): super.fromProxy(proxy);

  String get id => proxy['id'];
  set id(String value) => proxy['id'] = value;

  String get name => proxy['name'];
  set name(String value) => proxy['name'] = value;

  StorageUnitType get type => StorageUnitType.create(proxy['type']);
  set type(StorageUnitType value) => proxy['type'] = value;

  double get capacity => proxy['capacity'];
  set capacity(double value) => proxy['capacity'] = value;
}
