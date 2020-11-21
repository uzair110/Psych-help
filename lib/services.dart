import 'dart:convert';
import 'package:http/http.dart' as http;
import 'main.dart';

class App_services {
  static const ROOT = 'http://psychsearch12.000webhostapp.com';
  // This function validates username and password at login screen
  static Future<String> valEmployee(String un, String pw) async {
    try {
      var map = Map<String, dynamic>();
      map['action'] = 'VALIDATE_EMP';
      map['Username'] = un;
      map['Password'] = pw;
      print(map);
      final response = await http.post(ROOT, body: map);
      print('valEmployee Response: ${response.body}');
      print(response.statusCode);
      if (200 == response.statusCode) {
        return response.body;
      } else {
        return "error1";
      }
    } catch (e) {
      print(e);
      return "Failure";
    }
  }

  // This function validates username field while logging an issue on behalf of employee
  static Future<String> valEmployeeId(String un) async {
    try {
      var map = Map<String, dynamic>();
      map['action'] = 'VALIDATE_EMP_ID';
      map['Employee_ID'] = un;
      final response = await http.post(ROOT, body: map);
      print('valEmployeeId Response: ${response.body}');
      if (200 == response.statusCode) {
        return response.body;
      } else {
        return "error1";
      }
    } catch (e) {
      return "Failure";
    }
  }
}
