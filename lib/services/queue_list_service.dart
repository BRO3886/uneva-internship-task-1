import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:uneva_internship_task/models/queue_list.dart';

Future<List<QueueList>> getQueueList() async{
  String url = "https://dev.uneva.in/task_721/list.php";
  try{
    final response = await http.get(url);
    if(response.statusCode==200){
      print("got response");
      final data = queueListFromJson(response.body);
      print(data);
      print("got data");
      return data;
    }

  }catch(e){
    print("--EXCEPTION--");
    print(e);
  }
}