import 'package:book_mom/models/book.dart';
import 'package:book_mom/pages/stateful/document.dart';
import 'package:book_mom/pages/stateful/month.dart';
import 'package:book_mom/pages/stateful/setting.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'boxes.dart';
import 'package:book_mom/models/document.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  
  Hive.registerAdapter(BookAdapter());

  await Hive.openBox<Book>("book");
  await Hive.openBox<Document>("document");
  runApp(const BookApp());
}

class BookApp extends StatelessWidget {
  const BookApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Book",
      home: BookAppContent(),
    );
  }

}

class BookAppContent extends StatefulWidget {
  const BookAppContent({Key? key}) : super(key: key);

  @override
  State<BookAppContent> createState() => BookAppContentState();
}

class BookAppContentState extends State<BookAppContent> {
  int selectedPage = 0;
  List<Widget> pages = [const DocumentPage(), const MonthPage(), const SettingPage()];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  void dispose() {
    Hive.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Book"),
      ),
      body: pages[selectedPage],
      bottomNavigationBar: BottomNavigationBar(items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(icon: Icon(Icons.notes), label: "Documents"),
        BottomNavigationBarItem(icon: Icon(Icons.calendar_month), label: "Month"),
        BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Settings"),
      ],
      onTap: (value) {
        setState(() {
          selectedPage = value;
        });
      },
      currentIndex: selectedPage,
      ),
      floatingActionButton: FloatingActionButton(child: const Icon(Icons.add), onPressed: () {},),
    );
  }

}