import 'package:hive/hive.dart';
part 'document.g.dart';

@HiveType(typeId: 1)
class Document {
  Document({ required this.title, required this.dateCreated, required this.dateUpdated, required this.color});

  @HiveField(0)
  String title;

  @HiveField(1)
  DateTime dateCreated;

  @HiveField(2)
  DateTime dateUpdated;

  @HiveField(3)
  String color;
}