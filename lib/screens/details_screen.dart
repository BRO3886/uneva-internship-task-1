import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:uneva_internship_task/models/person_details.dart';
import 'package:uneva_internship_task/services/person_details_service.dart';
import 'package:uneva_internship_task/utils.dart';

class PersonDetailsScreen extends StatelessWidget {
  final int pid;
  PersonDetailsScreen(this.pid);
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getPersonDetails(pid),
      builder: (ctx, snapshot) {
        if (snapshot.hasData) {
          PersonDetails details = snapshot.data;
          return Scaffold(
            appBar: AppBar(
              title: Text('${details.personFullName}'),
              actions: <Widget>[
                IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () {},
                )
              ],
            ),
            body: SingleChildScrollView(
              child: Align(
                alignment: Alignment.center,
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 20,
                    ),
                    // Text('${details.personPid}')
                    (details.personPic != null)
                        ? Image(image:CachedNetworkImageProvider(details.personPic), height: 150,)
                        : Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.grey,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Icon(
                                Icons.person,
                                size: 100,
                                color: Colors.white,
                              ),
                            ),
                          ),
                    SizedBox(
                      height: 40,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      alignment: Alignment.centerLeft,
                      child: Table(
                        children: [
                          TableRow(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text('PID', style: detailTxt),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text('$pid',style: detailTxt),
                              ),
                            ],
                          ),
                          TableRow(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text('Name',style: detailTxt),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text('${details.personFullName},',style: detailTxt),
                              ),
                            ],
                          ),
                          TableRow(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text('Gender',style: detailTxt),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text('${details.personGender}',style: detailTxt),
                              ),
                            ],
                          ),
                          TableRow(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text('Age',style: detailTxt),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text('${details.personAge},',style: detailTxt),
                              ),
                            ],
                          ),
                          TableRow(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text('Phone',style: detailTxt),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text('${details.personPhone}',style: detailTxt),
                              ),
                            ],
                          ),
                          TableRow(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text('Relation',style: detailTxt),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text('${details.personRelation}',style: detailTxt),
                              ),
                            ],
                          ),
                          TableRow(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text('Address',style: detailTxt),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text('${details.personAddress}',style: detailTxt),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }
        return Scaffold(
          appBar: AppBar(
            title: Text('Loading...'),
          ),
          body: Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}

// Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: <Widget>[
//                           Text('PID  $pid'),
//                           SizedBox(
//                             height: 5,
//                           ),
//                           Text('Name  ${details.personFullName}'),
//                           SizedBox(
//                             height: 5,
//                           ),
//                           Text('Gender  ${details.personGender}'),
//                           SizedBox(
//                             height: 5,
//                           ),
//                           Text('Age  ${details.personAge}'),
//                           SizedBox(
//                             height: 5,
//                           ),
//                           Text('Phone  ${details.personPhone}'),
//                           SizedBox(
//                             height: 5,
//                           ),
//                           Text('${details.personRelation.toUpperCase()}'),
//                           SizedBox(
//                             height: 5,
//                           ),
//                           Text('Address ${details.personAddress}'),
//                         ],
//                       ),
