import 'dart:convert';

import 'package:intl/intl.dart';

class JsonPrettyPrinter {
  static final jsonPattern = RegExp(r'^{.*}$|^\[.*\]$');
  static final requestMarker = '*** Request ***';
  static final responseMarker = '*** Response ***';

  static void logPrint(Object msg) {
    try {
      if (msg is String) {
        if (jsonPattern.hasMatch(msg)) {
          final byteSize = _byteSize(msg);
          print('body (${_describeByte(byteSize)}) -\n');
          if (byteSize > 0) {
            final jsonBody =
                const JsonEncoder.withIndent('  ').convert(json.decode(msg));
            final splitByLine = jsonBody.split('\n');
            splitByLine.forEach((l) => print(l));
          }
        } else {
          print(msg);
        }
      } else {
        print(msg);
      }
    } catch (e) {
      print(e);
    }
  }

  static int _byteSize(String str) {
    return utf8.encode(str).length;
  }

  static String _describeByte(int size) {
    final fmt = NumberFormat('.00');
    if (size >= 1000000) {
      return '${fmt.format(size / 1000000.0)}MB';
    } else if (size >= 1000) {
      return '${fmt.format(size / 1000.0)}KB';
    } else {
      return '${size}B';
    }
  }
}
