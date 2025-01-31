import 'package:flutter/material.dart';

class Headingtitle extends StatelessWidget {
  final String title;
  const Headingtitle({super.key,required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.only(bottom: 20.0),
      padding: EdgeInsets.only(bottom: 5.0),
      decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.grey,width: 0.3))),
      child: Text(
        title,
        style: TextStyle(color: Colors.white, fontSize: 25.0),
      ),
    );
  }
}
