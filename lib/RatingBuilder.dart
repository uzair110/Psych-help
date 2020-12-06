import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:psych_help/Loading.dart';
import 'package:psych_help/Mapper.dart';
import 'package:rating_bar/rating_bar.dart';
import 'package:psych_help/psychProfileUsr.dart';
import 'package:psych_help/globals.dart' as userFile;

class UsrPsychRevList extends StatefulWidget {
  final String pid;

  UsrPsychRevList({this.pid});
  @override
  _UsrPsychRevList createState() => _UsrPsychRevList();
}
// ListView.builder(
//     physics: NeverScrollableScrollPhysics(),
//     shrinkWrap: true,
//     itemCount: litems.length,
//     itemBuilder: (context, index) {
//       return InkWell(
//           onTap: () {
//             print("Card Clicked");
//           },
//           child: new Card(
//             child: ListTile(
//               leading: Icon(Icons.account_circle_rounded),
//               title: Text(userFile.usrID.username),
//               subtitle: Text(litems[index]),

//               // trailing: Icon(Icons.account_circle_rounded),
//               isThreeLine: false,
//             ),
//           ));
//     })
class _UsrPsychRevList extends State<UsrPsychRevList> {
  final int pid;
  _UsrPsychRevList({this.pid});
  // UsrPsychList({this.first_name, this.last_name, this.id})
  @override
  Widget build(BuildContext context) {
    final revs = Provider.of<List<PsychRevData>>(context);
    if (revs == null) {
      return LoadingScreen();
    } else {
      return ListView.builder(
          shrinkWrap: true,
          physics: const AlwaysScrollableScrollPhysics(),
          itemCount: revs.length,
          itemBuilder: (context, index) {
            return Card(
              child: Column(
                children: <Widget>[
                  Text(
                    revs[index].firstName,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
                    textAlign: TextAlign.left,
                  ),
                  RatingBar.readOnly(
                    size: 20,
                    initialRating: revs[index].rating,
                    isHalfAllowed: true,
                    halfFilledIcon: Icons.star_half,
                    filledIcon: Icons.star,
                    emptyIcon: Icons.star_border,
                  ),
                  Text(
                    revs[index].review,
                    style: TextStyle(fontSize: 20),
                    textAlign: TextAlign.left,
                  ),
                  //await ()
                ],

                // leading: Icon(Icons.account_circle_rounded),
                // title: Text(userFile.usrID.username),
                // subtitle: Text(litems[index]),

                // // trailing: Icon(Icons.account_circle_rounded),
                // isThreeLine: false,
              ),
            );
          });
    }
  }
}
