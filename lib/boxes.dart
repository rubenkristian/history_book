import 'package:book_mom/models/book.dart';
import 'package:hive/hive.dart';

class Boxes {
  static Box<Book> getBook() =>
      Hive.box<Book>('book');
}
