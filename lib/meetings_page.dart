import 'package:app_maquinista/meeting_details.dart';
import 'package:app_maquinista/model/meetings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'custom_widgets/page.dart';

class Meetings_page extends StatelessWidget{
  Meetings_page({
    super.key,
    required this.meetings
});
  List<Meetings> meetings;

  @override
  Widget build(BuildContext context) {
    List<Widget> children = [];
    for (var m in meetings){
      List<Widget> speakers= [];
      for (var speaker in m.speakers){
        speakers.add(
          Text(speaker.get_all_name())
        );
      }
      children.add(Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),

        child:
        ListTile(
          leading: Icon(Icons.insert_emoticon),
          title:  Text(m.name, style: TextStyle(color: Color.fromARGB(255, 255, 212, 0))),
          subtitle:  Column(
            children: speakers,
          ),
          trailing: Icon(Icons.menu),
          onTap: () => {
            Navigator.push(context, MaterialPageRoute(builder: (context) => Meeting_details(meeting: m,)))
          },
        ),
      )
      );
    }
    return PageMaquinista(tittle: Text("Ponencias"), body: ListView(children: children,));
  }

}