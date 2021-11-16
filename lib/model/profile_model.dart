import "package:hive/hive.dart";

part 'profile_model.g.dart';

@HiveType(typeId: 1)
class Profile {
  @HiveField(0)
  late final String name;
  @HiveField(1)
  late final String desc;
  @HiveField(2)
  late final bool isComplete;
  @HiveField(3)
  late final DateTime isDate;
  Profile({
    required this.name,
    required this.desc,
    required this.isComplete,
    required this.isDate,
  });
}

// flutter packages pub run build_runner build
