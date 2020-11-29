import 'package:http/http.dart' as http;
import 'package:psych_help/globals.dart';

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

  static Future<String> signup(String username, String password) async {
    try {
      var map = Map<String, dynamic>();
      var map1 = Map<String, dynamic>();
      map['action'] = 'SIGN_UP';
      map['Username'] = username;
      map['Password'] = password;
      map['User_type'] = 'User';

      map1['action'] = 'SIGN_UP';
      map1['First_Name'] = username;
      map1['Last_Name'] = 'No Last Name Selected';
      map1['Blacklist'] = false;
      map1['City'] = 'No City Selected';
      var aid = '';
      final response = await http.post(ROOT, body: map);
      if (200 == response.statusCode) {
        aid = response.body;
        map1['AID'] = aid;
      } else {
        return "error1";
      }
      final response1 = await http.post(ROOT, body: map1);
      if (200 == response1.statusCode) {
        return response1.body;
      } else {
        return "error2";
      }
    } catch (e) {
      print(e);
      return "Failure";
    }
  }

  static Future<String> editProfile(
      String firstName,
      String lastName,
      String username,
      String password,
      String city,
      String uid,
      String aid) async {
    try {
      var map1 = Map<String, dynamic>();

      map1['action'] = 'EDIT_PROFILE';
      map1['First_Name'] = firstName;
      map1['Last_Name'] = lastName;
      map1['Username'] = username;
      map1['Password'] = password;
      map1['City'] = city;
      map1['AID'] = aid;
      map1['UID'] = uid;

      final response = await http.post(ROOT, body: map1);
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

  static Future<String> psychList(String aid) async {
    try {
      var map1 = Map<String, dynamic>();
      map1['AID'] = aid;

      final response = await http.post(ROOT, body: map1);
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

  static Future<String> psychDel(String pid) async {
    try {
      var map1 = Map<String, dynamic>();
      map1['PID'] = pid;

      final response = await http.post(ROOT, body: map1);
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

  static Future<String> psychAdd(
    String firstName,
    String lastName,
    String phoneNumber,
    String email,
    String address,
    String counsellingType,
    String city,
  ) async {
    try {
      var map1 = Map<String, dynamic>();

      map1['action'] = 'EDIT_PROFILE';
      map1['First_Name'] = firstName;
      map1['Last_Name'] = lastName;
      map1['Phone_Number'] = phoneNumber;
      map1['email'] = email;
      map1['Address'] = address;
      map1['Counselling_Type'] = counsellingType;
      map1['City'] = city;

      final response = await http.post(ROOT, body: map1);
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

  static Future<String> psychEdit(
    String firstName,
    String lastName,
    String phoneNumber,
    String email,
    String address,
    String counsellingType,
    String city,
    String pid,
  ) async {
    try {
      var map1 = Map<String, dynamic>();

      map1['action'] = 'EDIT_PROFILE';
      map1['First_Name'] = firstName;
      map1['Last_Name'] = lastName;
      map1['Phone_Number'] = phoneNumber;
      map1['email'] = email;
      map1['Address'] = address;
      map1['Counselling_Type'] = counsellingType;
      map1['City'] = city;
      map1['PID'] = pid;

      final response = await http.post(ROOT, body: map1);
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
}
