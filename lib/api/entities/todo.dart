import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:built_collection/built_collection.dart';

part 'todo.g.dart';

abstract class Todo implements Built<Todo, TodoBuilder> {
  static Serializer<Todo> get serializer => _$TodoSerializer;

  int get id;

  @nullable
  int get age;

  @nullable
  @BuiltValueField(wireName: 'first_name')
  String get firstName;

  @nullable
  BuiltList<String> get hobbies;

  Todo._();
  factory Todo([void Function(TodoBuilder) updates]) = _$Todo;
}
