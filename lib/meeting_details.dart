import 'package:app_maquinista/custom_widgets/page.dart';
import 'package:app_maquinista/model/meetings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Meeting_details extends StatelessWidget{
  Meeting_details({
  super.key,
    required this.meeting
});
  Meetings meeting;

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    List<Widget> children = [];
    for (var speaker in meeting.speakers){
      children.add(
        Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: Container(
            height: screenHeight/10,
            width: screenWidth,
            child:  Column(
              children: [
                Text(speaker.get_all_name()),
                Text(speaker.biography)
              ]
            ),

          ),
        )



      );

    }
    return PageMaquinista(tittle: Text(meeting.name), body: Scaffold(
      body: Column(
        children: [

          Column(children: [
              Text(meeting.name),
              Row(children: [
                Text(meeting.date)
              ],),
              Text("Resumen: ", style: TextStyle(color: Colors.yellow , fontWeight: FontWeight.w700),),
              Text(meeting.description),

            ],),

          Container(
            height: screenHeight/3,
            width: screenWidth,
            child: ListView(children:children,)
          )

        ],
      ),
    ));
  }
}