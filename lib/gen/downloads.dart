/* This file has been generated from downloads.idl - do not edit */

library chrome.downloads;

import '../src/common.dart';

/// Accessor for the `chrome.downloads` namespace.
final ChromeDownloads downloads = new ChromeDownloads._();

class ChromeDownloads {
  static final JsObject _downloads = context['chrome']['downloads'];

  ChromeDownloads._();

  /**
   * Download a URL. If the URL uses the HTTP[S] protocol, then the request
   *  will include all cookies currently set for its hostname. If both
   *  <code>filename</code> and <code>saveAs</code> are specified, then the
   *  Save As dialog will be displayed, pre-populated with the specified
   *  <code>filename</code>. If the download started successfully,
   *  <code>callback</code> will be called with the new $ref:DownloadItem's
   *  <code>downloadId</code>. If there was an error starting the download,
   *  then <code>callback</code> will be called with
   *  <code>downloadId=undefined</code> and $ref:runtime.lastError will contain
   *  a descriptive string. The error strings are not guaranteed to remain
   *  backwards compatible between releases. Extensions must not parse it.
   *  |options|: What to download and how.
   *  |callback|: Called with the id of the new $ref:DownloadItem.
   *  Find $ref:DownloadItem. Set <code>query</code> to the empty object to get
   *  all $ref:DownloadItem. To get a specific $ref:DownloadItem, set only the
   *  <code>id</code> field. To page through a large number of items, set
   *  <code>orderBy: ['-startTime']</code>, set <code>limit</code> to the
   *  number of items per page, and set <code>startedAfter</code> to the
   *  <code>startTime</code> of the last item from the last page.
   */
  Future download(DownloadOptions options) {
    ChromeCompleter completer = new ChromeCompleter.noArgs();
    _downloads.callMethod('download', [options, completer.callback]);
    return completer.future;
  }

  /**
   * Pause the download. If the request was successful the download is in a
   *  paused state. Otherwise $ref:runtime.lastError contains an error message.
   *  The request will fail if the download is not active.
   *  |downloadId|: The id of the download to pause.
   *  |callback|: Called when the pause request is completed.
   */
  Future search(DownloadQuery query) {
    ChromeCompleter completer = new ChromeCompleter.noArgs();
    _downloads.callMethod('search', [query, completer.callback]);
    return completer.future;
  }

  /**
   * Resume a paused download. If the request was successful the download is
   *  in progress and unpaused. Otherwise $ref:runtime.lastError contains an
   *  error message. The request will fail if the download is not active.
   *  |downloadId|: The id of the download to resume.
   *  |callback|: Called when the resume request is completed.
   */
  Future pause(int downloadId) {
    ChromeCompleter completer = new ChromeCompleter.noArgs();
    _downloads.callMethod('pause', [downloadId, completer.callback]);
    return completer.future;
  }

  /**
   * Cancel a download. When <code>callback</code> is run, the download is
   *  cancelled, completed, interrupted or doesn't exist anymore.
   *  |downloadId|: The id of the download to cancel.
   *  |callback|: Called when the cancel request is completed.
   */
  Future resume(int downloadId) {
    ChromeCompleter completer = new ChromeCompleter.noArgs();
    _downloads.callMethod('resume', [downloadId, completer.callback]);
    return completer.future;
  }

  /**
   * Retrieve an icon for the specified download. For new downloads, file
   *  icons are available after the $ref:onCreated event has been received. The
   *  image returned by this function while a download is in progress may be
   *  different from the image returned after the download is complete. Icon
   *  retrieval is done by querying the underlying operating system or toolkit
   *  depending on the platform. The icon that is returned will therefore
   *  depend on a number of factors including state of the download, platform,
   *  registered file types and visual theme. If a file icon cannot be
   *  determined, $ref:runtime.lastError will contain an error message.
   *  |downloadId|: The identifier for the download.
   *  |callback|: A URL to an image that represents the download.
   */
  Future cancel(int downloadId) {
    ChromeCompleter completer = new ChromeCompleter.noArgs();
    _downloads.callMethod('cancel', [downloadId, completer.callback]);
    return completer.future;
  }

  /**
   * Open the downloaded file now if the $ref:DownloadItem is complete;
   *  otherwise returns an error through $ref:runtime.lastError. Requires the
   *  <code>"downloads.open"</code> permission in addition to the
   *  <code>"downloads"</code> permission. An $ref:onChanged event will fire
   *  when the item is opened for the first time.
   *  |downloadId|: The identifier for the downloaded file.
   */
  Future getFileIcon(int downloadId, [GetFileIconOptions options]) {
    ChromeCompleter completer = new ChromeCompleter.noArgs();
    _downloads.callMethod('getFileIcon', [downloadId, options, completer.callback]);
    return completer.future;
  }

