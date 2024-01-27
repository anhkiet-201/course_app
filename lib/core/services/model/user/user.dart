import 'package:hive_flutter/hive_flutter.dart';

part 'user.g.dart';

@HiveType(typeId: 0)
class User {
  @HiveField(0)
  String? email;

  @HiveField(1)
  String? name;

  @HiveField(2)
  String? picture;

  User({this.email, this.name, this.picture});
}
