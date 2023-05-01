import 'package:flutter/material.dart';

class TodoListingPage extends StatefulWidget {
  static const routeName = 'todo/listing';
  static const routePath = 'todo';

  const TodoListingPage({super.key});

  @override
  State<TodoListingPage> createState() => _TodoListingPageState();
}

class _TodoListingPageState extends State<TodoListingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Todo List'),
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      ),
    );
  }
}
