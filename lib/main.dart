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
  final userInputController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Flutter Demo'),),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: TextField(
            controller: userInputController,
            decoration: InputDecoration(hintText: 'Enter some text'),
          ),
        ),

      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _writeUserInputText();
        },
        tooltip: 'Save',
        child: Icon(Icons.save),
      )
    );
  }

  @override
  void initState() {
    super.initState();
    widget.storage.readCounter().then((value) => {
      setState(() {
        userInputController.text = value;
      })
    });
  }

  Future<File> _writeUserInputText() {
    return widget.storage.writeCounter(userInputController.text);
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

  Future<String> readCounter() async {
    try {
      final file = await _localFile;
      final contents = await file.readAsString();
      return contents;
    } catch (err) {
      return ''; //this is the first time app is opened
    }
  }

  Future<File> writeCounter(String userInput) async {
    final file = await _localFile;
    return file.writeAsString(userInput);
  }
}
