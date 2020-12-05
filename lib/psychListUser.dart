import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:psych_help/Loading.dart';
import 'package:psych_help/Mapper.dart';
import 'package:psych_help/psychProfileUsr.dart';

class UsrPsychList extends StatefulWidget {
  @override
  _UsrPsychList createState() => _UsrPsychList();
}

class _UsrPsychList extends State<UsrPsychList> {
  @override
  Widget build(BuildContext context) {
    final psychs = Provider.of<List<PsyData>>(context);
    if (psychs == null) {
      return LoadingScreen();
    } else {
      return ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: psychs.length,
          itemBuilder: (context, index) {
            return Card(
                child: ListTile(
              onTap: () {
                debugPrint('${psychs[index].email} is pressed!');
                var route = new MaterialPageRoute(
                  builder: (BuildContext context) => new PsyProfileUsr(),
                );
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
