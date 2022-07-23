import 'package:book_mom/models/book.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'boxes.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  
  Hive.registerAdapter(BookAdapter());

  await Hive.openBox<Book>("book");
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
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Boxes.getBook().add(Book(cashIn: "Cashin", cashOut: "Cashout", date: "date"));
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
        actions: [
          IconButton(onPressed: () {
            // Navigator.push(context, MaterialPageRoute(builder: (context) => const InputDetail()));
          }, icon: const Icon(Icons.add))
        ],
      ),
      body: Container(
        padding: const EdgeInsets.fromLTRB(6, 12, 6, 12),
        child: ValueListenableBuilder(
          valueListenable: Boxes.getBook().listenable(),
          builder: (context, Box box, widget) {
            if (box.isEmpty) {
              return const Center(child: Text("Empty"),);
            } else {
              return ListView.builder(
                itemCount: box.length,
                itemBuilder: (context, index) {
                  var currentBox = box;
                  var bookData = currentBox.getAt(index);

                  return InkWell(
                    onTap: () {

                    },
                    child: ListTile(
                      title: Text(bookData.date),
                      subtitle: Text(bookData.cashOut),
                    ),
                  );
                },
              );
            }
          },
        ),
      )
    );
  }

}

// class BookDetailContent extends StatefulWidget {
//   const BookDetailContent({Key? key}) : super(key: key);

//   @override
//   BookDetailContentState createState() => BookDetailContentState();
// }

// class BookDetailContentState extends State<BookDetailContent> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text("Detail"), ),
//       body: Center(child: SelectableText("Detail")),
//     );
//   }
// }

// class InputDetail extends StatefulWidget {
//   const InputDetail({Key? key}) : super(key: key);

//   @override
//   InputDetailState createState() => InputDetailState();
// }

// class InputDetailState extends State<InputDetail> {
//   String inCash = "";
//   String outCash = "";
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Input"),
//       ),
//       body: Container(
//         padding: const EdgeInsets.all(6),
//         child: Center(
//           child: Column(
//             children: [
//               TextField(
//                 onChanged: (value) {
//                   setState(() {
//                     inCash = value;
//                     setState(() {
                      
//                     });
//                   });
//                 },
//               ),
//               const SizedBox(height: 10.0,),
//               TextField(
//                 onChanged: (value) {
//                   setState(() {
//                     outCash = value;
//                     setState(() {
                      
//                     });
//                   });
//                 },
//               ),
//               const SizedBox(height: 10.0,),
//               ElevatedButton(
//                 child: const Text("Save"),
//                 onPressed: () {

//               }, style: ElevatedButton.styleFrom(
//                         padding: EdgeInsets.symmetric(
//                             horizontal: 40.0, vertical: 20.0),
//                         shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(10.0)),
//                       primary: Colors.purple),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }