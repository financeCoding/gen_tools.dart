/* This file has been generated from socket.idl - do not edit */

library chrome.socket;

import '../src/common.dart';

/// Accessor for the `chrome.socket` namespace.
final ChromeSocket socket = new ChromeSocket._();

class ChromeSocket {
  static final JsObject _socket = context['chrome']['socket'];

  ChromeSocket._();

  /**
   * Creates a socket of the specified type that will connect to the specified
   *  remote machine.
   *  |type| : The type of socket to create. Must be <code>tcp</code> or
   *  <code>udp</code>.
   *  |options| : The socket options.
   *  |callback| : Called when the socket has been created.
   *  Destroys the socket. Each socket created should be destroyed after use.
   *  |socketId| : The socketId.
   */
  Future create(SocketType type, [CreateOptions options]) {
    ChromeCompleter completer = new ChromeCompleter.noArgs();
    _socket.callMethod('create', [type, options, completer.callback]);
    return completer.future;
  }

  /**
   * Connects the socket to the remote machine (for a <code>tcp</code>
   *  socket). For a <code>udp</code> socket, this sets the default address
   *  which packets are sent to and read from for <code>read()</code>
   *  and <code>write()</code> calls.
   *  |socketId| : The socketId.
   *  |hostname| : The hostname or IP address of the remote machine.
   *  |port| : The port of the remote machine.
   *  |callback| : Called when the connection attempt is complete.
   */
  void destroy(int socketId) {
    _socket.callMethod('destroy', [socketId]);
  }

  /**
   * Binds the local address for socket. Currently, it does not support
   *  TCP socket.
   *  |socketId| : The socketId.
   *  |address| : The address of the local machine.
   *  |port| : The port of the local machine.
   *  |callback| : Called when the bind attempt is complete.
   */
  Future connect(int socketId, String hostname, int port) {
    ChromeCompleter completer = new ChromeCompleter.noArgs();
    _socket.callMethod('connect', [socketId, hostname, port, completer.callback]);
    return completer.future;
  }

  /**
   * Disconnects the socket. For UDP sockets, <code>disconnect</code> is a
   *  non-operation but is safe to call.
   *  |socketId| : The socketId.
   */
  Future bind(int socketId, String address, int port) {
    ChromeCompleter completer = new ChromeCompleter.noArgs();
    _socket.callMethod('bind', [socketId, address, port, completer.callback]);
    return completer.future;
  }

  /**
   * Reads data from the given connected socket.
   *  |socketId| : The socketId.
   *  |bufferSize| : The read buffer size.
   *  |callback| : Delivers data that was available to be read without
   *  blocking.
   */
  void disconnect(int socketId) {
    _socket.callMethod('disconnect', [socketId]);
  }

  /**
   * Writes data on the given connected socket.
   *  |socketId| : The socketId.
   *  |data| : The data to write.
   *  |callback| : Called when the write operation completes without blocking
   *  or an error occurs.
   */
  Future read(int socketId, [int bufferSize]) {
    ChromeCompleter completer = new ChromeCompleter.noArgs();
    _socket.callMethod('read', [socketId, bufferSize, completer.callback]);
    return completer.future;
  }

  /**
   * Receives data from the given UDP socket.
   *  |socketId| : The socketId.
   *  |bufferSize| : The receive buffer size.
   *  |callback| : Returns result of the recvFrom operation.
   */
  Future write(int socketId, ArrayBuffer data) {
    ChromeCompleter completer = new ChromeCompleter.noArgs();
    _socket.callMethod('write', [socketId, data, completer.callback]);
    return completer.future;
  }

  /**
   * Sends data on the given UDP socket to the given address and port.
   *  |socketId| : The socketId.
   *  |data| : The data to write.
   *  |address| : The address of the remote machine.
   *  |port| : The port of the remote machine.
   *  |callback| : Called when the send operation completes without blocking
   *  or an error occurs.
   */
  Future recvFrom(int socketId, [int bufferSize]) {
    ChromeCompleter completer = new ChromeCompleter.noArgs();
    _socket.callMethod('recvFrom', [socketId, bufferSize, completer.callback]);
    return completer.future;
  }