  /**
   * Show the downloaded file in its folder in a file manager.
   *  |downloadId|: The identifier for the downloaded file.
   */
  void open(int downloadId) {
    _downloads.callMethod('open', [downloadId]);
  }

  /**
   * Show the default Downloads folder in a file manager.
   */
  void show(int downloadId) {
    _downloads.callMethod('show', [downloadId]);
  }

  /**
   * Erase matching $ref:DownloadItem from history without deleting the
   *  downloaded file. An $ref:onErased event will fire for each
   *  $ref:DownloadItem that matches <code>query</code>, then
   *  <code>callback</code> will be called.
   */
  void showDefaultFolder() {
    _downloads.callMethod('showDefaultFolder');
  }

  /**
   * Remove the downloaded file if it exists and the $ref:DownloadItem is
   *  complete; otherwise return an error through $ref:runtime.lastError.
   */
  Future erase(DownloadQuery query) {
    ChromeCompleter completer = new ChromeCompleter.noArgs();
    _downloads.callMethod('erase', [query, completer.callback]);
    return completer.future;
  }

  /**
   * Prompt the user to accept a dangerous download. Does not automatically
   *  accept dangerous downloads. If the download is accepted, then an
   *  $ref:onChanged event will fire, otherwise nothing will happen.  When all
   *  the data is fetched into a temporary file and either the download is not
   *  dangerous or the danger has been accepted, then the temporary file is
   *  renamed to the target filename, the |state| changes to 'complete', and
   *  $ref:onChanged fires.
   *  |downloadId|: The identifier for the $ref:DownloadItem.
   *  |callback|: Called when the danger prompt dialog closes.
   */
  Future removeFile(int downloadId) {
    ChromeCompleter completer = new ChromeCompleter.noArgs();
    _downloads.callMethod('removeFile', [downloadId, completer.callback]);
    return completer.future;
  }

  /**
   * Initiate dragging the downloaded file to another application. Call in a
   *  javascript <code>ondragstart</code> handler.
   */
  Future acceptDanger(int downloadId) {
    ChromeCompleter completer = new ChromeCompleter.noArgs();
    _downloads.callMethod('acceptDanger', [downloadId, completer.callback]);
    return completer.future;
  }

  /**
   * Enable or disable the gray shelf at the bottom of every window associated
   *  with the current browser profile. The shelf will be disabled as long as
   *  at least one extension has disabled it. Enabling the shelf while at least
   *  one other extension has disabled it will return an error through
   *  $ref:runtime.lastError. Requires the <code>"downloads.shelf"</code>
   *  permission in addition to the <code>"downloads"</code> permission.
   */
  void drag(int downloadId) {
    _downloads.callMethod('drag', [downloadId]);
  }

  /**
   * 
   */
  void setShelfEnabled(bool enabled) {
    _downloads.callMethod('setShelfEnabled', [enabled]);
  }

  /**
   * This event fires with the $ref:DownloadItem object when a download
   *  begins.
   *  Fires with the <code>downloadId</code> when a download is erased from
   *  history.
   *  |downloadId|: The <code>id</code> of the $ref:DownloadItem that was
   *  erased.
   */
  Stream<DownloadItem> get onCreated => _onCreated.stream;

  final ChromeStreamController<DownloadItem> _onCreated =
      new ChromeStreamController<DownloadItem>.oneArg(_downloads['onCreated'], DownloadItem.create);

  /**
   * When any of a $ref:DownloadItem's properties except
   *  <code>bytesReceived</code> and <code>estimatedEndTime</code> changes,
   *  this event fires with the <code>downloadId</code> and an object
   *  containing the properties that changed.
   */
  Stream<int> get onErased => _onErased.stream;

  final ChromeStreamController<int> _onErased =
      new ChromeStreamController<int>.oneArg(_downloads['onErased'], selfConverter);

