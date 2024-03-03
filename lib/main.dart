import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) => MaterialApp(home: MyHomePage());
}

class MyHomePage extends StatefulWidget{
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>{
  String _inputText = '';
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: Text('Creating Stateful Widgets'),),
    body: Center(
      child: TextField(
        decoration: InputDecoration(hintText: "Enter some text here!"),
        onChanged: (value) {
          setState(() {
            _inputText = value;
          });
        },
      ),
    ),
    bottomSheet: Container(
      alignment: Alignment.center,
      height: 50,
      child: Text('you entered $_inputText'),
    ),
  );
}
