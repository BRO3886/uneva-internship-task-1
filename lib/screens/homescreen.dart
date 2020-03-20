import 'package:flutter/material.dart';
import 'package:uneva_internship_task/models/queue_list.dart';
import 'package:uneva_internship_task/services/queue_list_service.dart';
import 'package:uneva_internship_task/widgets/custom_listtile.dart';

class HomeScreen extends StatelessWidget {
  static const routename = "/home";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ECHO - All'),
      ),
      body: FutureBuilder(
        future: getQueueList(),
        builder: (ctx, snapshot) {
          if (snapshot.hasData) {
            List<QueueList> queueList = snapshot.data;
            queueList.sort((a, b) =>
                a.originalTokenNumber.compareTo(b.originalTokenNumber));
            int waiting = 0;
            int completed = 0;
            for (int i = 0; i < queueList.length; i++) {
              if (queueList[i].status == 0) {
                waiting++;
              } else if (queueList[i].status == 1) {
                completed++;
              }
            }
            return Container(
              height: MediaQuery.of(context).size.height,
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Text('Waiting : $waiting'),
                      Text('Completed : $completed'),
                      Text('Total : ${queueList.length}')
                    ],
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListView.builder(
                        // separatorBuilder: (ctx, index) => Divider(),
                        itemCount: queueList.length,
                        itemBuilder: (ctx, index) {
                          final datetime = DateTime.fromMicrosecondsSinceEpoch(
                              queueList[index].timestamp * 1000);
                          return Column(
                            children: <Widget>[
                              CustomListTile(queueList[index], datetime),
                              Container(
                                width: MediaQuery.of(context).size.width,
                                height: 2,
                                color: Colors.grey[200],                                
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