  /**
   * During the filename determination process, extensions will be given the
   *  opportunity to override the target $ref:DownloadItem.filename. Each
   *  extension may not register more than one listener for this event. Each
   *  listener must call <code>suggest</code> exactly once, either
   *  synchronously or asynchronously. If the listener calls
   *  <code>suggest</code> asynchronously, then it must return
   *  <code>true</code>. If the listener neither calls <code>suggest</code>
   *  synchronously nor returns <code>true</code>, then <code>suggest</code>
   *  will be called automatically. The $ref:DownloadItem will not complete
   *  until all listeners have called <code>suggest</code>. Listeners may call
   *  <code>suggest</code> without any arguments in order to allow the download
   *  to use <code>downloadItem.filename</code> for its filename, or pass a
   *  <code>suggestion</code> object to <code>suggest</code> in order to
   *  override the target filename. If more than one extension overrides the
   *  filename, then the last extension installed whose listener passes a
   *  <code>suggestion</code> object to <code>suggest</code> wins. In order to
   *  avoid confusion regarding which extension will win, users should not
   *  install extensions that may conflict. If the download is initiated by
   *  $ref:download and the target filename is known before the MIME type and
   *  tentative filename have been determined, pass <code>filename</code> to
   *  $ref:download instead.
   */
  Stream<DownloadDelta> get onChanged => _onChanged.stream;

  final ChromeStreamController<DownloadDelta> _onChanged =
      new ChromeStreamController<DownloadDelta>.oneArg(_downloads['onChanged'], DownloadDelta.create);

  /**
   * 
   */
  Stream<OnDeterminingFilenameEvent> get onDeterminingFilename => _onDeterminingFilename.stream;

  final ChromeStreamController<OnDeterminingFilenameEvent> _onDeterminingFilename =
      new ChromeStreamController<OnDeterminingFilenameEvent>.twoArgs(_downloads['onDeterminingFilename'], OnDeterminingFilenameEvent.create);
}

/**
 * 
 */
class OnDeterminingFilenameEvent {
  static OnDeterminingFilenameEvent create(JsObject downloadItem, JsObject suggest) =>
      new OnDeterminingFilenameEvent(DownloadItem.create(downloadItem), SuggestFilenameCallback.create(suggest));

  DownloadItem downloadItem;

  SuggestFilenameCallback suggest;

  OnDeterminingFilenameEvent(this.downloadItem, this.suggest);
}

/**
 * 
 */
class FilenameConflictAction extends ChromeEnum {
  static const FilenameConflictAction UNIQUIFY = const FilenameConflictAction._('uniquify');
  static const FilenameConflictAction OVERWRITE = const FilenameConflictAction._('overwrite');
  static const FilenameConflictAction PROMPT = const FilenameConflictAction._('prompt');

  static List<FilenameConflictAction> _values = [UNIQUIFY, OVERWRITE, PROMPT];

  static List<FilenameConflictAction> get values => _values;

  static FilenameConflictAction create(String str) =>
      _values.singleWhere((ChromeEnum e) => e.value == str);

  const FilenameConflictAction._(String str): super(str);
}

/**
 * 
 */
class HttpMethod extends ChromeEnum {
  static const HttpMethod GET = const HttpMethod._('GET');
  static const HttpMethod POST = const HttpMethod._('POST');

  static List<HttpMethod> _values = [GET, POST];

  static List<HttpMethod> get values => _values;

  static HttpMethod create(String str) =>
      _values.singleWhere((ChromeEnum e) => e.value == str);

  const HttpMethod._(String str): super(str);
}

/**
 * 
 */
