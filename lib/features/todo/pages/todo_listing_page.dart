import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bulletproof_basic/features/todo/pages/todo_detail_page.dart';
import 'package:flutter_remoter/flutter_remoter.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

import '../../../api/index.dart';

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
      body: RemoterQuery<List<Todo>>(
        remoterKey: jsonEncode(['todo', 'list']),
        execute: () async {
          final todoApi = GetIt.I.get<TodoApi>();
          final response = await todoApi.getTodoList();
          return response.toList();
        },
        disabled: false,
        builder: (context, snapshot, utils) {
          if (snapshot.status == RemoterStatus.fetching) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.status == RemoterStatus.error) {
            final error = snapshot.error;
            return Container(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    error.toString(),
                    style: const TextStyle(color: Colors.red),
                    textAlign: TextAlign.center,
                  ),
                  FilledButton.tonalIcon(
                    onPressed: () {
                      utils.retry();
                    },
                    icon: const Icon(Icons.refresh),
                    label: const Text('Retry'),
                  )
                ],
              ),
            );
          }

          final todoList = snapshot.data;
          if (todoList?.isEmpty ?? true) {
            return const Center(
              child: Text('No todo yet!'),
            );
          }
          return ListView.builder(
            itemBuilder: (context, idx) {
              final todoItem = todoList[idx];
              return ListTile(
                onTap: () {
                  context.pushNamed(
                    TodoDetailPage.routeName,
                    pathParameters: {
                      TodoDetailPage.kTodoIdParam: '${todoItem.id}',
                    },
                  );
                },
                title: Text(
                  todoItem.title,
                  style: TextStyle(
                    decoration: todoItem.completed
                        ? TextDecoration.lineThrough
                        : TextDecoration.none,
                  ),
                ),
                trailing: Checkbox(
                  onChanged: (value) {},
                  value: todoItem.completed,
                ),
              );
            },
            itemCount: todoList!.length,
          );
        },
      ),
    );
  }
}
