import 'package:flutter/material.dart';
import 'package:going_dutch/screen/dutch_page.dart';
import 'package:going_dutch/screen/list_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.menu),
        title: Text('Going Dtuch ${_selectedIndex}'),
        actions: const [
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Icon(Icons.settings),
          ),
        ],
      ),

      body: Center(
        child: DutchPage(),
      ),
      //floatingActionButton: FloatingActionButton(onPressed: (){},child: Icon(Icons.add,)),
      
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: Image.asset(
                "assets/icons/money-transfer.png",
                width: 30.0,
                height: 30.0,
              ),
              label: 'Dutch'),
          BottomNavigationBarItem(
            icon: Image.asset(
              "assets/icons/list.png",
              width: 30.0,
              height: 30.0,
            ),
            label: 'List',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _bottomNavigationBarTapped,

      ),
    );
  }

  void _bottomNavigationBarTapped(int index){
    setState(() {
      _selectedIndex = index;
    });
  }

  List _SelectedPage = [
    DutchPage(),
    ListPage(),
  ];
}
