import 'dart:ffi';
import 'package:psych_help/globals.dart' as userFile;
import 'package:http/http.dart' as http;
import 'package:psych_help/Mapper.dart';
import 'dart:convert';

class AppServices {
  static const ROOT = 'http://psychsearch12.000webhostapp.com';

  // // This function validates username and password at login screen
  // static Future<String> valEmployee(String un, String pw) async {
  //   try {
  //     var map = Map<String, dynamic>();
  //     map['action'] = 'VALIDATE_EMP';
  //     map['Username'] = un;
  //     map['Password'] = pw;
  //     print(map);
  //     final response = await http.post(ROOT, body: map);
  //     print('valEmployee Response: ${response.body}');
  //     print(response.statusCode);
  //     if (200 == response.statusCode) {
  //       return response.body;
  //     } else {
  //       return "error1";
  //     }
  //   } catch (e) {
  //     print(e);
  //     return "Failure";
  //   }
  // }

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

//
  static Future<List<PsyData>> searchPromise(String searchName) async {
    try {
      var map = Map<String, dynamic>();
      map['action'] = 'PSYCH_SEARCH';
      map['searchName'] = searchName;
      //map['City'] = city;
      final response = await http.post(ROOT, body: map);
      if (response.body == "List is Empty") {
        return [];
      } else {
        if (200 == response.statusCode) {
          var decodedJsonList = jsonDecode(response.body);
          List<PsyData> promiseResult =
              List<PsyData>.from(decodedJsonList.map((val) {
            return PsyData(
              pid: int.parse(val['PID']) ?? -1,
              firstName: val['First_Name'] ?? '',
              lastName: val['Last_Name'] ?? '',
              phoneNumber: int.parse(val['Phone_Number']) ?? 0,
              email: val['email'] ?? '',
              address: val['Address'] ?? '',
              counsellType: val['Counselling_Type'] ?? '',
              city: val['City'] ?? '',
            );
          }));
          return promiseResult;
        } else {
          List<PsyData> errResult = []; //result: "Conn Failure"
          return errResult;
        }
      }
    } catch (e) {
      print(e);
      List<PsyData> errResult = []; //result: "Auth Failure"
      return errResult;
    }
  }

//Function which fetches data for user before initializing their homepage after login
  static Future<UserData> userDatPromise(String aid) async {
    try {
      var map = Map<String, dynamic>();
      map['action'] = 'USR_DAT';
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

//Function which fetches data for moderator before initializing their homepage after login
  static Future<ModData> modDatPromise(String aid) async {
    try {
      var map = Map<String, dynamic>();
      map['action'] = 'MOD_DAT';
      map['aid'] = aid;
      final response = await http.post(ROOT, body: map);
      if (200 == response.statusCode) {
        ModData promiseResult = ModData.fromData(jsonDecode(response.body));
        return promiseResult;
      } else {
        ModData errResult = ModData(result: "Conn Failure");
        print(response.statusCode);
        return errResult;
      }
    } catch (e) {
      print(e);
      ModData errResult = ModData(result: "Auth Failure");
      return errResult;
    }
  }

  // // This function validates username field while logging an issue on behalf of employee
  // static Future<String> valEmployeeId(String un) async {
  //   try {
  //     var map = Map<String, dynamic>();
  //     map['action'] = 'VALIDATE_EMP_ID';
  //     map['Employee_ID'] = un;
  //     final response = await http.post(ROOT, body: map);
  //     print('valEmployeeId Response: ${response.body}');
  //     if (200 == response.statusCode) {
  //       return response.body;
  //     } else {
  //       return "error1";
  //     }
  //   } catch (e) {
  //     return "Failure";
  //   }
  // }

  static Future<String> signup(String fname, String lname, String username,
      String password, String city) async {
    try {
      var map = Map<String, dynamic>();
      var map1 = Map<String, dynamic>();
      map['action'] = 'SIGN_UP';
      map['Username'] = username;
      map['Password'] = password;
      map['First_Name'] = fname;
      map['Last_Name'] = lname;
      map['User_type'] = 'User';
      map['City'] = city;

      map1['action'] = 'Add_User';
      map1['First_Name'] = fname;
      map1['Last_Name'] = lname;
      map1['Blacklist'] = 'false';
      map1['City'] = city;
      //var aid = '';
      final response = await http.post(ROOT, body: map);
      if (200 == response.statusCode) {
        print('RESPONSE: ${response.body}');
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

  static Future<String> addRatingReview(
      String rating, String review, String uid, int pid) async {
    try {
      var map = Map<String, dynamic>();
      map['action'] = "ADD_RATING_REVIEW";
      map['rating'] = rating;
      map['review'] = review;
      map['uid'] = uid;
      map['pid'] = "$pid";
      print(map);
      final response = await http.post(ROOT, body: map);
      print(response.body);
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

  static Future<List<SearchData>> psychSearchHistory() async {
    try {
      var map = Map<String, dynamic>();
      map['action'] = 'PSYCH_SUG';
      map['uid'] = userFile.usrData.uid;
      final response = await http.post(ROOT, body: map);

      if (response.body == "List is Empty") {
        return [];
      } else {
        print('Search Suggestion Response: ${response.body}');
        if (200 == response.statusCode) {
          var decodedJsonList = jsonDecode(response.body);
          List<SearchData> promiseResult =
              List<SearchData>.from(decodedJsonList.map((val) {
            return SearchData.fromData(val);
          }));
          return promiseResult;
        } else {
          List<SearchData> errResult = []; //result: "Conn Failure"
          return errResult;
        }
      }
    } catch (e) {
      print(e);
      List<SearchData> errResult = []; //result: "Auth Failure"
      return errResult;
    }
  }

  static Future<List<PsychRevData>> viewPsychRevUsr(int pid) async {
    try {
      var map = Map<String, dynamic>();
      map['action'] = 'PSYCH_REV_USR';
      map['pid'] = "$pid";

      final response = await http.post(ROOT, body: map);
      print(pid);
      if (response.body == "List is Empty") {
        return [];
      } else {
        print('Search Suggestion Response: ${response.body}');
        if (200 == response.statusCode) {
          var decodedJsonList = jsonDecode(response.body);
          List<PsychRevData> promiseResult =
              List<PsychRevData>.from(decodedJsonList.map((val) {
            return PsychRevData.fromData(val);
          }));
          return promiseResult;
        } else {
          List<PsychRevData> errResult = []; //result: "Conn Failure"
          return errResult;
        }
      }
    } catch (e) {
      print("Backend Error: $e");
      List<PsychRevData> errResult = []; //result: "Auth Failure"
      return errResult;
    }
  }

  static Future<String> psychDel(String pid) async {
    try {
      var map1 = Map<String, dynamic>();
      map1['action'] = 'DELETE_PSYCH';
      map1['PID'] = pid;
      print(map1);
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

  static Future<String> getRating(String pid) async {
    try {
      var map1 = Map<String, dynamic>();
      map1['action'] = 'GET_RATING';
      map1['PID'] = pid;
      print(map1);
      final response = await http.post(ROOT, body: map1);
      if (200 == response.statusCode) {
        print(response.body);
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

  static Future<Void> addSearch(
    String searchQuery,
  ) async {
    try {
      var map1 = Map<String, dynamic>();

      map1['action'] = 'ADD_SEARCH';
      map1['searchQuery'] = searchQuery;
      map1['uid'] = userFile.usrData.uid;
      print("${userFile.usrData.uid}, $searchQuery");
      final response = await http.post(ROOT, body: map1);
      if (200 == response.statusCode) {
        print(response.body);
        print("Success");
      } else {
        print("DB Failure");
      }
      return null;
    } catch (e) {
      print(e);
      return null;
    }
  }

  static Future<List<PsychRevData>> viewRevUsr() async {
    try {
      var map = Map<String, dynamic>();
      map['action'] = 'REV_USR';
      map['uid'] = "${userFile.usrData.uid}";
      final response = await http.post(ROOT, body: map);
      if (response.body == "List is Empty") {
        return [];
      } else {
        print('Search Suggestion Response: ${response.body}');
        if (200 == response.statusCode) {
          var decodedJsonList = jsonDecode(response.body);
          List<PsychRevData> promiseResult =
              List<PsychRevData>.from(decodedJsonList.map((val) {
            return PsychRevData.fromData(val);
          }));
          return promiseResult;
        } else {
          List<PsychRevData> errResult = []; //result: "Conn Failure"
          return errResult;
        }
      }
    } catch (e) {
      print("Backend Error: $e");
      List<PsychRevData> errResult = []; //result: "Auth Failure"
      return errResult;
    }
  }

  static Future<List<PsychComplaintData>> psychComplaints() async {
    try {
      var map = Map<String, dynamic>();
      map['action'] = 'PSYCH_COMPLAIN';

      final response = await http.post(ROOT, body: map);

      if (response.body == "List is Empty") {
        return [];
      } else {
        print('Search Suggestion Response: ${response.body}');
        if (200 == response.statusCode) {
          var decodedJsonList = jsonDecode(response.body);
          List<PsychComplaintData> promiseResult =
              List<PsychComplaintData>.from(decodedJsonList.map((val) {
            return PsychComplaintData.fromData(val);
          }));
          return promiseResult;
        } else {
          List<PsychComplaintData> errResult = []; //result: "Conn Failure"
          return errResult;
        }
      }
    } catch (e) {
      print(e);
      List<PsychComplaintData> errResult = []; //result: "Auth Failure"
      return errResult;
    }
  }

  static Future<List<RevComplaintData>> revComplaints() async {
    try {
      var map = Map<String, dynamic>();
      map['action'] = 'REV_COMPLAIN';

      final response = await http.post(ROOT, body: map);

      if (response.body == "List is Empty") {
        return [];
      } else {
        print('Search Suggestion Response: ${response.body}');
        if (200 == response.statusCode) {
          var decodedJsonList = jsonDecode(response.body);
          List<RevComplaintData> promiseResult =
              List<RevComplaintData>.from(decodedJsonList.map((val) {
            return RevComplaintData.fromData(val);
          }));
          return promiseResult;
        } else {
          List<RevComplaintData> errResult = []; //result: "Conn Failure"
          return errResult;
        }
      }
    } catch (e) {
      print(e);
      List<RevComplaintData> errResult = []; //result: "Auth Failure"
      return errResult;
    }
  }
}