  /**
   * This method applies to TCP sockets only.
   *  Listens for connections on the specified port and address. This
   *  effectively makes this a server socket, and client socket
   *  functions (connect, read, write) can no longer be used on this socket.
   *  |socketId| : The socketId.
   *  |address| : The address of the local machine.
   *  |port| : The port of the local machine.
   *  |backlog| : Length of the socket's listen queue.
   *  |callback| : Called when listen operation completes.
   */
  Future sendTo(int socketId, ArrayBuffer data, String address, int port) {
    ChromeCompleter completer = new ChromeCompleter.noArgs();
    _socket.callMethod('sendTo', [socketId, data, address, port, completer.callback]);
    return completer.future;
  }

  /**
   * This method applies to TCP sockets only.
   *  Registers a callback function to be called when a connection is
   *  accepted on this listening server socket. Listen must be called first.
   *  If there is already an active accept callback, this callback will be
   *  invoked immediately with an error as the resultCode.
   *  |socketId| : The socketId.
   *  |callback| : The callback is invoked when a new socket is accepted.
   */
  Future listen(int socketId, String address, int port, [int backlog]) {
    ChromeCompleter completer = new ChromeCompleter.noArgs();
    _socket.callMethod('listen', [socketId, address, port, backlog, completer.callback]);
    return completer.future;
  }

  /**
   * Enables or disables the keep-alive functionality for a TCP connection.
   *  |socketId| : The socketId.
   *  |enable| : If true, enable keep-alive functionality.
   *  |delay| : Set the delay seconds between the last data packet received
   *  and the first keepalive probe. Default is 0.
   *  |callback| : Called when the setKeepAlive attempt is complete.
   */
  Future accept(int socketId) {
    ChromeCompleter completer = new ChromeCompleter.noArgs();
    _socket.callMethod('accept', [socketId, completer.callback]);
    return completer.future;
  }

  /**
   * Sets or clears <code>TCP_NODELAY</code> for a TCP connection. Nagle's
   *  algorithm will be disabled when <code>TCP_NODELAY</code> is set.
   *  |socketId| : The socketId.
   *  |noDelay| : If true, disables Nagle's algorithm.
   *  |callback| : Called when the setNoDelay attempt is complete.
   */
  Future setKeepAlive(int socketId, bool enable, [int delay]) {
    ChromeCompleter completer = new ChromeCompleter.noArgs();
    _socket.callMethod('setKeepAlive', [socketId, enable, delay, completer.callback]);
    return completer.future;
  }

  /**
   * Retrieves the state of the given socket.
   *  |socketId| : The socketId.
   *  |callback| : Called when the state is available.
   */
  Future setNoDelay(int socketId, bool noDelay) {
    ChromeCompleter completer = new ChromeCompleter.noArgs();
    _socket.callMethod('setNoDelay', [socketId, noDelay, completer.callback]);
    return completer.future;
  }

  /**
   * Retrieves information about local adapters on this system.
   *  |callback| : Called when local adapter information is available.
   */
  Future getInfo(int socketId) {
    ChromeCompleter completer = new ChromeCompleter.noArgs();
    _socket.callMethod('getInfo', [socketId, completer.callback]);
    return completer.future;
  }

  /**
   * Join the multicast group and start to receive packets from that group.
   *  The socket must be of UDP type and must be bound to a local port
   *  before calling this method.
   *  |socketId| : The socketId.
   *  |address| : The group address to join. Domain names are not supported.
   *  |callback| : Called when the join group operation is done with an
   *  integer parameter indicating the platform-independent error code.
   */
  Future getNetworkList() {
    ChromeCompleter completer = new ChromeCompleter.noArgs();
    _socket.callMethod('getNetworkList', [completer.callback]);
    return completer.future;
  }

  /**
   * Leave the multicast group previously joined using <code>joinGroup</code>.
   *  It's not necessary to leave the multicast group before destroying the
   *  socket or exiting. This is automatically called by the OS.
   * 
   *  Leaving the group will prevent the router from sending multicast
   *  datagrams to the local host, presuming no other process on the host is
   *  still joined to the group.
   * 
   *  |socketId| : The socketId.
   *  |address| : The group address to leave. Domain names are not supported.
   *  |callback| : Called when the leave group operation is done with an
   *  integer parameter indicating the platform-independent error code.
   */
  Future joinGroup(int socketId, String address) {
    ChromeCompleter completer = new ChromeCompleter.noArgs();
    _socket.callMethod('joinGroup', [socketId, address, completer.callback]);
    return completer.future;
  }

