class UserIds {
  String uid;
  String aid;
  String userType;

  UserIds({this.uid, this.aid, this.userType});

  UserIds.fromData(Map<String, dynamic> data)
      : uid = data['uid'],
        aid = data['aid'],
        userType = data['userType'];

  Map<String, dynamic> toJSON() {
    return {
      'uid': uid,
      'aid': aid,
      'userType': userType,
    };
  }
}
