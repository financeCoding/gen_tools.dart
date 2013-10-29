/* This file has been generated - do not edit */

library chrome.system;

import '../src/common.dart';

final ChromeSystem system = new ChromeSystem._();

class ChromeSystem {
  /// Accessor for the `chrome.system.cpu` namespace.
  final ChromeSystemCpu cpu = ChromeSystemCpu._system_cpu == null ? apiNotAvailable('chrome.system.cpu') : new ChromeSystemCpu._();

  /// Accessor for the `chrome.system.memory` namespace.
  final ChromeSystemMemory memory = ChromeSystemMemory._system_memory == null ? apiNotAvailable('chrome.system.memory') : new ChromeSystemMemory._();

  /// Accessor for the `chrome.system.storage` namespace.
  final ChromeSystemStorage storage = ChromeSystemStorage._system_storage == null ? apiNotAvailable('chrome.system.storage') : new ChromeSystemStorage._();

  ChromeSystem._();
}

class ChromeSystemCpu {
  static final JsObject _system_cpu = chrome['system']['cpu'];

  ChromeSystemCpu._();

  /**
   * Queries basic CPU information of the system.
   */
  Future<CpuInfo> getInfo() {
    var completer = new ChromeCompleter<CpuInfo>.oneArg(_createCpuInfo);
    _system_cpu.callMethod('getInfo', [completer.callback]);
    return completer.future;
  }
}

class CpuInfo extends ChromeObject {
  CpuInfo({int numOfProcessors, String archName, String modelName}) {
    if (numOfProcessors != null) this.numOfProcessors = numOfProcessors;
    if (archName != null) this.archName = archName;
    if (modelName != null) this.modelName = modelName;
  }
  CpuInfo.fromProxy(JsObject proxy): super.fromProxy(proxy);

  int get numOfProcessors => proxy['numOfProcessors'];
  set numOfProcessors(int value) => proxy['numOfProcessors'] = value;

  String get archName => proxy['archName'];
  set archName(String value) => proxy['archName'] = value;

  String get modelName => proxy['modelName'];
  set modelName(String value) => proxy['modelName'] = value;
}

CpuInfo _createCpuInfo(JsObject proxy) => proxy == null ? null : new CpuInfo.fromProxy(proxy);
class ChromeSystemMemory {
  static final JsObject _system_memory = chrome['system']['memory'];

  ChromeSystemMemory._();

  /**
   * Get physical memory information.
   */
  Future<MemoryInfo> getInfo() {
    var completer = new ChromeCompleter<MemoryInfo>.oneArg(_createMemoryInfo);
    _system_memory.callMethod('getInfo', [completer.callback]);
    return completer.future;
  }
}

class MemoryInfo extends ChromeObject {
  MemoryInfo({double capacity, double availableCapacity}) {
    if (capacity != null) this.capacity = capacity;
    if (availableCapacity != null) this.availableCapacity = availableCapacity;
  }
  MemoryInfo.fromProxy(JsObject proxy): super.fromProxy(proxy);

  double get capacity => proxy['capacity'];
  set capacity(double value) => proxy['capacity'] = jsify(value);

  double get availableCapacity => proxy['availableCapacity'];
  set availableCapacity(double value) => proxy['availableCapacity'] = jsify(value);
}

MemoryInfo _createMemoryInfo(JsObject proxy) => proxy == null ? null : new MemoryInfo.fromProxy(proxy);
class ChromeSystemStorage {
  static final JsObject _system_storage = chrome['system']['storage'];

  ChromeSystemStorage._();

  /**
   * Get the storage information from the system. The argument passed to the
   * callback is an array of StorageUnitInfo objects.
   */
  Future<StorageUnitInfo> getInfo() {
    var completer = new ChromeCompleter<StorageUnitInfo>.oneArg(_createStorageUnitInfo);
    _system_storage.callMethod('getInfo', [completer.callback]);
    return completer.future;
  }

  /**
   * Ejects a removable storage device.
   */
  Future<EjectDeviceResultCode> ejectDevice(String id) {
    var completer = new ChromeCompleter<EjectDeviceResultCode>.oneArg(_createEjectDeviceResultCode);
    _system_storage.callMethod('ejectDevice', [id, completer.callback]);
    return completer.future;
  }

