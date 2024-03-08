import 'package:flutter/material.dart';

class Todo {
  final String title;
  final String description;

  const Todo(this.title, this.description);
}

final List<Todo> _todos = [
  const Todo('Task one', 'take out the trash'),
  const Todo('Task two', 'paint the house')
];

void main() => runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo App',
      home: TasksScreen( todos: _todos,),
    );
  }
}

class TasksScreen extends StatefulWidget{
  final List<Todo> todos;

  const TasksScreen({super.key, required this.todos});

  @override
  State<StatefulWidget> createState() {
    return _TasksScreenState();
  }
}

class _TasksScreenState  extends State<TasksScreen>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('My tasks'),),
      body: ListView.builder(
        itemCount: _todos.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(_todos[index].title),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => DetailsScreen(todo: _todos[index])));
            },
          );
        },
      ),
      floatingActionButton:  FloatingActionButton(
        onPressed: _createNewTask,
        child: Icon(Icons.add),
      ),
    );
  }

  _createNewTask()  async {
    Todo? result =  await showDialog(context: context, builder: (context) {
      String? title;
      String? description;
      return AlertDialog(
        title: Text('Create New Task'),
        content: SizedBox(
          height: 100,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget> [
            TextField(
              decoration: InputDecoration(hintText: 'Enter title'),
              onChanged: (value) => title = value,
            ),
            TextField(
              decoration: InputDecoration(hintText: 'Enter description'),
              onChanged: (value) => description = value,
            ),
          ],
        ),),
        actions: <Widget>[
          TextButton(onPressed: () => Navigator.pop(context), child: Text('Cancel')),
          TextButton(onPressed: () {
            if (title != null && description != null) {
              Navigator.pop(context, Todo(title!, description!));
            }
          }, child: Text('Save'))
        ],
      );
    });

    if (result != null) {
      setState(() {
        _todos.add(result);
      });
    }

  }
}

class DetailsScreen extends StatelessWidget{
  final Todo todo;

  const DetailsScreen({super.key, required this.todo});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Details Screen',
      home: Scaffold(
        appBar: AppBar(title: Text(this.todo.title),),
        body: Center(
          child: Text(this.todo.description),
        ),
      ),
    );
  }
}

