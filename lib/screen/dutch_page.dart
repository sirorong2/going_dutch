import 'package:flutter/material.dart';
import 'package:going_dutch/screen/dutch_list.dart';
import 'package:flutter/cupertino.dart';

class DutchPage extends StatefulWidget {
  const DutchPage({Key? key}) : super(key: key);

  @override
  State<DutchPage> createState() => _DutchPageState();
}

class _DutchPageState extends State<DutchPage> {
  @override
  Widget build(BuildContext context) {
    DateTime selectedDate = DateTime(
      DateTime.now().year,
      DateTime.now().month,
      DateTime.now().day,
    );

    String? datePickerDate;
    final DateTime now = DateTime.now();

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            height: 16.0,
          ),
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  showCupertinoDialog(
                    context: context,
                    barrierDismissible: true,
                    builder: (BuildContext context) {
                      return Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          color: Colors.white,
                          height: 200.0,
                          child: CupertinoDatePicker(
                            mode: CupertinoDatePickerMode.date,
                            initialDateTime: selectedDate,
                            onDateTimeChanged: (DateTime date) async {
                              setState(() {
                                print('datePickerDate = $datePickerDate');
                                selectedDate = date;
                                print('selectedDate = $selectedDate');
                                datePickerDate =
                                    '${selectedDate.year} ${selectedDate.month} ${selectedDate.day}';
                                print('datePickerDate = $datePickerDate');
                              });
                            },
                          ),
                        ),
                      );
                    },
                  );
                },
                child: Row(
                  children: [
                    Container(
                      child: Image.asset(
                        'assets/icons/calendar.png',
                        width: 25.0,
                        height: 25.0,
                      ),
                    ),
                    SizedBox(
                      width: 8.0,
                    ),
                    datePickerDate == null
                        ? Text('날짜선택 Click')
                        : Text(datePickerDate),
                  ],
                ),
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
}
