import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) => MaterialApp(home: MyHomePage());
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState()  => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>{
  String _inputText = '';

  void _showInputDialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
                  TextEditingController controller = TextEditingController();
                  return AlertDialog(
                            title: Text("Enter you name"),
                            content: TextField(controller: controller, decoration: InputDecoration(hintText: "Enter some text"),),
                            actions: <Widget>[
                              TextButton(onPressed: () => Navigator.of(context).pop(), child: Text('Cancel')),
                              TextButton(onPressed: ()   {
                                setState(() {
                                  _inputText = controller.text;
                                });
                                Navigator.of(context).pop();
                              }, child: Text("Save"))
                            ],
                  );
        });
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: Text("Testing Alert"),),
    body: Center(child: Text(_inputText.isEmpty ? 'Tap the icon  to enter text' : _inputText),),
    floatingActionButton: FloatingActionButton(
      onPressed: _showInputDialog,
      tooltip: 'Enter text',
      child: const Icon(Icons.edit),
    ),
  );

}
