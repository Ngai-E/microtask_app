import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(title: "App Bar",home: const MyApp(),));

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MyHomePage();
  }
}

class MyHomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home Screen'),),
      body: const Center(child: Text('My Home page'),),
      drawer: Drawer(
        child: ListView(
          children:  <Widget>[
            const SizedBox(
              height: 60,
              child:  DrawerHeader(decoration: BoxDecoration(color: Colors.blue), child: Text("Drawer header"),),
            ),
            ListTile(
              title:  const Text('Item One'),
              onTap: () {
                Navigator.of(context).pop();
              }
            ),
            const ListTile(title: Text('Item Two'),)
          ],
        ),
      ),
    );
  }
  
}

