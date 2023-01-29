import 'package:flutter/material.dart';

class DutchList extends StatefulWidget {
  const DutchList({Key? key}) : super(key: key);

  @override
  State<DutchList> createState() => _DutchListState();
}

class _DutchListState extends State<DutchList> {

  @override
  Widget build(BuildContext context) {
    int itemMaxCount = 3;
    return ListView.builder(
      itemBuilder: (context, index) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _DutchItemCard(

            ),
            if (index == itemMaxCount - 1) Text('합계'),
            if (index == itemMaxCount - 1)
              ElevatedButton(
                onPressed: () {},
                child: Text('항목추가'),
              ),
          ],
        );
      },
      itemCount: itemMaxCount,
    );
  }


}

class _DutchItemCard extends StatefulWidget {

  const _DutchItemCard({Key? key,}) : super(key: key);

  @override
  State<_DutchItemCard> createState() => _DutchItemCardState();
}

class _DutchItemCardState extends State<_DutchItemCard> {
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
            Text('금액'),
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
                    SizedBox(width: 8.0,),
                    Text('1',style: TextStyle(fontSize: 20.0),),
                  ],
                ),
                Container(
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: (){

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
                      Image.asset(
                        "assets/icons/minus.png",
                        width: 20.0,
                        height: 20.0,
                      ),
                      SizedBox(
                        width: 8.0,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Divider(
              thickness: 1,
              color: Colors.grey,
            ),
            TextField(
              style: TextStyle(fontSize: 20.0),
              decoration: InputDecoration(
                border: InputBorder.none,
                isCollapsed: true,
                label: Text(
                  '장소',
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


