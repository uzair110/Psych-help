import 'package:http/http.dart' as http;
import 'package:psych_help/Mapper.dart';
import 'dart:convert';

class AppServices {
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

//Sign-In Function which validates username and password from the Database and also fetches user type for redirecting user to the appropriate screen
  static Future<UserIds> signInPromise(String un, String pw) async {
    try {
      var map = Map<String, dynamic>();
      map['action'] = 'SIGN_IN';
      map['Username'] = un;
      map['Password'] = pw;
      final response = await http.post(ROOT, body: map);
      if (200 == response.statusCode) {
        UserIds promiseResult = UserIds.fromData(jsonDecode(response.body));
        return promiseResult;
      } else {
        UserIds errResult =
            UserIds(result: "Conn Failure", aid: "NULL", userType: "NULL");
        return errResult;
      }
    } catch (e) {
      print(e);
      UserIds errResult =
          UserIds(result: "Auth Failure", aid: "NULL", userType: "NULL");
      return errResult;
    }
  }

//Function which fetches data for user before initializing their homepage after login
  static Future<UserData> userDatPromise(String aid) async {
    try {
      var map = Map<String, dynamic>();
      map['action'] = 'SIGN_IN';
      map['aid'] = aid;
      final response = await http.post(ROOT, body: map);
      print('sign in Response: ${response.body}');
      print(response.statusCode);
      if (200 == response.statusCode) {
        UserData promiseResult = UserData.fromData(jsonDecode(response.body));
        return promiseResult;
      } else {
        UserData errResult = UserData(result: "Conn Failure");
        return errResult;
      }
    } catch (e) {
      print(e);
      UserData errResult = UserData(result: "Auth Failure");
      return errResult;
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

      map1['action'] = 'Add_User';
      map1['First_Name'] = username;
      map1['Last_Name'] = 'No Last Name Selected';
      map1['Blacklist'] = 'false';
      map1['City'] = 'No City Selected';
      //var aid = '';
      final response = await http.post(ROOT, body: map);
      if (200 == response.statusCode) {
        print(response.body);
        return response.body;
      } else {
        return "error1";
      }
      // final response1 = await http.post(ROOT, body: map1);
      // if (200 == response1.statusCode) {
      //   return response1.body;
      // } else {
      //   return "error2";
      // }
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

      map1['action'] = 'ADD_PSYCH';
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
