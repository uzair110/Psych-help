import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:psych_help/Loading.dart';
import 'package:psych_help/Mapper.dart';
import 'package:psych_help/psychProfileUsr.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

class UsrPsychList extends StatefulWidget {
  final String firstName, lastName, pid, city;

  UsrPsychList({this.firstName, this.lastName, this.pid, this.city});
  @override
  _UsrPsychList createState() => _UsrPsychList();
}

class _UsrPsychList extends State<UsrPsychList> {
  // UsrPsychList({this.first_name, this.last_name, this.id})
  @override
  Widget build(BuildContext context) {
    final psychs = Provider.of<List<PsyData>>(context);
    if (psychs == null) {
      return LoadingScreen();
    } else {
      return ListView.builder(
          shrinkWrap: true,
          physics: const AlwaysScrollableScrollPhysics(),
          itemCount: psychs.length,
          itemBuilder: (context, index) {
            return Card(
                child: ListTile(
              onTap: () {
                debugPrint('${psychs[index].email} is pressed!');
                var route = new MaterialPageRoute(
                    builder: (BuildContext context) => new PsyProfileUsr(
                          firstName: '${psychs[index].firstName}',
                          lastName: '${psychs[index].lastName}',
                          pid: '${psychs[index].pid}',
                          city: '${psychs[index].city}',
                        ));
                Navigator.of(context).push(route);
              },
              title:
                  Text(psychs[index].firstName + " " + psychs[index].lastName),
              leading: Icon(Icons.account_circle),
              trailing: Text(psychs[index].city),
            ));
          });
    }
  }
}

class UsrPsychSearch extends StatefulWidget {
  @override
  _UsrPsychSearch createState() => _UsrPsychSearch();
}

class _UsrPsychSearch extends State<UsrPsychSearch> {
  @override
  Widget build(BuildContext context) {
    final psychs = Provider.of<List<PsyData>>(context);
    if (psychs == null) {
      return LoadingScreen();
    } else {
      return SingleChildScrollView(
        physics: ScrollPhysics(),
        child: ListView.builder(
            // primary: false,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: psychs.length,
            itemBuilder: (context, index) {
              return Card(
                  child: ListTile(
                onTap: () {
                  debugPrint('${psychs[index].email} is pressed!');
                  var route = new MaterialPageRoute(
                      builder: (BuildContext context) => new PsyProfileUsr(
                            firstName: '${psychs[index].firstName}',
                            lastName: '${psychs[index].lastName}',
                            pid: '${psychs[index].pid}',
                            city: '${psychs[index].city}',
                          ));
                  Navigator.of(context).push(route);
                },
                title: Text(
                    psychs[index].firstName + " " + psychs[index].lastName),
                leading: Icon(Icons.account_circle),
                trailing: Text(psychs[index].city),
              ));
            }),
      );
    }
  }
}
