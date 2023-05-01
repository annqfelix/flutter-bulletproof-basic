import 'package:flutter/material.dart';

class TodoDetailPage extends StatefulWidget {
  static const routeName = 'todo/detail';
  static const routePath = ':$kTaskIdParam';
  static const kTaskIdParam = 'taskId';

  final String taskId;

  const TodoDetailPage({super.key, required this.taskId});

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
