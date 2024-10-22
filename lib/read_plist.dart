import 'package:flutter/services.dart';

Future<T?> plist<T>(String sourcePath) async {
  const MethodChannel plist = MethodChannel('read_plist');
  return await plist.invokeMethod('readPlist', sourcePath);
}

