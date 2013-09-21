// Copyright (c) 2013, the gen_tools.dart project authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be found
// in the LICENSE file.

library model_idl;

import 'model_chrome.dart';

// TODO: this model needs to be re-written in-line with the needs of the web_idl_parser.

class IDLNamespace {
  /// The IDL namespace name, generally something like 'commandLinePrivate'.
  String name;

  String description;

  List<IDLFunction> functions = [];
  List<IDLEvent> events = [];
  List<IDLProperty> properties = [];

  String toString() => name;
}

class IDLFunction {
  String name;
  String _description;
  List<IDLParameter> parameters = [];
  IDLType returnType;

  IDLFunction(this.name, this._description);

  String get description {
    if (_description == null) {
      return _description;
    }

    StringBuffer buf = new StringBuffer(_description);
    buf.write('\n');

    parameters.forEach((p) {
      if (p.description != null) {
        buf.write('\n');
        buf.write("[${p.name}] ${p.description}\n");
      }
    });

    return buf.toString();
  }

  bool get usesCallback => !parameters.isEmpty && parameters.last.isCallback;

  IDLParameter get callbackParamType => parameters.last;

  bool get returns {
    if (usesCallback) {
      return false;
    }

    return returnType != null;
  }

  String toString() => "${name}()";
}

class IDLEvent {
  String name;
  String description;
  List<IDLParameter> params = [];

  IDLEvent(this.name);

  String toString() => name;
}

class IDLParameter {
  String name;
  IDLType type = IDLType.VAR;
  String description;
  bool optional;

  List<IDLParameter> params = [];

  IDLParameter(this.name);

  bool get isCallback => name == 'callback' || name == 'responseCallback';

  String toString() => "${type} ${name}";
}

class IDLProperty {
  String name;
  String description;
  IDLType returnType;

  IDLProperty(this.name);

  String toString() => name;
}

class IDLType {
  static IDLType VAR = new IDLType('any');

  /// The type name, i.e. string, integer, boolean, object, ...
  String name;

  /// Additional type info, from the $ref field. e.g. 'runtime.Port'
  String refName;

  factory IDLType(String name) {
    if (name == null) {
      return null;
    } else {
      return new IDLType._(name);
    }
  }

  factory IDLType.fromMap(Map m) {
    if (!m.containsKey('type') && !m.containsKey(r'$ref')) {
      return null;
    } else if (m.containsKey(r'$ref')) {
      return new IDLType.fromRef(m[r'$ref']);
    } else {
      return new IDLType._(m['type']);
    }
  }

  IDLType.fromRef(this.refName) {
    name = 'object';
  }

  IDLType._(this.name);

  bool get isFunction => name == 'function';
  bool get isObject => name == 'object';
  bool get isArray => name == 'array';

  String toString() => name;
}


ChromeLibrary convert(IDLNamespace namespace) {
  ChromeLibrary library = new ChromeLibrary();
  library.name = namespace.name;
  library.documentation = ""; // TODO: parse documentation

  library.properties = namespace.properties.map(_convertProperty).toList();
  // library.types = namespace.types.map(_convertDeclaredType).toString();
  library.methods = namespace.functions.map(_convertMethod).toList();
  library.events = namespace.events.map(_convertEvent).toList();

  return library;
}

ChromeMethod _convertMethod(IDLFunction f) {
  ChromeMethod method = new ChromeMethod();

  method.name = f.name;
  // method.documentation = convertHtmlToDartdoc(f.description);
  method.returns = _convertType(f.returnType);
  method.params = f.parameters.map(_convertParameter).toList();

  if (method.returns == null) {
    if (!f.parameters.isEmpty && f.parameters.last.isCallback) {
      ChromeType type = method.params.removeLast();

      method.returns = _convertToFuture(type);
    } else {
      method.returns = ChromeType.VOID;
    }
  }

  return method;
}

ChromeType _convertParameter(IDLParameter p) {
  ChromeType param = new ChromeType();
  param.name = p.name;
  param.type = p.type.name;
  param.optional = (p.optional == null) ? false : p.optional;
  return param;
}

//ChromeDeclaredType _convertDeclaredType(JsonDeclaredType t) {
//  ChromeDeclaredType type = _convertType_(t, new ChromeDeclaredType());
//
//  int index = type.name.lastIndexOf('.');
//
//  if (index != -1) {
//    type.qualifier = type.name.substring(0, index);
//    type.name = type.name.substring(index + 1);
//  }
//
//  return type;
//}

ChromeProperty _convertProperty(IDLProperty p) {
  ChromeProperty property = new ChromeProperty();

  property.name = p.name;
  // property.documentation = convertHtmlToDartdoc(p.description);
  property.type = _convertType(p.returnType);


  return property;
}

ChromeEvent _convertEvent(IDLEvent e) {
  ChromeEvent chromeEvent = new ChromeEvent();

  chromeEvent.name = e.name;
  chromeEvent.parameters = e.params.map(_convertParameter).toList();
  return chromeEvent;
  //return _convertType_(e, new ChromeEvent());
}

//ChromeType _convertParameter(IDLParameter t) {
//  if (t == null) {
//    return null;
//  } else {
//    return _convertType_(t, new ChromeType());
//  }
//}

ChromeType _convertType(IDLType t) {
  if (t == null) {
    return null;
  } else {
    return _convertType_(t, new ChromeType());
  }
}

ChromeType _convertToFuture(ChromeType type) {
  ChromeType future = new ChromeType();

  future.type = "Future";

  if (type.parameters.length == 1) {
    future.parameters.add(type.parameters.first);
    future.documentation = future.parameters.first.documentation;
  } else if (type.parameters.length >= 2) {
    // TODO: we need to correctly handle mapping multiple parameters to a single
    // return
    // runtime.requestUpdateCheck()
    // devtools.inspectedWindow.eval()

    future.parameters.add(ChromeType.JS_OBJECT);
    future.documentation = type.parameters.map(
        (p) => "[${p.name}] ${p.documentation}").join('\n');
  }

  return future;
}

ChromeType _convertType_(IDLType t, ChromeType type) {
  type.name = t.name;
  // type.documentation = convertHtmlToDartdoc(t.description);

  if (t.name == 'string') {
    type.type = "String";
  } else if (t.name == 'integer') {
    type.type = "int";
  } else if (t.name == 'boolean') {
    type.type = "bool";
  } else if (_isImplicitInt(t)) {
    type.type = 'int';
  } else if (t.name == 'array') {
    // {type: array, items: {type: string}
    type.type = 'List';
  } else {
    // TODO:
    type.type = "var";
  }

  // TODO: properties

//  type.optional = t.optional;
//  type.parameters = t.parameters.map(_convertType).toList();

  return type;
}

bool _isImplicitInt(IDLType t) {
//  if (t is JsonParamType) {
//    JsonParamType type = t as JsonParamType;
//
//    return _isInt(type.value) || _isInt(type.maxLength);
//  }

  return false;
}