class InterruptReason extends ChromeEnum {
  static const InterruptReason FILE_FAILED = const InterruptReason._('FILE_FAILED');
  static const InterruptReason FILE_ACCESS_DENIED = const InterruptReason._('FILE_ACCESS_DENIED');
  static const InterruptReason FILE_NO_SPACE = const InterruptReason._('FILE_NO_SPACE');
  static const InterruptReason FILE_NAME_TOO_LONG = const InterruptReason._('FILE_NAME_TOO_LONG');
  static const InterruptReason FILE_TOO_LARGE = const InterruptReason._('FILE_TOO_LARGE');
  static const InterruptReason FILE_VIRUS_INFECTED = const InterruptReason._('FILE_VIRUS_INFECTED');
  static const InterruptReason FILE_TRANSIENT_ERROR = const InterruptReason._('FILE_TRANSIENT_ERROR');
  static const InterruptReason FILE_BLOCKED = const InterruptReason._('FILE_BLOCKED');
  static const InterruptReason FILE_SECURITY_CHECK_FAILED = const InterruptReason._('FILE_SECURITY_CHECK_FAILED');
  static const InterruptReason FILE_TOO_SHORT = const InterruptReason._('FILE_TOO_SHORT');
  static const InterruptReason NETWORK_FAILED = const InterruptReason._('NETWORK_FAILED');
  static const InterruptReason NETWORK_TIMEOUT = const InterruptReason._('NETWORK_TIMEOUT');
  static const InterruptReason NETWORK_DISCONNECTED = const InterruptReason._('NETWORK_DISCONNECTED');
  static const InterruptReason NETWORK_SERVER_DOWN = const InterruptReason._('NETWORK_SERVER_DOWN');
  static const InterruptReason SERVER_FAILED = const InterruptReason._('SERVER_FAILED');
  static const InterruptReason SERVER_NO_RANGE = const InterruptReason._('SERVER_NO_RANGE');
  static const InterruptReason SERVER_PRECONDITION = const InterruptReason._('SERVER_PRECONDITION');
  static const InterruptReason SERVER_BAD_CONTENT = const InterruptReason._('SERVER_BAD_CONTENT');
  static const InterruptReason USER_CANCELED = const InterruptReason._('USER_CANCELED');
  static const InterruptReason USER_SHUTDOWN = const InterruptReason._('USER_SHUTDOWN');
  static const InterruptReason CRASH = const InterruptReason._('CRASH');

  static List<InterruptReason> _values = [FILE_FAILED, FILE_ACCESS_DENIED, FILE_NO_SPACE, FILE_NAME_TOO_LONG, FILE_TOO_LARGE, FILE_VIRUS_INFECTED, FILE_TRANSIENT_ERROR, FILE_BLOCKED, FILE_SECURITY_CHECK_FAILED, FILE_TOO_SHORT, NETWORK_FAILED, NETWORK_TIMEOUT, NETWORK_DISCONNECTED, NETWORK_SERVER_DOWN, SERVER_FAILED, SERVER_NO_RANGE, SERVER_PRECONDITION, SERVER_BAD_CONTENT, USER_CANCELED, USER_SHUTDOWN, CRASH];

  static List<InterruptReason> get values => _values;

  static InterruptReason create(String str) =>
      _values.singleWhere((ChromeEnum e) => e.value == str);

  const InterruptReason._(String str): super(str);
}

/**
 * <dl><dt>in_progress</dt>
 *      <dd>The download is currently receiving data from the server.</dd>
 *      <dt>interrupted</dt>
 *      <dd>An error broke the connection with the file host.</dd>
 *      <dt>complete</dt>
 *      <dd>The download completed successfully.</dd>
 *  </dl>
 */
class DangerType extends ChromeEnum {
  static const DangerType FILE = const DangerType._('file');
  static const DangerType URL = const DangerType._('url');
  static const DangerType CONTENT = const DangerType._('content');
  static const DangerType UNCOMMON = const DangerType._('uncommon');
  static const DangerType HOST = const DangerType._('host');
  static const DangerType UNWANTED = const DangerType._('unwanted');
  static const DangerType SAFE = const DangerType._('safe');
  static const DangerType ACCEPTED = const DangerType._('accepted');

  static List<DangerType> _values = [FILE, URL, CONTENT, UNCOMMON, HOST, UNWANTED, SAFE, ACCEPTED];

  static List<DangerType> get values => _values;

  static DangerType create(String str) =>
      _values.singleWhere((ChromeEnum e) => e.value == str);

  const DangerType._(String str): super(str);
}

/**
 * The state of the process of downloading a file.
 */
class State extends ChromeEnum {
  static const State IN_PROGRESS = const State._('in_progress');
  static const State INTERRUPTED = const State._('interrupted');
  static const State COMPLETE = const State._('complete');

  static List<State> _values = [IN_PROGRESS, INTERRUPTED, COMPLETE];

  static List<State> get values => _values;

  static State create(String str) =>
      _values.singleWhere((ChromeEnum e) => e.value == str);

  const State._(String str): super(str);
}

/**
 * <dl><dt>uniquify</dt>
 *      <dd>To avoid duplication, the <code>filename</code> is changed to
 *      include a counter before the filename extension.</dd>
 *      <dt>overwrite</dt>
 *      <dd>The existing file will be overwritten with the new file.</dd>
 *      <dt>prompt</dt>
 *      <dd>The user will be prompted with a file chooser dialog.</dd>
 *  </dl>
 */
class HeaderNameValuePair extends ChromeObject {
  static HeaderNameValuePair create(JsObject proxy) => proxy == null ? null : new HeaderNameValuePair.fromProxy(proxy);

