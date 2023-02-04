import 'package:flutter/material.dart';
import 'package:going_dutch/screen/dutch_list.dart';
import 'package:flutter/cupertino.dart';

class DutchPage extends StatefulWidget {
  const DutchPage({Key? key}) : super(key: key);

  @override
  State<DutchPage> createState() => _DutchPageState();
}

class _DutchPageState extends State<DutchPage> {
  String? year;
  String? month;
  String? day;
  String selectedDay = '';

  @override
  Widget build(BuildContext context) {
    final DateTime now = DateTime.now();

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            height: 8.0,
          ),
          Row(

            children: [
              IconButton(
                onPressed: onCalendarPressed,
                icon: Image.asset('assets/icons/calendar.png',width: 25.0,height: 25.0,),
              ),
              SizedBox(
                width: 8.0,
              ),
              selectedDay == ''
                  ? Text('날짜선택 Click',style: TextStyle(fontSize: 18.0),)
                  : Text(
                      selectedDay!,
                      style: TextStyle(fontSize: 20.0),
                    ),
            ],
          ),
          SizedBox(
            height: 16.0,
          ),
          Expanded(
            child: DutchList(),
          ),
          ElevatedButton(
            onPressed: () {},
            child: Text('Go Dutch'),
          ),
        ],
      ),
    );
  }

  onCalendarPressed() {
    showCupertinoDialog(
        barrierDismissible: true,
        context: context,
        builder: (BuildContext context) {
          return Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              color: Colors.white,
              height: 300.0,
              child: CupertinoDatePicker(
                mode: CupertinoDatePickerMode.date,
                onDateTimeChanged: (DateTime value) {
                  setState(() {
                    year = value.year.toString();
                    month = value.month.toString();
                    day = value.day.toString();
                    selectedDay = '${year}. ${month}. ${day}.';
                    print(selectedDay);
                  });
                },
              ),
            ),
          );
        });
  }

}
