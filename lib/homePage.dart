import 'package:app_maquinista/companies_page.dart';
import 'package:app_maquinista/map_page.dart';
import 'package:app_maquinista/meeting_details.dart';
import 'package:app_maquinista/meetings_page.dart';
import 'package:app_maquinista/model/companies.dart';
import 'package:app_maquinista/model/dinamicTest.dart';
import 'package:app_maquinista/model/meetings.dart';
import 'package:app_maquinista/model/net/net_projects.dart';
import 'package:app_maquinista/model/projectos.dart';
import 'package:app_maquinista/custom_widgets/menu_button.dart';
import 'package:app_maquinista/model/roles.dart';
import 'package:app_maquinista/model/speakers.dart';
import 'package:app_maquinista/model/students.dart';
import 'package:app_maquinista/projectos_detalles_page.dart';
import 'package:app_maquinista/proyectos_page.dart';
import 'package:flutter/material.dart';

import 'model/users.dart';

List<Proyecto> projectos = [];
List<Meetings> meets = [];
List<DinamicTest> testdinamicos = [];
List<Companies> companies =[];
class Home extends StatelessWidget{

  Widget build(BuildContext context) {
    List<Widget> children = [];

    for (var meet in meets){
      children.add(
        Card(
          shape:  RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
          side: BorderSide(
            color: Colors.blue,
            width: 2.0,
          ),
          ),
          color: Colors.grey,
        child:
        ListTile(
          title: Column(
            children: [
              Text("Ponencia: "),
              Text(meet.initTime + " - " + meet.endTime),
              Text(meet.description)
            ],
          ) ,
          onTap: () =>{
            Navigator.push(context, MaterialPageRoute(builder: (context) => Meeting_details(meeting: meet)))
          },
        )
      ));
    }

    NetProjects(4).get_page(1).then((onValue){
      print("jope: " + onValue.length.toString());
      projectos = onValue;

        for (var pro in projectos){
          children.add(
              Card(
                  shape:  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                    side: BorderSide(
                      color: Colors.blue,
                      width: 2.0,
                    ),
                  ),
                  color: Colors.grey,
                  child:
              ListTile(
                title: Column(
                  children: [
                    Text("Proyecto: "),
                    Text(pro.titulo),
                    Text(pro.resumen)
                  ],
                ) ,
                onTap: () =>{
                  Navigator.push(context, MaterialPageRoute(builder: (context) => DetallesProyectos(proj: pro)))
                },
              )
          ));
        }
    });
      for (var pro in testdinamicos){
        children.add(
            Card(
                shape:  RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                  side: BorderSide(
                    color: Colors.blue,
                    width: 2.0,
                  ),
                ),
                color: Colors.grey,
                child:
                ListTile(
                  title: Column(
                    children: [
                      Text("Prueba dinamica: "),
                      Text(pro.titulo),
                      Text(pro.resumen),
                      Text(pro.initTime + " - " + pro.endDate),
                    ],
                  ) ,
                  onTap: () =>{
                    Navigator.push(context, MaterialPageRoute(builder: (context) => DetallesProyectos(proj: pro)))
                  },
                )
            ));
    }
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text("Monlau Automoción",textAlign: TextAlign.center,),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Wrap(
            spacing: screenWidth/3, // Espacio horizontal entre botones
            runSpacing: screenHeight/4, // Espacio vertical en caso de wrap

            alignment: WrapAlignment.center,
            children: [
              MenuButton(
                onPressed: () =>{
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ProyectosPage(name: 'Proyectos',projectos: projectos,)))
                },
                icon: Icons.car_crash,
                text: 'Proyectos',
              ),
              MenuButton(
                onPressed: () =>{ Navigator.push(context, MaterialPageRoute(builder: (context) => ProyectosPage(name: 'Monlautech',projectos: testdinamicos,)))},
                icon: Icons.flag_outlined,
                text: 'Monlautech',
              )
            ],
          ),
          Wrap(
            spacing: screenWidth/3, // Espacio horizontal entre botones
            runSpacing: screenHeight/4, // Espacio vertical en caso de wrap
            alignment: WrapAlignment.center,
            children: [
              MenuButton(
                onPressed: () =>{
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Meetings_page(meetings: meets)))
                },
                icon: Icons.people_outline,
                text: 'Ponencias',

              ),
              MenuButton(
                onPressed: () => {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Companies_Page(companies: companies)))
                },
                icon: Icons.business_outlined,
                text: 'Expositores',


              ),
            ],
          ),
          Wrap(
            spacing: screenWidth/3, // Espacio horizontal entre botones
            runSpacing: screenHeight/4, // Espacio vertical en caso de wrap
            alignment: WrapAlignment.center,
            children: [
              MenuButton(
                onPressed: () =>{
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Map_page() ))
                },
                icon: Icons.map,
                text: 'Mapa',

              ),
            ],
          ),
          Container(
            height: screenHeight/3 +  screenHeight/8,
            width: screenHeight,
            child: ListView(children: children,),


          )
        ],
            ),
      )
    );
  }
}