  HeaderNameValuePair({String name, String value}) {
    if (name != null) this.name = name;
    if (value != null) this.value = value;
  }

  HeaderNameValuePair.fromProxy(JsObject proxy): super.fromProxy(proxy);

  String get name => proxy['name'];
  set name(String value) => proxy['name'] = value;

  String get value => proxy['value'];
  set value(String value) => proxy['value'] = value;
}

/**
 * 
 */
class FilenameSuggestion extends ChromeObject {
  static FilenameSuggestion create(JsObject proxy) => proxy == null ? null : new FilenameSuggestion.fromProxy(proxy);

  FilenameSuggestion({String filename, FilenameConflictAction conflictAction}) {
    if (filename != null) this.filename = filename;
    if (conflictAction != null) this.conflictAction = conflictAction;
  }

  FilenameSuggestion.fromProxy(JsObject proxy): super.fromProxy(proxy);

  String get filename => proxy['filename'];
  set filename(String value) => proxy['filename'] = value;

  FilenameConflictAction get conflictAction => FilenameConflictAction.create(proxy['conflictAction']);
  set conflictAction(FilenameConflictAction value) => proxy['conflictAction'] = value;
}

/**
 * <dl><dt>file</dt>
 *      <dd>The download's filename is suspicious.</dd>
 *      <dt>url</dt>
 *      <dd>The download's URL is known to be malicious.</dd>
 *      <dt>content</dt>
 *      <dd>The downloaded file is known to be malicious.</dd>
 *      <dt>uncommon</dt>
 *      <dd>The download's URL is not commonly downloaded and could be
 *      dangerous.</dd>
 *      <dt>host</dt>
 *      <dd>The download came from a host known to distribute malicious
 *      binaries and is likely dangerous.</dd>
 *      <dt>unwanted</dt>
 *      <dd>The download is potentially unwanted or unsafe. E.g. it could make
 *      changes to browser or computer settings.</dd>
 *      <dt>safe</dt>
 *      <dd>The download presents no known danger to the user's computer.</dd>
 *      <dt>accepted</dt>
 *      <dd>The user has accepted the dangerous download.</dd>
 *  </dl>
 */
class DownloadOptions extends ChromeObject {
  static DownloadOptions create(JsObject proxy) => proxy == null ? null : new DownloadOptions.fromProxy(proxy);

  DownloadOptions({String url, String filename, FilenameConflictAction conflictAction, bool saveAs, HttpMethod method, HeaderNameValuePair headers, String body}) {
    if (url != null) this.url = url;
    if (filename != null) this.filename = filename;
    if (conflictAction != null) this.conflictAction = conflictAction;
    if (saveAs != null) this.saveAs = saveAs;
    if (method != null) this.method = method;
    if (headers != null) this.headers = headers;
    if (body != null) this.body = body;
  }

  DownloadOptions.fromProxy(JsObject proxy): super.fromProxy(proxy);

  String get url => proxy['url'];
  set url(String value) => proxy['url'] = value;

  String get filename => proxy['filename'];
  set filename(String value) => proxy['filename'] = value;

  FilenameConflictAction get conflictAction => FilenameConflictAction.create(proxy['conflictAction']);
  set conflictAction(FilenameConflictAction value) => proxy['conflictAction'] = value;

  bool get saveAs => proxy['saveAs'];
  set saveAs(bool value) => proxy['saveAs'] = value;

  HttpMethod get method => HttpMethod.create(proxy['method']);
  set method(HttpMethod value) => proxy['method'] = value;

  HeaderNameValuePair get headers => HeaderNameValuePair.create(proxy['headers']);
  set headers(HeaderNameValuePair value) => proxy['headers'] = value;

  String get body => proxy['body'];
  set body(String value) => proxy['body'] = value;
}

/**
 * 
 */
class DownloadItem extends ChromeObject {
  static DownloadItem create(JsObject proxy) => proxy == null ? null : new DownloadItem.fromProxy(proxy);

