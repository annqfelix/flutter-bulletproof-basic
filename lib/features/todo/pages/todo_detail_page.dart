import 'package:flutter/material.dart';

class TodoDetailPage extends StatefulWidget {
  static const routeName = 'todo/detail';
  static const routePath = ':$kTodoIdParam';
  static const kTodoIdParam = 'todoId';

  final String todoId;

  const TodoDetailPage({super.key, required this.todoId});

  @override
  State<TodoDetailPage> createState() => _TodoDetailPageState();
}

class _TodoDetailPageState extends State<TodoDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo Detail'),
      ),
    );
  }
}