  /**
   * Set the time-to-live of multicast packets sent to the multicast group.
   * 
   *  Calling this method does not require multicast permissions.
   * 
   *  |socketId| : The socketId.
   *  |ttl| : The time-to-live value.
   *  |callback| : Called when the configuration operation is done.
   */
  Future leaveGroup(int socketId, String address) {
    ChromeCompleter completer = new ChromeCompleter.noArgs();
    _socket.callMethod('leaveGroup', [socketId, address, completer.callback]);
    return completer.future;
  }

  /**
   * Set whether multicast packets sent from the host to the multicast
   *  group will be looped back to the host.
   * 
   *  Note: the behavior of <code>setMulticastLoopbackMode</code> is slightly
   *  different between Windows and Unix-like systems. The inconsistency
   *  happens only when there is more than one application on the same host
   *  joined to the same multicast group while having different settings on
   *  multicast loopback mode. On Windows, the applications with loopback off
   *  will not RECEIVE the loopback packets; while on Unix-like systems, the
   *  applications with loopback off will not SEND the loopback packets to
   *  other applications on the same host. See MSDN: http://goo.gl/6vqbj
   * 
   *  Calling this method does not require multicast permissions.
   * 
   *  |socketId| : The socketId.
   *  |enabled| : Indicate whether to enable loopback mode.
   *  |callback| : Called when the configuration operation is done.
   */
  Future setMulticastTimeToLive(int socketId, int ttl) {
    ChromeCompleter completer = new ChromeCompleter.noArgs();
    _socket.callMethod('setMulticastTimeToLive', [socketId, ttl, completer.callback]);
    return completer.future;
  }

  /**
   * Get the multicast group addresses the socket is currently joined to.
   *  |socketId| : The socketId.
   *  |callback| : Called with an array of strings of the result.
   */
  Future setMulticastLoopbackMode(int socketId, bool enabled) {
    ChromeCompleter completer = new ChromeCompleter.noArgs();
    _socket.callMethod('setMulticastLoopbackMode', [socketId, enabled, completer.callback]);
    return completer.future;
  }

  /**
   * 
   */
  Future getJoinedGroups(int socketId) {
    ChromeCompleter completer = new ChromeCompleter.noArgs();
    _socket.callMethod('getJoinedGroups', [socketId, completer.callback]);
    return completer.future;
  }
}

/**
 * Copyright (c) 2012 The Chromium Authors. All rights reserved.
 *  Use of this source code is governed by a BSD-style license that can be
 *  found in the LICENSE file.
 *  Use the <code>chrome.socket</code> API to send and receive data over the
 *  network using TCP and UDP connections.
 *  The socket options.
 */
class SocketType extends ChromeEnum {
  static const SocketType TCP = const SocketType._('tcp');
  static const SocketType UDP = const SocketType._('udp');

  static List<SocketType> _values = [TCP, UDP];

  static List<SocketType> get values => _values;

  static SocketType create(String str) =>
      _values.singleWhere((ChromeEnum e) => e.value == str);

  const SocketType._(String str): super(str);
}

/**
 * 
 */
class CreateOptions extends ChromeObject {
  static CreateOptions create(JsObject proxy) => proxy == null ? null : new CreateOptions.fromProxy(proxy);

  CreateOptions();

  CreateOptions.fromProxy(JsObject proxy): super.fromProxy(proxy);
}

/**
 * 
 */
class CreateInfo extends ChromeObject {
  static CreateInfo create(JsObject proxy) => proxy == null ? null : new CreateInfo.fromProxy(proxy);

  CreateInfo({int socketId}) {
    if (socketId != null) this.socketId = socketId;
  }

  CreateInfo.fromProxy(JsObject proxy): super.fromProxy(proxy);

  int get socketId => proxy['socketId'];
  set socketId(int value) => proxy['socketId'] = value;
}

/**
 * 
 */
class AcceptInfo extends ChromeObject {
  static AcceptInfo create(JsObject proxy) => proxy == null ? null : new AcceptInfo.fromProxy(proxy);

  AcceptInfo({int resultCode, int socketId}) {
    if (resultCode != null) this.resultCode = resultCode;
    if (socketId != null) this.socketId = socketId;
  }

  AcceptInfo.fromProxy(JsObject proxy): super.fromProxy(proxy);

  int get resultCode => proxy['resultCode'];
  set resultCode(int value) => proxy['resultCode'] = value;

