import 'package:book_mom/models/book.dart';
import 'package:book_mom/models/document.dart';
import 'package:hive/hive.dart';

class Boxes {
  static Box<Book> getBook() =>
      Hive.box<Book>('book');

  static Box<Document> getDocument() => Hive.box<Document>('document');
}
