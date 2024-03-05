import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(title: "App Bar",home: const MyApp(),));

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( title: const Text("SCREEN ONE")),
      body: Center(
        child: ElevatedButton(
            onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const SecondScreen())
                        );
                      },
            child: Text('GO TO SECOND SCREEN')),
      ),
    );
  }
}

class SecondScreen extends StatelessWidget{
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: "App Bar", home: Scaffold(
      appBar: AppBar(title: Text('SECOND SCREEN'),),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('GO TO FIRST SCREEN'),
        ),
      ),
    ),);
  }
}
