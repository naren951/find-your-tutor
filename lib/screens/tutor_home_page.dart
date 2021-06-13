import 'package:find_your_tutor/model/tutor/doubts.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:find_your_tutor/model/tutor/response.dart';
class TutorHomePage extends StatefulWidget {
  const TutorHomePage({Key? key}) : super(key: key);

  @override
  _TutorHomePageState createState() => _TutorHomePageState();
}

class _TutorHomePageState extends State<TutorHomePage> {
  int _selectedIndex=0;
  int _currentIndex=1;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      if (_selectedIndex == 1) {
_currentIndex=1;
      } else {
        _currentIndex=0;
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _selectedIndex==0?Doubts():Response(),
      appBar: AppBar(
        title: Center(child: Text("Tutor")),
      ),
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
            icon: Icon(
              FontAwesomeIcons.commentAlt,
            ),
            label: 'Response',
            //backgroundColor: Colors.teal,
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber,
        selectedFontSize: 20,
        unselectedItemColor: Colors.white,
        onTap: _onItemTapped,
      ),
    );
  }
}