  int get socketId => proxy['socketId'];
  set socketId(int value) => proxy['socketId'] = value;
}

/**
 * 
 */
class SocketReadInfo extends ChromeObject {
  static SocketReadInfo create(JsObject proxy) => proxy == null ? null : new SocketReadInfo.fromProxy(proxy);

  SocketReadInfo({int resultCode, ArrayBuffer data}) {
    if (resultCode != null) this.resultCode = resultCode;
    if (data != null) this.data = data;
  }

  SocketReadInfo.fromProxy(JsObject proxy): super.fromProxy(proxy);

  int get resultCode => proxy['resultCode'];
  set resultCode(int value) => proxy['resultCode'] = value;

  ArrayBuffer get data => ArrayBuffer.create(proxy['data']);
  set data(ArrayBuffer value) => proxy['data'] = value;
}

/**
 * 
 */
class SocketWriteInfo extends ChromeObject {
  static SocketWriteInfo create(JsObject proxy) => proxy == null ? null : new SocketWriteInfo.fromProxy(proxy);

  SocketWriteInfo({int bytesWritten}) {
    if (bytesWritten != null) this.bytesWritten = bytesWritten;
  }

  SocketWriteInfo.fromProxy(JsObject proxy): super.fromProxy(proxy);

  int get bytesWritten => proxy['bytesWritten'];
  set bytesWritten(int value) => proxy['bytesWritten'] = value;
}

/**
 * 
 */
class RecvFromInfo extends ChromeObject {
  static RecvFromInfo create(JsObject proxy) => proxy == null ? null : new RecvFromInfo.fromProxy(proxy);

  RecvFromInfo({int resultCode, ArrayBuffer data, String address, int port}) {
    if (resultCode != null) this.resultCode = resultCode;
    if (data != null) this.data = data;
    if (address != null) this.address = address;
    if (port != null) this.port = port;
  }

  RecvFromInfo.fromProxy(JsObject proxy): super.fromProxy(proxy);

  int get resultCode => proxy['resultCode'];
  set resultCode(int value) => proxy['resultCode'] = value;

  ArrayBuffer get data => ArrayBuffer.create(proxy['data']);
  set data(ArrayBuffer value) => proxy['data'] = value;

  String get address => proxy['address'];
  set address(String value) => proxy['address'] = value;

  int get port => proxy['port'];
  set port(int value) => proxy['port'] = value;
}

/**
 * 
 */
class SocketInfo extends ChromeObject {
  static SocketInfo create(JsObject proxy) => proxy == null ? null : new SocketInfo.fromProxy(proxy);

  SocketInfo({SocketType socketType, bool connected, String peerAddress, int peerPort, String localAddress, int localPort}) {
    if (socketType != null) this.socketType = socketType;
    if (connected != null) this.connected = connected;
    if (peerAddress != null) this.peerAddress = peerAddress;
    if (peerPort != null) this.peerPort = peerPort;
    if (localAddress != null) this.localAddress = localAddress;
    if (localPort != null) this.localPort = localPort;
  }

  SocketInfo.fromProxy(JsObject proxy): super.fromProxy(proxy);

  SocketType get socketType => SocketType.create(proxy['socketType']);
  set socketType(SocketType value) => proxy['socketType'] = value;

  bool get connected => proxy['connected'];
  set connected(bool value) => proxy['connected'] = value;

  String get peerAddress => proxy['peerAddress'];
  set peerAddress(String value) => proxy['peerAddress'] = value;

  int get peerPort => proxy['peerPort'];
  set peerPort(int value) => proxy['peerPort'] = value;

  String get localAddress => proxy['localAddress'];
  set localAddress(String value) => proxy['localAddress'] = value;

  int get localPort => proxy['localPort'];
  set localPort(int value) => proxy['localPort'] = value;
}

/**
 * 
 */
class NetworkInterface extends ChromeObject {
  static NetworkInterface create(JsObject proxy) => proxy == null ? null : new NetworkInterface.fromProxy(proxy);

  NetworkInterface({String name, String address}) {
    if (name != null) this.name = name;
    if (address != null) this.address = address;
  }

  NetworkInterface.fromProxy(JsObject proxy): super.fromProxy(proxy);

  String get name => proxy['name'];
  set name(String value) => proxy['name'] = value;

  String get address => proxy['address'];
  set address(String value) => proxy['address'] = value;
}
