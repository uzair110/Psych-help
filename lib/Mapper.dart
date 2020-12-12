class UserIds {
  String username;
  String result;
  int aid;
  String userType;

  UserIds({this.username, this.result, this.aid, this.userType});

  UserIds.fromData(Map<String, dynamic> data)
      : username = data['username'],
        result = data['result'],
        aid = int.parse(data['aid']),
        userType = data['userType'];
}

class UserData {
  String result;
  int uid;
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
        uid = int.parse(data['uid']),
        firstName = data['firstName'],
        lastName = data['lastName'],
        blacklist = data['blacklist'],
        city = data['city'];
}

class ModData {
  String result;
  int mid;
  String firstName;
  String lastName;
  int modLevel;

  ModData(
      {this.result, this.mid, this.firstName, this.lastName, this.modLevel});

  ModData.fromData(Map<String, dynamic> data)
      : result = data['result'],
        mid = int.parse(data['mid']),
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
        pid = int.parse(data['PID']),
        firstName = data['First _Name'],
        lastName = data['Last_Name'],
        phoneNumber = int.parse(data['Phone_Number']),
        email = data['email'],
        address = data['Address'],
        counsellType = data['Counselling_Type'],
        city = data['City'];
}

class SearchData {
  int count;
  String seacrhHis;
  int sid;
  int uid;

  SearchData({this.count, this.seacrhHis, this.sid, this.uid});

  SearchData.fromData(Map<String, dynamic> data)
      : count = int.parse(data['Counter']),
        seacrhHis = data['Search_Name'],
        uid = int.parse(data['UID']),
        sid = int.parse(data['SID']);
}

class RevComplaintData {
  int revID;
  String review;
  String complain;
  String type;

  RevComplaintData({this.revID, this.review, this.complain, this.type});

  RevComplaintData.fromData(Map<String, dynamic> data)
      : revID = int.parse(data['rev_id']),
        review = data['rev'],
        complain = data['complain'],
        type = data['cType'];
}

class PsychComplaintData {
  int pid;
  int uid;
  String firstName;
  String lastName;
  String complain;

  PsychComplaintData(
      {this.pid, this.uid, this.firstName, this.lastName, this.complain});

  PsychComplaintData.fromData(Map<String, dynamic> data)
      : pid = int.parse(data['pid']),
        uid = int.parse(data['uid']),
        firstName = data['firstName'],
        lastName = data['lastName'],
        complain = data['complaint'];
}

class PsychRevData {
  int uid;
  String firstName;
  String psyfirstName;
  String psylastName;
  int pid;
  double rating;
  String review;
  int upvote;
  int downvote;
  int ratID;

  PsychRevData(
      {this.uid,
      this.firstName,
      this.pid,
      this.ratID,
      this.review,
      this.psyfirstName,
      this.psylastName,
      this.upvote,
      this.downvote,
      this.rating});

  PsychRevData.fromData(Map<String, dynamic> data)
      : uid = int.parse(data['UID']),
        firstName = data['First_Name'],
        pid = int.parse(data['PID']),
        rating = double.parse(data['Rating']),
        review = data['review'],
        psyfirstName = data['psyfirstName'],
        psylastName = data['psylastName'],
        upvote = int.parse(data['Upvote']),
        downvote = int.parse(data['downvote']),
        ratID = int.parse(data['Rating_ID']);
}
