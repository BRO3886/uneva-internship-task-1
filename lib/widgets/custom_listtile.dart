import 'package:flutter/material.dart';
import 'package:uneva_internship_task/models/queue_list.dart';
import 'package:uneva_internship_task/screens/details_screen.dart';
import 'package:uneva_internship_task/widgets/small_circle.dart';

import 'datetime_widget.dart';

class CustomListTile extends StatelessWidget {
  final QueueList queueList;
  final DateTime datetime;
  CustomListTile(this.queueList, this.datetime);
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: InkWell(
        splashColor: Colors.grey[100],
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (ctx) => PersonDetailsScreen(queueList.other.pid)));
        },
        child: Stack(
          children: <Widget>[
            Container(
              // decoration: BoxDecoration(color: Colors.white),
              child: ListTile(
                contentPadding:
                    EdgeInsets.only(right: 32, left: 8, top: 8, bottom: 8),
                leading: Text(
                  queueList.tokenName,
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 25,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                title: Text(queueList.name),
                subtitle: Text(queueList.description),
                // contentPadding: EdgeInsets.all(20),
                isThreeLine: true,
              ),
            ),
            Positioned(
              right: 2,
              top: 8,
              child: PopupMenuButton(
                itemBuilder: (ctx) {
                  return [
                    PopupMenuItem(
                      child: Text('option 1'),
                    ),
                    PopupMenuItem(
                      child: Text('option 2'),
                    ),
                  ];
                },
              ),
            ),
            Positioned(
              right: 2,
              bottom: 30,
              child: Container(
                // width: MediaQuery.of(context).size.width * 0.4,
                child: Row(
                  children: <Widget>[
                    DateTimeWidget(datetime),
                    SizedBox(
                      width: 20,
                    ),
                    (queueList.status == 0)
                        ? SmallCircle(Colors.red)
                        : SmallCircle(Colors.green),
                    SizedBox(
                      width: 14,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
