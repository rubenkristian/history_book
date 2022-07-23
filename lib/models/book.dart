import 'package:hive/hive.dart';
part 'book.g.dart';

@HiveType(typeId: 1)
class Book {
  Book({ required this.date, required this.cashIn, required this.cashOut});

  @HiveField(0)
  String date;

  @HiveField(1)
  String cashIn;

  @HiveField(2)
  String cashOut;
}