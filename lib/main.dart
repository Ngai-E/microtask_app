import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final items = ['item1', 'item2', 'item3'];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'learning list Builder',
      home: Scaffold(
        appBar: AppBar(title: Text('List View Builder'),),
        body: ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              final item = items[index];
              return ListTile(
                title: Text(item),
                onTap: () => print('item $item was tapped'),
              );
            }
        ),
      ),
    );
  }
}

