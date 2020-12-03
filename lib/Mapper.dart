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
  String blacklist;
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
        firstName = data['firstName'],
        lastName = data['lastName'],
        blacklist = data['blacklist'],
        city = data['city'];
}

class ModData {
  String result;
  String mid;
  String firstName;
  String lastName;
  int modLevel;

  ModData(
      {this.result, this.mid, this.firstName, this.lastName, this.modLevel});

  ModData.fromData(Map<String, dynamic> data)
      : result = data['result'],
        mid = data['mid'],
        firstName = data['firstName'],
        lastName = data['lastName'],
        modLevel = data['modLevel'];
}
