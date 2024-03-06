import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
      );
  }
}

class HomeScreen  extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var _selectedOption = 'None';

  void _selectOption() async {
    var result = await Navigator.push(context, MaterialPageRoute(builder: (context) => OptionsScreen()));

    setState(() {
      _selectedOption = result ?? 'NONE';
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Selected Option: $_selectedOption'),
            ElevatedButton(onPressed: _selectOption, child: Text('Select Option')),
          ],
        ),
      ),
    );
  }
}

class OptionsScreen  extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Options Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(onPressed: () => Navigator.pop(context, 'option 1'), child: Text('Option 1')),
            ElevatedButton(onPressed: () => Navigator.pop(context, 'option 2'), child: Text('Option 12')),
          ],
        ),
      ),
    );
  }
}