  DownloadItem({int id, String url, String referrer, String filename, bool incognito, DangerType danger, String mime, String startTime, String endTime, String estimatedEndTime, State state, bool paused, bool canResume, InterruptReason error, int bytesReceived, int totalBytes, int fileSize, bool exists, String byExtensionId, String byExtensionName}) {
    if (id != null) this.id = id;
    if (url != null) this.url = url;
    if (referrer != null) this.referrer = referrer;
    if (filename != null) this.filename = filename;
    if (incognito != null) this.incognito = incognito;
    if (danger != null) this.danger = danger;
    if (mime != null) this.mime = mime;
    if (startTime != null) this.startTime = startTime;
    if (endTime != null) this.endTime = endTime;
    if (estimatedEndTime != null) this.estimatedEndTime = estimatedEndTime;
    if (state != null) this.state = state;
    if (paused != null) this.paused = paused;
    if (canResume != null) this.canResume = canResume;
    if (error != null) this.error = error;
    if (bytesReceived != null) this.bytesReceived = bytesReceived;
    if (totalBytes != null) this.totalBytes = totalBytes;
    if (fileSize != null) this.fileSize = fileSize;
    if (exists != null) this.exists = exists;
    if (byExtensionId != null) this.byExtensionId = byExtensionId;
    if (byExtensionName != null) this.byExtensionName = byExtensionName;
  }

  DownloadItem.fromProxy(JsObject proxy): super.fromProxy(proxy);

  int get id => proxy['id'];
  set id(int value) => proxy['id'] = value;

  String get url => proxy['url'];
  set url(String value) => proxy['url'] = value;

  String get referrer => proxy['referrer'];
  set referrer(String value) => proxy['referrer'] = value;

  String get filename => proxy['filename'];
  set filename(String value) => proxy['filename'] = value;

  bool get incognito => proxy['incognito'];
  set incognito(bool value) => proxy['incognito'] = value;

  DangerType get danger => DangerType.create(proxy['danger']);
  set danger(DangerType value) => proxy['danger'] = value;

  String get mime => proxy['mime'];
  set mime(String value) => proxy['mime'] = value;

  String get startTime => proxy['startTime'];
  set startTime(String value) => proxy['startTime'] = value;

  String get endTime => proxy['endTime'];
  set endTime(String value) => proxy['endTime'] = value;

  String get estimatedEndTime => proxy['estimatedEndTime'];
  set estimatedEndTime(String value) => proxy['estimatedEndTime'] = value;

  State get state => State.create(proxy['state']);
  set state(State value) => proxy['state'] = value;

  bool get paused => proxy['paused'];
  set paused(bool value) => proxy['paused'] = value;

  bool get canResume => proxy['canResume'];
  set canResume(bool value) => proxy['canResume'] = value;

  InterruptReason get error => InterruptReason.create(proxy['error']);
  set error(InterruptReason value) => proxy['error'] = value;

  int get bytesReceived => proxy['bytesReceived'];
  set bytesReceived(int value) => proxy['bytesReceived'] = value;

  int get totalBytes => proxy['totalBytes'];
  set totalBytes(int value) => proxy['totalBytes'] = value;

  int get fileSize => proxy['fileSize'];
  set fileSize(int value) => proxy['fileSize'] = value;

  bool get exists => proxy['exists'];
  set exists(bool value) => proxy['exists'] = value;

  String get byExtensionId => proxy['byExtensionId'];
  set byExtensionId(String value) => proxy['byExtensionId'] = value;

  String get byExtensionName => proxy['byExtensionName'];
  set byExtensionName(String value) => proxy['byExtensionName'] = value;
}

/**
 * 
 */
class DownloadQuery extends ChromeObject {
  static DownloadQuery create(JsObject proxy) => proxy == null ? null : new DownloadQuery.fromProxy(proxy);

  DownloadQuery({String query, String startedBefore, String startedAfter, String endedBefore, String endedAfter, int totalBytesGreater, int totalBytesLess, String filenameRegex, String urlRegex, int limit, String orderBy, int id, String url, String filename, DangerType danger, String mime, String startTime, String endTime, State state, bool paused, InterruptReason error, int bytesReceived, int totalBytes, int fileSize, bool exists}) {
    if (query != null) this.query = query;
    if (startedBefore != null) this.startedBefore = startedBefore;
    if (startedAfter != null) this.startedAfter = startedAfter;
    if (endedBefore != null) this.endedBefore = endedBefore;
    if (endedAfter != null) this.endedAfter = endedAfter;
    if (totalBytesGreater != null) this.totalBytesGreater = totalBytesGreater;
    if (totalBytesLess != null) this.totalBytesLess = totalBytesLess;
    if (filenameRegex != null) this.filenameRegex = filenameRegex;
    if (urlRegex != null) this.urlRegex = urlRegex;
    if (limit != null) this.limit = limit;
    if (orderBy != null) this.orderBy = orderBy;
    if (id != null) this.id = id;
    if (url != null) this.url = url;
    if (filename != null) this.filename = filename;
    if (danger != null) this.danger = danger;
    if (mime != null) this.mime = mime;
    if (startTime != null) this.startTime = startTime;
    if (endTime != null) this.endTime = endTime;
    if (state != null) this.state = state;
    if (paused != null) this.paused = paused;
    if (error != null) this.error = error;
    if (bytesReceived != null) this.bytesReceived = bytesReceived;
    if (totalBytes != null) this.totalBytes = totalBytes;
    if (fileSize != null) this.fileSize = fileSize;
    if (exists != null) this.exists = exists;
  }

