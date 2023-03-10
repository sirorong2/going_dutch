import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:kpostal/kpostal.dart';

class DutchList extends StatefulWidget {
  const DutchList({Key? key}) : super(key: key);

  @override
  State<DutchList> createState() => _DutchListState();
}

class _DutchListState extends State<DutchList> {
  int attendance = 2;
  int itemMaxCount = 1;
  int sum = 0;

  @override
  Widget build(BuildContext context) {
    final formatCurrency =
        NumberFormat.simpleCurrency(locale: "ko_KR", decimalDigits: 0);

    return ListView.builder(
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      // 스크롤할 경우 키보드 dissmiss
      itemBuilder: (context, index) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _DutchItemCard(
              sumChanged: sumChange,
            ),
            SizedBox(
              height: 8.0,
            ),
            if (index == itemMaxCount - 1)
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(
                    height: 16.0,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(8.0)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '합계 $sum',
                            style: TextStyle(fontSize: 20.0),
                          ),
                          Text(
                            formatCurrency.format(sum),
                            style: TextStyle(fontSize: 20.0),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 8.0,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        itemMaxCount++;
                      });
                    },
                    child: Text('항목추가'),
                  ),
                ],
              ),
          ],
        );
      },
      itemCount: itemMaxCount,
    );
  }

  void sumChange(inputValue) {
    setState(() {
      int temp = int.parse(inputValue);
      sum += temp;
    });
  }
}

class _DutchItemCard extends StatefulWidget {
  final ValueChanged<String> sumChanged;

  const _DutchItemCard({
    Key? key,
    required this.sumChanged,
  }) : super(key: key);

  @override
  State<_DutchItemCard> createState() => _DutchItemCardState();
}

class _DutchItemCardState extends State<_DutchItemCard> {
  int attendance = 2;
  String postCode = '-';
  String address = '-';

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              textAlign: TextAlign.end,
              keyboardType: TextInputType.number,
              style: TextStyle(fontSize: 20.0),
              decoration: InputDecoration(
                border: InputBorder.none,
                isCollapsed: true,
                label: Text(
                  '금액',
                  style: TextStyle(fontSize: 20.0),
                ),
                suffixText: '원',
              ),
              onChanged: widget.sumChanged,
            ),
            Divider(
              thickness: 1,
              color: Colors.grey,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      '참석자수',
                      style: TextStyle(
                        fontSize: 20.0,
                      ),
                    ),
                    SizedBox(
                      width: 8.0,
                    ),
                    Text(
                      '$attendance',
                      style: TextStyle(fontSize: 20.0),
                    ),
                  ],
                ),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          attendance++;
                        });
                      },
                      child: Container(
                        child: Image.asset(
                          "assets/icons/plus.png",
                          width: 20.0,
                          height: 20.0,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 8.0,
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          if (attendance > 2) {
                            attendance--;
                          }
                        });
                      },
                      child: Container(
                        child: Image.asset(
                          "assets/icons/minus.png",
                          width: 20.0,
                          height: 20.0,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 8.0,
                    ),
                  ],
                ),
              ],
            ),
            Divider(
              thickness: 1,
              color: Colors.grey,
            ),
            TextField(
              onTap: () async {
                await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => KpostalView(
                      callback: (Kpostal result) {
                        setState(() {
                          this.postCode = result.postCode;
                          this.address = result.address;
                        });
                      },
                    ),
                  ),
                );
              },
              style: TextStyle(fontSize: 20.0),
              decoration: InputDecoration(
                border: InputBorder.none,
                isCollapsed: true,
                label: Text(
                  this.postCode == '-' || this.address == '-'
                      ? '장소'
                      : this.address,
                  style: TextStyle(fontSize: 20.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
