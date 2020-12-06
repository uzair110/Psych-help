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
        modLevel = int.parse(data['modLevel']);
}

class PsyData {
  //String result;
  int pid;
  String firstName;
  String lastName;
  int phoneNumber;
  String email;
  String address;
  String counsellType;
  String city;

  PsyData(
      {
      //this.result,
      this.pid,
      this.firstName,
      this.lastName,
      this.phoneNumber,
      this.email,
      this.address,
      this.counsellType,
      this.city});

  PsyData.fromData(Map<String, dynamic> data)
      :
        //result = data['result'],
        pid = data['PID'],
        firstName = data['First _Name'],
        lastName = data['Last_Name'],
        phoneNumber = data['Phone_Number'],
        email = data['email'],
        address = data['Address'],
        counsellType = data['Counselling_Type'],
        city = data['City'];
}

class SearchData {
  int count;
  String seacrhHis;
  int sid;
  String uid;

  SearchData({this.count, this.seacrhHis, this.sid, this.uid});

  SearchData.fromData(Map<String, dynamic> data)
      : count = int.parse(data['Counter']),
        seacrhHis = data['Search_Name'],
        uid = data['UID'],
        sid = int.parse(data['SID']);
}

class ComplaintData {
  String review;
  String complain;
  String type;

  ComplaintData({this.review, this.complain, this.type});

  ComplaintData.fromData(Map<String, dynamic> data)
      : review = data['rev'],
        complain = data['complain'],
        type = data['cType'];
}
