//pagina de inicio

import 'dart:io';

//importación de de las classes para cargar de la bbdd y la classe de los diferentes
//apartados
import 'package:app_maquinista/companies_page.dart';
import 'package:app_maquinista/map_page.dart';
import 'package:app_maquinista/meeting_details.dart';
import 'package:app_maquinista/meetings_page.dart';
import 'package:app_maquinista/model/companies.dart';
import 'package:app_maquinista/model/dinamicTest.dart';
import 'package:app_maquinista/model/meetings.dart';
import 'package:app_maquinista/model/net/net_companies.dart';
import 'package:app_maquinista/model/net/net_meetings.dart';
import 'package:app_maquinista/model/net/net_projects.dart';
import 'package:app_maquinista/model/projectos.dart';
import 'package:app_maquinista/custom_widgets/menu_button.dart';

import 'package:app_maquinista/projectos_detalles_page.dart';
import 'package:app_maquinista/proyectos_page.dart';

import 'package:flutter/material.dart';


//lista para guardar los datos cargados de la bbdd
List<Proyecto> projectos = [];
List<Meetings> meets = [];
List<DinamicTest> testdinamicos = [];
List<Proyecto> monlautech = [];
List<Companies> companies =[];

//Inicializamos las classes para cargar los datos
NetProjects proj_mng =  NetProjects(7,"projectsPages","projects");
NetProjects mont_mng =  NetProjects(7,"monlautechPages","monlautech");
NetCompanies com_mng = NetCompanies(7);
NetMeetings met_mng = NetMeetings(7);

//classe pricipal del widget del la pantalla de inicio
class Home extends StatelessWidget{

  //cargamos los datos
  Future<void> load() async{
    projectos = await proj_mng.get_page(1);
    monlautech = await mont_mng.get_page(1);
    companies = await com_mng.get_page(1);
    meets = await met_mng.get_page(1);
  }
  Widget build(BuildContext context)  {
    load();
    sleep(Duration(seconds: 10));
    List<Widget> children = [];
    //Iteramos las listas de los datos para rellenar la lista de los eventos (ponencias, projectos, proyectos monlautech)
    for (var meet in meets)
    {
      children.add(
          Card(
              shape: RoundedRectangleBorder(
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
                    Text(meet.date),
                    Text(meet.description)
                  ],
                ),
                onTap: () =>
                {
                  Navigator.push(context, MaterialPageRoute(
                      builder: (context) => Meeting_details(meeting: meet)))
                },
              )
          ));
    }

    for (var pro in projectos) {
      children.add(
          Card(
              shape: RoundedRectangleBorder(
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
                ),
                onTap: () =>
                {
                  Navigator.push(context, MaterialPageRoute(
                      builder: (context) => DetallesProyectos(proj: pro,)))
                },
              )
          ));
    }

    for (var pro in testdinamicos) {
      children.add(
          Card(
              shape: RoundedRectangleBorder(
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
                    Text("Proyecto monlautech: "),
                    Text(pro.titulo),
                    Text(pro.resumen),
                    Text(pro.initTime + " - " + pro.endDate),
                  ],
                ),
                onTap: () =>
                {
                  Navigator.push(context, MaterialPageRoute(
                      builder: (context) => DetallesProyectos(proj: pro)))
                },
              )
          ));
    }

    //detectar tamaño de la pantalla

    final double screenHeight = MediaQuery
        .of(context)
        .size
        .height;
    final double screenWidth = MediaQuery
        .of(context)
        .size
        .width;

    //grid de los botones de los diferentes apartados

    return Scaffold(
        appBar: AppBar(
          title: Text("Monlau Automoción", textAlign: TextAlign.center,),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [

              Wrap(
                //fila de botones de projecto y monlautech
                spacing: screenWidth / 3,
                // Espacio horizontal entre botones
                runSpacing: screenHeight / 4,
                // Espacio vertical en caso de wrap

                alignment: WrapAlignment.center,
                children: [
                  //boton de los projectos
                  MenuButton(

                    onPressed: () =>
                    {
                      //mandamos al apartado de los proyectos
                      Navigator.push(context, MaterialPageRoute(
                          builder: (context) =>
                              ProyectosPage(name: 'Proyectos',
                                projectos: projectos,
                                projects_mng: proj_mng,)))
                    },
                    //icono y texto del boton
                    icon: Icons.car_crash,
                    text: 'Proyectos',
                  ),
                  MenuButton(
                    //boton de los proyectos monlautech
                    onPressed: () => {
                      //mandamos a la pantalla de monlautech
                      Navigator.push(context, MaterialPageRoute(
                          builder: (context) =>
                              ProyectosPage(name: 'Monlautech',
                                  projectos: monlautech,
                                  projects_mng: mont_mng)))
                    },
                    //icono y texto del boton
                    icon: Icons.flag_outlined,
                    text: 'Monlautech',
                  )
                ],
              ),
              Wrap(
                //fila de botones de los expositores y ponencias
                spacing: screenWidth / 3,
                // Espacio horizontal entre botones
                runSpacing: screenHeight / 4,
                // Espacio vertical en caso de wrap
                alignment: WrapAlignment.center,
                children: [
                  //boton de ponencias
                  MenuButton(
                    onPressed: () =>
                    {
                      //mandamos a la pantalla de las ponencias
                      Navigator.push(context, MaterialPageRoute(
                          builder: (context) => Meetings_page(meetings: meets)))
                    },
                    //icono y texto del boton de poneciasd
                    icon: Icons.people_outline,
                    text: 'Ponencias',

                  ),
                  MenuButton(
                    //boton de los expositores
                    onPressed: () =>
                    {
                      //mandamos a la pantalla coresponiente de las companias
                      Navigator.push(context, MaterialPageRoute(
                          builder: (context) =>
                              Companies_Page(companies: companies)))
                    },
                    //texto e icono del boton
                    icon: Icons.business_outlined,
                    text: 'Expositores',


                  ),
                ],
              ),
              Wrap(
                spacing: screenWidth / 3,
                // Espacio horizontal entre botones
                runSpacing: screenHeight / 4,
                // Espacio vertical en caso de wrap
                alignment: WrapAlignment.center,
                children: [
                  MenuButton(
                    //boton de mapa
                    onPressed: () =>
                    {
                      //mandamos al mapa
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Map_page()))
                    },
                    //iconos y texto del boton del mapa
                    icon: Icons.map,
                    text: 'Mapa',

                  ),
                ],
              ),
              Container(
                //lista de eventos
                //decimos que ocupe la parte baja de la pantalla
                height: screenHeight / 3 + screenHeight / 8,
                width: screenHeight,
                //children es rellenado con los for previos
                child: ListView(children: children,),


              )
            ],
          ),
        )
    );
   }
}