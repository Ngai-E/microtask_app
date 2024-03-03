import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(home: Scaffold(body: Center(child: Counter(),)),));

class Counter extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _MyCounterWidget();
}

class _MyCounterWidget  extends State<Counter>{
  int _counter = 0;
  @override
  Widget build(BuildContext context) => Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      TextButton(onPressed: _increment, child: Text('PRESS ME!')),
      Text('You have pressed the button $_counter times')
    ],
  );

  void _increment() {
    setState(() {
      _counter++;
    });
  }
}
  

