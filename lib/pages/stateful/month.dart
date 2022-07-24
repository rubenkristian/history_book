import 'package:flutter/material.dart';

class MonthPage extends StatefulWidget {
  const MonthPage({Key? key}) : super(key: key);

  @override
  MonthPageState createState() => MonthPageState();

}

class MonthPageState extends State<MonthPage> {
  List<String> monthList = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"];
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      child: GridView.builder(gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2), itemCount: monthList.length, itemBuilder: (context, index) {
        return Container(
          child: Card(
            child: InkWell(
              onTap: () {},
              child: Center(child: Text(monthList[index])),
            ),
          ),
        );
      }),
    );
  }

}