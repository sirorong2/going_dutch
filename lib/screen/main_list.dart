import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BodyPage extends StatefulWidget {
  const BodyPage({Key? key}) : super(key: key);

  @override
  State<BodyPage> createState() => _BodyPageState();
}

class _BodyPageState extends State<BodyPage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          TextField(
            decoration: InputDecoration(
              hintText: '2023.1.00.(수)',
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(
            height: 16.0,
          ),
          _DutchItem(),
          Text('합계'),
        ],
      ),
    );
  }
}

class _DutchItem extends StatelessWidget {
  const _DutchItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('장소',),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              child: Row(
                children: [
                  Text('참석자수'),
                  SizedBox(width: 2.0,),
                  Text('1'),
                ],
              ),
            ),
            Container(
              child: Row(
                children: [
                  Icon(
                    CupertinoIcons.plus_circle,
                  ),
                  Icon(
                    CupertinoIcons.minus_circle,
                  ),
                ],
              ),
            )
          ],
        ),
        Row(
          children: [
            Text('금액'),
          ],
        ),
        Text('항목추가'),
      ],
    );
  }
}

