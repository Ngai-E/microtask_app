import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomeScreen(),
      );
  }
}

class HomeScreen  extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var _selectedOption = 'None';

  void _selectOption() async {
    var result = await Navigator.push(context, MaterialPageRoute(builder: (context) => const OptionsScreen()));

    setState(() {
      _selectedOption = result ?? 'NONE';
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Selected Option: $_selectedOption'),
            ElevatedButton(onPressed: _selectOption, child: const Text('Select Option')),
          ],
        ),
      ),
    );
  }
}

class OptionsScreen  extends StatelessWidget {
  const OptionsScreen({super.key});

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
            ElevatedButton(onPressed: () => Navigator.pop(context, 'option 1'), child: const Text('Option 1')),
            ElevatedButton(onPressed: () => Navigator.pop(context, 'option 2'), child: const Text('Option 2')),
          ],
        ),
      ),
    );
  }
}

