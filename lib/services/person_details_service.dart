import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:uneva_internship_task/models/person_details.dart';

Future<PersonDetails> getPersonDetails(int id) async{
  String url = "https://dev.uneva.in/task_721/patient.php?id=$id";
  try{
    final response = await http.get(url);
    if(response.statusCode==200){
      print("got response");
      final data = personDetailsFromJson(response.body);
      print(data);
      print("got data");
      return data;
    }
  }catch(e){
    print("--EXCEPTION--");
    print(e);
  }
}