  DownloadQuery.fromProxy(JsObject proxy): super.fromProxy(proxy);

  String get query => proxy['query'];
  set query(String value) => proxy['query'] = value;

  String get startedBefore => proxy['startedBefore'];
  set startedBefore(String value) => proxy['startedBefore'] = value;

  String get startedAfter => proxy['startedAfter'];
  set startedAfter(String value) => proxy['startedAfter'] = value;

  String get endedBefore => proxy['endedBefore'];
  set endedBefore(String value) => proxy['endedBefore'] = value;

  String get endedAfter => proxy['endedAfter'];
  set endedAfter(String value) => proxy['endedAfter'] = value;

  int get totalBytesGreater => proxy['totalBytesGreater'];
  set totalBytesGreater(int value) => proxy['totalBytesGreater'] = value;

  int get totalBytesLess => proxy['totalBytesLess'];
  set totalBytesLess(int value) => proxy['totalBytesLess'] = value;

  String get filenameRegex => proxy['filenameRegex'];
  set filenameRegex(String value) => proxy['filenameRegex'] = value;

  String get urlRegex => proxy['urlRegex'];
  set urlRegex(String value) => proxy['urlRegex'] = value;

  int get limit => proxy['limit'];
  set limit(int value) => proxy['limit'] = value;

  String get orderBy => proxy['orderBy'];
  set orderBy(String value) => proxy['orderBy'] = value;

  int get id => proxy['id'];
  set id(int value) => proxy['id'] = value;

  String get url => proxy['url'];
  set url(String value) => proxy['url'] = value;

  String get filename => proxy['filename'];
  set filename(String value) => proxy['filename'] = value;

  DangerType get danger => DangerType.create(proxy['danger']);
  set danger(DangerType value) => proxy['danger'] = value;

  String get mime => proxy['mime'];
  set mime(String value) => proxy['mime'] = value;

  String get startTime => proxy['startTime'];
  set startTime(String value) => proxy['startTime'] = value;

  String get endTime => proxy['endTime'];
  set endTime(String value) => proxy['endTime'] = value;

  State get state => State.create(proxy['state']);
  set state(State value) => proxy['state'] = value;

  bool get paused => proxy['paused'];
  set paused(bool value) => proxy['paused'] = value;

  InterruptReason get error => InterruptReason.create(proxy['error']);
  set error(InterruptReason value) => proxy['error'] = value;

  int get bytesReceived => proxy['bytesReceived'];
  set bytesReceived(int value) => proxy['bytesReceived'] = value;

  int get totalBytes => proxy['totalBytes'];
  set totalBytes(int value) => proxy['totalBytes'] = value;

  int get fileSize => proxy['fileSize'];
  set fileSize(int value) => proxy['fileSize'] = value;

  bool get exists => proxy['exists'];
  set exists(bool value) => proxy['exists'] = value;
}

/**
 * 
 */
class StringDelta extends ChromeObject {
  static StringDelta create(JsObject proxy) => proxy == null ? null : new StringDelta.fromProxy(proxy);

  StringDelta({String previous, String current}) {
    if (previous != null) this.previous = previous;
    if (current != null) this.current = current;
  }

  StringDelta.fromProxy(JsObject proxy): super.fromProxy(proxy);

  String get previous => proxy['previous'];
  set previous(String value) => proxy['previous'] = value;

  String get current => proxy['current'];
  set current(String value) => proxy['current'] = value;
}

/**
 * 
 */
class LongDelta extends ChromeObject {
  static LongDelta create(JsObject proxy) => proxy == null ? null : new LongDelta.fromProxy(proxy);

  LongDelta({int previous, int current}) {
    if (previous != null) this.previous = previous;
    if (current != null) this.current = current;
  }

  LongDelta.fromProxy(JsObject proxy): super.fromProxy(proxy);