  /**
   * Get the available capacity of a specified [id] storage device. The [id] is
   * the transient device ID from StorageUnitInfo.
   */
  Future<StorageAvailableCapacityInfo> getAvailableCapacity(String id) {
    var completer = new ChromeCompleter<StorageAvailableCapacityInfo>.oneArg(_createStorageAvailableCapacityInfo);
    _system_storage.callMethod('getAvailableCapacity', [id, completer.callback]);
    return completer.future;
  }

  Stream<StorageUnitInfo> get onAttached => _onAttached.stream;

  final ChromeStreamController<StorageUnitInfo> _onAttached =
      new ChromeStreamController<StorageUnitInfo>.oneArg(_system_storage['onAttached'], _createStorageUnitInfo);

  Stream<String> get onDetached => _onDetached.stream;

  final ChromeStreamController<String> _onDetached =
      new ChromeStreamController<String>.oneArg(_system_storage['onDetached'], selfConverter);
}

/**
 * Copyright 2013 The Chromium Authors. All rights reserved. Use of this source
 * code is governed by a BSD-style license that can be found in the LICENSE
 * file. Use the `chrome.system.storage` API to query storage device information
 * and be notified when a removable storage device is attached and detached. The
 * storage has fixed media, e.g. hard disk or SSD. The storage is removable,
 * e.g. USB flash drive. The storage type is unknown.
 */
class StorageUnitType extends ChromeEnum {
  static const StorageUnitType FIXED = const StorageUnitType._('fixed');
  static const StorageUnitType REMOVABLE = const StorageUnitType._('removable');
  static const StorageUnitType UNKNOWN = const StorageUnitType._('unknown');

  static const List<StorageUnitType> VALUES = const[FIXED, REMOVABLE, UNKNOWN];

  const StorageUnitType._(String str): super(str);
}

/**
 * The ejection command is successful -- the application can prompt the user to
 * remove the device. The device is in use by another application. The ejection
 * did not succeed; the user should not remove the device until the other
 * application is done with the device. There is no such device known. The
 * ejection command failed.
 */
class EjectDeviceResultCode extends ChromeEnum {
  static const EjectDeviceResultCode SUCCESS = const EjectDeviceResultCode._('success');
  static const EjectDeviceResultCode IN_USE = const EjectDeviceResultCode._('in_use');
  static const EjectDeviceResultCode NO_SUCH_DEVICE = const EjectDeviceResultCode._('no_such_device');
  static const EjectDeviceResultCode FAILURE = const EjectDeviceResultCode._('failure');

  static const List<EjectDeviceResultCode> VALUES = const[SUCCESS, IN_USE, NO_SUCH_DEVICE, FAILURE];

  const EjectDeviceResultCode._(String str): super(str);
}

class StorageUnitInfo extends ChromeObject {
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

  StorageUnitType get type => _createStorageUnitType(proxy['type']);
  set type(StorageUnitType value) => proxy['type'] = jsify(value);

  double get capacity => proxy['capacity'];
  set capacity(double value) => proxy['capacity'] = jsify(value);
}

class StorageAvailableCapacityInfo extends ChromeObject {
  StorageAvailableCapacityInfo({String id, double availableCapacity}) {
    if (id != null) this.id = id;
    if (availableCapacity != null) this.availableCapacity = availableCapacity;
  }
  StorageAvailableCapacityInfo.fromProxy(JsObject proxy): super.fromProxy(proxy);

  String get id => proxy['id'];
  set id(String value) => proxy['id'] = value;

  double get availableCapacity => proxy['availableCapacity'];
  set availableCapacity(double value) => proxy['availableCapacity'] = jsify(value);
}

StorageUnitInfo _createStorageUnitInfo(JsObject proxy) => proxy == null ? null : new StorageUnitInfo.fromProxy(proxy);
EjectDeviceResultCode _createEjectDeviceResultCode(String value) => EjectDeviceResultCode.VALUES.singleWhere((ChromeEnum e) => e.value == value);
StorageAvailableCapacityInfo _createStorageAvailableCapacityInfo(JsObject proxy) => proxy == null ? null : new StorageAvailableCapacityInfo.fromProxy(proxy);
StorageUnitType _createStorageUnitType(String value) => StorageUnitType.VALUES.singleWhere((ChromeEnum e) => e.value == value);
