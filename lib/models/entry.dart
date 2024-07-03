import 'package:hive/hive.dart';
part 'entry.g.dart';

@HiveType(typeId: 1)
class Entry extends HiveObject {

  @HiveField(0)
  String id;

  @HiveField(1)
  int amount;

  @HiveField(2)
  String type;

  @HiveField(3)
  String description;

  @HiveField(4)
  DateTime time;

  Entry({
    required this.id,
    required this.amount,
    required this.type,
    required this.description,
    required this.time,
  });
}
