import 'package:built_collection/built_collection.dart';

import '../../lib_wrappers/index.dart';

class TodoApi {
  final NetworkAccess access;

  TodoApi({required this.access});

  Future<BuiltList<dynamic>> getTodoList() async {
    final response = await access.fetch('todos');
    return BuiltList.from(response.data);
  }

  Future<dynamic> getTodoItem({
    required String todoId,
  }) async {
    final response = await access.fetch('todos/$todoId');
    return response.data;
  }
}
