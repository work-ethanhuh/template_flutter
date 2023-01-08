import 'package:flutter/material.dart';

// ignore: use_key_in_widget_constructors
class DashBoard extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return DashBoardState();
  }
}

class DashBoardState extends State<DashBoard> with TickerProviderStateMixin {
  var _currentIndex = 0;
  late TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 7, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return Future.value(false);
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('DashBoard'),
        ),
        body: Container(),
        bottomNavigationBar: TabBar(
          indicatorColor: Colors.blue,
          labelColor: Colors.blue,
          unselectedLabelColor: Colors.grey,
          controller: _tabController,
          isScrollable: true,
          onTap: (v) {
            setState(() {
              _currentIndex = v;
            });
            
            print(_currentIndex);
          },
          tabs: [
            Tab(
              icon: Icon(Icons.abc),
              
            ),
            Tab(
              icon: Icon(Icons.abc),
            ),
            Tab(
              icon: Icon(Icons.abc),
            ),
            Tab(
              icon: Icon(Icons.abc),
            ),
            Tab(
              icon: Icon(Icons.abc),
            ),
            Tab(
              icon: Icon(Icons.abc),
            ),
            Tab(
              icon: Icon(Icons.abc),
            ),
          ],
        ),
        // BottomNavigationBar(
        //   currentIndex: _currentIndex,
        //   selectedItemColor: Colors.blue,
        //   onTap: (v) {
        //     setState(() {
        //       _currentIndex = v;
        //     });
        //   },
        //   // ignore: prefer_const_literals_to_create_immutables
        //   items: [
        //     const BottomNavigationBarItem(
        //         icon: Icon(
        //           Icons.abc,
        //         ),
        //         label: 'Exam1'),
        //     const BottomNavigationBarItem(
        //         icon: Icon(
        //           Icons.abc,
        //         ),
        //         label: 'Exam2'),
        //     const BottomNavigationBarItem(
        //         icon: Icon(
        //           Icons.abc,
        //         ),
        //         label: 'Exam3'),
        //     const BottomNavigationBarItem(
        //         icon: Icon(
        //           Icons.abc,
        //         ),
        //         label: 'Exam4'
        //     ),

        //   ],
        // ),
      ),
    );
  }
}
