import 'package:flutter/material.dart';
import 'package:template_flutter/dashboard/exam1.dart';
import 'package:template_flutter/dashboard/exam2.dart';
import 'package:template_flutter/dashboard/exam3.dart';

List<BottomNavigationBarItem> _items = [
  BottomNavigationBarItem(
    icon: Icon(Icons.home),
    activeIcon: Icon(
      Icons.check,
      color: Colors.blue,
    ),
    label: 'Home',
  ),
  BottomNavigationBarItem(
    icon: Icon(Icons.text_snippet),
    activeIcon: Icon(
      Icons.check,
      color: Colors.blue,
    ),
    label: 'Exam2',
  ),
  BottomNavigationBarItem(
    icon: Icon(Icons.text_snippet),
    activeIcon: Icon(
      Icons.check,
      color: Colors.blue,
    ),
    label: 'Exam3',
  ),
  BottomNavigationBarItem(
    icon: Icon(Icons.text_snippet),
    activeIcon: Icon(
      Icons.check,
      color: Colors.blue,
    ),
    label: 'Exam4',
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
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: selectTab(),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 56,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: _items.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          _currentIndex = index;
                        });
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width / 4,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            _currentIndex == index
                                ? _items[index].activeIcon
                                : _items[index].icon,
                            Text(
                              _items[index].label.toString(),
                              style: TextStyle(
                                fontSize: 12.0,
                                color: _currentIndex == index
                                    ? Colors.blue
                                    : Colors.grey,
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
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
      default:
        return Exam1();
    }
  }
}
