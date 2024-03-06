
import 'package:flutter/material.dart';

class Todo {
  final String title;
  final String description;

  const Todo(this.title, this.description);
}

List<Todo> todos =  [
  const Todo('todo item 1', 'todo item 1 description'),
  const Todo('todo item 2', 'todo item 2 description'),
  const Todo('todo item 3', 'todo item 3 description'),
];

void main() => runApp(MaterialApp(title: 'Todo app', home: TodosScreen( todos: todos,),));

class TodosScreen extends StatelessWidget{
  const TodosScreen({super.key, required this.todos});
  final List<Todo> todos;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('TODO LIST'),),
      body: ListView.builder(
        itemCount: todos.length,
        itemBuilder: (context, index) => ListTile(
          title: Text(todos[index].title),
          onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => DetailsScreen(todo: todos[index])))
          ),
        ),
      );
  }
}

class DetailsScreen extends StatelessWidget{
  final Todo todo;
  const DetailsScreen({super.key, required this.todo});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Details',
      home: Scaffold(
        appBar: AppBar(title: Text(todo.title),),
        body: Center(child: Text(todo.description),),
      ),
    );
  }
}