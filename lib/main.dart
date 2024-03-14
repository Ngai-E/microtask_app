import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget{
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    final String appBarTitle = 'Form Styling Demo';
    return MaterialApp(
      title: 'Material form field test',
      theme: ThemeData(
        primarySwatch: Colors.red,
        fontFamily: 'Roboto'
      ),
      home: Scaffold(
        appBar: AppBar(title: Text(appBarTitle),),
        body: const MyFormScreen(),
      ),
    );
  }
}

class MyFormScreen extends StatelessWidget{
  const MyFormScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 40,),
          TextField(
            style: TextStyle(color: Colors.blue, fontSize: 25),
            decoration: InputDecoration(
                hintText: 'enter your name',
                prefixIcon: Icon(Icons.person, size: 30,)),),
          const SizedBox(height: 16,),
          TextFormField(
            decoration: InputDecoration(labelText: 'Name',
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12))),),
          const SizedBox(height: 40,),
          ElevatedButton(
              onPressed: () => {},
              child: const Text('Submit'),
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40))),)
        ],
      ),
    );
  }
}