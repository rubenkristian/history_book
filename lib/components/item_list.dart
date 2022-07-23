import 'package:flutter/cupertino.dart';

class ItemList extends StatelessWidget {
  final String date;
  final bool checked;
  const ItemList({Key? key, required this.date, required this.checked}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Text(date),
        ],
      ),
    );
  }
}