import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

void main() => runApp(
  MaterialApp(title: 'demo', home: FlutterDemo(storage: CounterStorage()),)
);

class FlutterDemo extends StatefulWidget{
  final CounterStorage storage;
  const FlutterDemo({super.key, required this.storage});

  @override
  State<FlutterDemo> createState() => _FlutterDemoState();
}

class _FlutterDemoState  extends State<FlutterDemo>{
  int _counter = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Flutter Demo'),),
      body: Center(
        child: Text('Button tapped $_counter time${_counter == 1 ? '' : 's'}.'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),

      ),
    );
  }

  @override
  void initState() {
    super.initState();
    widget.storage.readCounter().then((value) => {
      setState(() {
        _counter = value;
      })
    });
  }

  Future<File> _incrementCounter() {
    setState(() {
      _counter++;
    });
    return widget.storage.writeCounter(_counter);
  }
}


class CounterStorage {
  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/counter.txt');
  }

  Future<int> readCounter() async {
    try {
      final file = await _localFile;
      final contents = await file.readAsString();
      return int.parse(contents);
    } catch (err) {
      return 0; //this is the first time app is opened
    }
  }

  Future<File> writeCounter(int counter) async {
    final file = await _localFile;
    return file.writeAsString('$counter');
  }
}
