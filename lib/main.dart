import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;

Future<Album> fetchAlbum(int albumId) async {
  final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/albums/$albumId'));
  if (response.statusCode == 200) {
    return Album.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load Album');
  }
}

void main() => runApp(
  MaterialApp(title: 'demo', home: FlutterDemo(), theme: ThemeData(primarySwatch: Colors.red),)
);

class Album {
  final int userId;
  final int id;
  final String title;

  const Album ({
    required this.userId,
    required this.id,
    required this.title
});

  factory Album.fromJson(Map<String, dynamic> json) {
      return Album(userId: json['userId'], id: json['id'], title: json['title']);
  }

}

class FlutterDemo extends StatefulWidget{
  const FlutterDemo({super.key});

  @override
  State<FlutterDemo> createState() => _FlutterDemoState();
}

class _FlutterDemoState  extends State<FlutterDemo>{
  late Future<Album> futureAlbum;
  final TextEditingController _textEditingController = TextEditingController();

  void _fetchAlbum() {
    int albumId = int.tryParse(_textEditingController.text) ?? 1;
    setState(() {
      futureAlbum = fetchAlbum(albumId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Http Example'),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _textEditingController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Album Id Number'),
            ),
            ElevatedButton(
                onPressed: _fetchAlbum,
                child: const Text('Submit')),
            FutureBuilder<Album>(
                future: futureAlbum,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Text(snapshot.data!.title);
                  } else if (snapshot.hasError) {
                    return Text('${snapshot.error}');
                  }
                  return const CircularProgressIndicator();
                }
            )
          ],
        )

      )
    );
  }

  @override
  void initState() {
    super.initState();
    futureAlbum = fetchAlbum(1);
  }

}

