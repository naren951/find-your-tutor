import 'package:find_your_tutor/model/Student/add_doubts.dart';
import 'package:find_your_tutor/model/student/doubts.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class StudentHomePage extends StatefulWidget {
  const StudentHomePage({Key? key}) : super(key: key);

  @override
  _StudentHomePageState createState() => _StudentHomePageState();
}

class _StudentHomePageState extends State<StudentHomePage> {
  int _selectedIndex = 0  ;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      if (_selectedIndex == 1) {

      } else {

      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Student"),
      ),
      body: _selectedIndex == 1 ? AddDoubts() : Doubts(),
      backgroundColor: Colors.blue,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.blue,
        elevation: 20,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.questionCircle),
            label: 'Doubts',
            //backgroundColor: Colors.red,
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.plusCircle),
            label: 'Post',
            //backgroundColor: Colors.teal,
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.meetup),
            label: 'Responses',
            //backgroundColor: Colors.red,
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber,
        selectedFontSize: 17,
        unselectedItemColor: Colors.white,
        onTap: _onItemTapped,
      ),
    );
  }
}
