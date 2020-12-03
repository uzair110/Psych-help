class UserIds {
  String result;
  String aid;
  String userType;

  UserIds({this.result, this.aid, this.userType});

  UserIds.fromData(Map<String, dynamic> data)
      : result = data['result'],
        aid = data['aid'],
        userType = data['userType'];
}

class UserData {
  String result;
  String uid;
  String firstName;
  String lastName;
  bool blacklist;
  String city;

  UserData(
      {this.result,
      this.uid,
      this.firstName,
      this.lastName,
      this.blacklist,
      this.city});

  UserData.fromData(Map<String, dynamic> data)
      : result = data['result'],
        uid = data['uid'],
        firstName = data[''],
        lastName = data[''],
        blacklist = data[''],
        city = data[''];
}