  int get previous => proxy['previous'];
  set previous(int value) => proxy['previous'] = value;

  int get current => proxy['current'];
  set current(int value) => proxy['current'] = value;
}

/**
 * Encapsulates a change in a DownloadItem.
 */
class BooleanDelta extends ChromeObject {
  static BooleanDelta create(JsObject proxy) => proxy == null ? null : new BooleanDelta.fromProxy(proxy);

  BooleanDelta({bool previous, bool current}) {
    if (previous != null) this.previous = previous;
    if (current != null) this.current = current;
  }

  BooleanDelta.fromProxy(JsObject proxy): super.fromProxy(proxy);

  bool get previous => proxy['previous'];
  set previous(bool value) => proxy['previous'] = value;

  bool get current => proxy['current'];
  set current(bool value) => proxy['current'] = value;
}

/**
 * 
 */
class DownloadDelta extends ChromeObject {
  static DownloadDelta create(JsObject proxy) => proxy == null ? null : new DownloadDelta.fromProxy(proxy);

  DownloadDelta({int id, StringDelta url, StringDelta filename, StringDelta danger, StringDelta mime, StringDelta startTime, StringDelta endTime, StringDelta state, BooleanDelta canResume, BooleanDelta paused, StringDelta error, LongDelta totalBytes, LongDelta fileSize, BooleanDelta exists}) {
    if (id != null) this.id = id;
    if (url != null) this.url = url;
    if (filename != null) this.filename = filename;
    if (danger != null) this.danger = danger;
    if (mime != null) this.mime = mime;
    if (startTime != null) this.startTime = startTime;
    if (endTime != null) this.endTime = endTime;
    if (state != null) this.state = state;
    if (canResume != null) this.canResume = canResume;
    if (paused != null) this.paused = paused;
    if (error != null) this.error = error;
    if (totalBytes != null) this.totalBytes = totalBytes;
    if (fileSize != null) this.fileSize = fileSize;
    if (exists != null) this.exists = exists;
  }

  DownloadDelta.fromProxy(JsObject proxy): super.fromProxy(proxy);

  int get id => proxy['id'];
  set id(int value) => proxy['id'] = value;

  StringDelta get url => StringDelta.create(proxy['url']);
  set url(StringDelta value) => proxy['url'] = value;

  StringDelta get filename => StringDelta.create(proxy['filename']);
  set filename(StringDelta value) => proxy['filename'] = value;

  StringDelta get danger => StringDelta.create(proxy['danger']);
  set danger(StringDelta value) => proxy['danger'] = value;

  StringDelta get mime => StringDelta.create(proxy['mime']);
  set mime(StringDelta value) => proxy['mime'] = value;

  StringDelta get startTime => StringDelta.create(proxy['startTime']);
  set startTime(StringDelta value) => proxy['startTime'] = value;

  StringDelta get endTime => StringDelta.create(proxy['endTime']);
  set endTime(StringDelta value) => proxy['endTime'] = value;

  StringDelta get state => StringDelta.create(proxy['state']);
  set state(StringDelta value) => proxy['state'] = value;

  BooleanDelta get canResume => BooleanDelta.create(proxy['canResume']);
  set canResume(BooleanDelta value) => proxy['canResume'] = value;

  BooleanDelta get paused => BooleanDelta.create(proxy['paused']);
  set paused(BooleanDelta value) => proxy['paused'] = value;

  StringDelta get error => StringDelta.create(proxy['error']);
  set error(StringDelta value) => proxy['error'] = value;

  LongDelta get totalBytes => LongDelta.create(proxy['totalBytes']);
  set totalBytes(LongDelta value) => proxy['totalBytes'] = value;

  LongDelta get fileSize => LongDelta.create(proxy['fileSize']);
  set fileSize(LongDelta value) => proxy['fileSize'] = value;

  BooleanDelta get exists => BooleanDelta.create(proxy['exists']);
  set exists(BooleanDelta value) => proxy['exists'] = value;
}

/**
 * 
 */
class GetFileIconOptions extends ChromeObject {
  static GetFileIconOptions create(JsObject proxy) => proxy == null ? null : new GetFileIconOptions.fromProxy(proxy);

  GetFileIconOptions({int size}) {
    if (size != null) this.size = size;
  }

  GetFileIconOptions.fromProxy(JsObject proxy): super.fromProxy(proxy);

  int get size => proxy['size'];
  set size(int value) => proxy['size'] = value;
}
