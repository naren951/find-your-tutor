import 'package:flutter/material.dart';

class DoubtCard extends StatefulWidget {
  final String title,name,description;
  DoubtCard({required this.title,required this.name, required this.description});

  @override
  _DoubtCardState createState() => _DoubtCardState();
}

class _DoubtCardState extends State<DoubtCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          color: Colors.grey,
        ),

        child: Column(
          children: [
            Text(widget.name),
            Text(widget.title),
            Text(widget.description),
          ],
        ),
      ),
    );
  }
}
