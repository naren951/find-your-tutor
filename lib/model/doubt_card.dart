import 'package:flutter/material.dart';

class DoubtCard extends StatefulWidget {
  const DoubtCard({Key? key}) : super(key: key);

  @override
  _DoubtCardState createState() => _DoubtCardState();
}

class _DoubtCardState extends State<DoubtCard> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("Title"),
        Text("description"),
      ],
    );
  }
}
