import 'package:flutter/material.dart';
import 'package:going_dutch/screen/main_list.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Going Dutch'),
        backgroundColor: Color(0xFF9966FF),
        leading: Icon(Icons.menu),
        actions: [
          Text('정산',textAlign: TextAlign.center,),
        ],
      ),
      body: BodyPage(),

    );
  }
}
