import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DocumentPage extends StatefulWidget {
  const DocumentPage({Key? key}) : super(key: key);

  @override
  DocumentPageState createState() => DocumentPageState();

}

class DocumentPageState extends State<DocumentPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      child: GridView.builder(gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2), itemBuilder: (context, index) {
        return Container(
          child: Card(
            child: Center(child: Text("Text")),
          ),
        );
      }),
    );
  }

}