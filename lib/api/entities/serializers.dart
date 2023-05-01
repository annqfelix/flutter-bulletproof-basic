import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';
import 'package:flutter/foundation.dart';

import 'index.dart';

part 'serializers.g.dart';

@SerializersFor([
  Todo,
])
final Serializers serializers = _$serializers;

BuiltList<T> deserializeBuiltList<T extends Object>(Object json) {
  try {
    final listOfDynamic = serializers.deserialize(
      json,
      specifiedType: FullType(BuiltList, [FullType(T)]),
    )! as BuiltList<dynamic>;
    return listOfDynamic.cast<T>().toBuiltList();
  } on DeserializationError catch (e) {
    debugPrint(
        '>>>>> Try to add specified type, eg: deserializeBuiltList<MyModel>(json) $e');
    rethrow;
  }
}
