import 'package:flutter/material.dart';
import 'package:going_dutch/screen/dutch_list.dart';

class Dutch_page extends StatelessWidget {
  const Dutch_page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: 16.0,),
          Text('DatePicker'),
          SizedBox(height: 16.0,),
          Expanded(child: DutchList()),
          ElevatedButton(onPressed: (){}, child: Text('Go Dutch'),),
        ],
      ),
    );
  }
}
