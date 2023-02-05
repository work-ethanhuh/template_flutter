import 'package:flutter/material.dart';
import 'package:template_flutter/dashboard/exam1.dart';
import 'package:template_flutter/dashboard/exam2.dart';
import 'package:template_flutter/dashboard/exam3.dart';

var _items = [
  const BottomNavigationBarItem(
    icon: Icon(Icons.home),
    label: 'Exam1',
  ),
  const BottomNavigationBarItem(
    icon: Icon(Icons.text_snippet),
    label: 'Exam2',
  ),
  const BottomNavigationBarItem(
    icon: Icon(Icons.people),
    label: 'Exam3',
  ),
];

// ignore: use_key_in_widget_constructors
class DashBoard extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return DashBoardState();
  }
}

class DashBoardState extends State<DashBoard> with TickerProviderStateMixin {
  var _currentIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return Future.value(false);
      },
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text('Exam ${_currentIndex + 1}'),
          actions: [],
        ),
        body: selectTab(),
        bottomNavigationBar: BottomNavigationBar(
          items: _items,
          onTap: (v) {
            setState(() {
              _currentIndex = v;
            });
          },
          currentIndex: _currentIndex,
          selectedItemColor: Colors.blue,
        ),
      ),
    );
  }

  selectTab() {
    switch (_currentIndex) {
      case 0:
        {
          return Exam1();
        }
      case 1:
        {
          return Exam2();
        }
      case 2:
        {
          return Exam3();
        }
    }
  }
}
