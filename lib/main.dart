import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('List View Practice'),),
        body: ListView(
          children: [
            ListTile(
              title: Text('Person one'),
              subtitle: Text('person1@gmail.com'),
              trailing: Icon(Icons.arrow_forward),
              leading: Icon(Icons.person),
              onTap: () => print('person 1 was tapped'),
            ),ListTile(
              title: Text('Person three'),
              subtitle: Text('person3@gmail.com'),
              trailing: Icon(Icons.arrow_forward),
              leading: Icon(Icons.person),
              onTap: () => print('person 3 was tapped'),
            ),ListTile(
              title: Text('Person four'),
              subtitle: Text('person4@gmail.com'),
              trailing: Icon(Icons.arrow_forward),
              leading: Icon(Icons.person),
              onTap: () => print('person 4 was tapped'),
            ),
            ListTile(
              title: Text('Person two'),
              subtitle: Text('person2@gmail.com'),
              trailing: Icon(Icons.arrow_forward),
              leading: Icon(Icons.person),
              onTap: () => print('person 2 was tapped'),
            )
          ],
        ),
      ),
    );
  }
}
