import 'package:built_value/serializer.dart';

import 'index.dart';

part 'serializers.g.dart';

@SerializersFor([
  Todo,
])
final Serializers serializers = _$serializers;
