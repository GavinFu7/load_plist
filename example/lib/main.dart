import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:read_plist/read_plist.dart';
import 'dart:io';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  example() async {
    // 測試前寫入 plist 檔案
    final appDocumentsDir = await getApplicationDocumentsDirectory();
    final file = File("${appDocumentsDir.path}/test.plist");
    if (!await file.exists()) {
      final realmBytes = await rootBundle.load("assets/test.plist");
      await file.writeAsBytes(
        realmBytes.buffer.asUint8List(realmBytes.offsetInBytes, realmBytes.lengthInBytes),
        mode: FileMode.write);
    }


    // Read plist
    final data = await plist("${appDocumentsDir.path}/test.plist");
    print(data);
  }

  @override
  void initState() {
    super.initState();

    example();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Read plist plugin example'),
        ),
        body: Container()
      ),
    );
  }
}
