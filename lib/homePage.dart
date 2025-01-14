import 'package:app_maquinista/companies_page.dart';
import 'package:app_maquinista/map_page.dart';
import 'package:app_maquinista/meeting_details.dart';
import 'package:app_maquinista/meetings_page.dart';
import 'package:app_maquinista/model/companies.dart';
import 'package:app_maquinista/model/dinamicTest.dart';
import 'package:app_maquinista/model/meetings.dart';
import 'package:app_maquinista/model/projectos.dart';
import 'package:app_maquinista/custom_widgets/menu_button.dart';
import 'package:app_maquinista/model/roles.dart';
import 'package:app_maquinista/model/speakers.dart';
import 'package:app_maquinista/model/students.dart';
import 'package:app_maquinista/projectos_detalles_page.dart';
import 'package:app_maquinista/proyectos_page.dart';
import 'package:flutter/material.dart';

import 'model/users.dart';

List<Companies> companies =[
  Companies("Comp1",User("tort","a",Role.COMPANIE),"stand 1"),
  Companies("Comp11",User("tort1","a",Role.COMPANIE),"stand 11"),
  Companies("Comp12",User("tort2","a",Role.COMPANIE),"stand 21"),
  Companies("Comp13",User("tort3","a",Role.COMPANIE),"stand 31"),

];
Estudents manolo = Estudents(
  5,
  "manolo",
  "https://dagrs.berkeley.edu/sites/default/files/2020-01/sample.pdf",
  "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse4.explicit.bing.net%2Fth%3Fid%3DOIP.awAiMS1BCAQ2xS2lcdXGlwHaHH%26pid%3DApi&f=1&ipt=1fc8c60c61b2bd74d5561b525e45110627980ac0aaac65f25d0e355135c370db&ipo=images",
   true,
  "jose",
  "luis2",
);
Estudents manolo2 = Estudents(
  51,
  "manolo2",
  "https://dagrs.berkeley.edu/sites/default/files/2020-01/sample.pdf",
  "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse4.explicit.bing.net%2Fth%3Fid%3DOIP.awAiMS1BCAQ2xS2lcdXGlwHaHH%26pid%3DApi&f=1&ipt=1fc8c60c61b2bd74d5561b525e45110627980ac0aaac65f25d0e355135c370db&ipo=images",
  true,
  "jj",
  "ll",
);

List<Proyecto> projectos = [
  Proyecto(
      1,
      "Frenos",
      [manolo],
      "_zona",
      "1",
      "GM Electromecánica",
      "Electromecanica de un nissan",
      "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse1.mm.bing.net%2Fth%3Fid%3DOIP.1ukVOUiiOqIqw4idjir_9wHaE7%26pid%3DApi&f=1&ipt=a7ba6b9ceb33327f3c3304c5f0d469590291dfda01c08ee71d6382660e82146d&ipo=images", "https://upload.wikimedia.org/wikipedia/commons/transcoded/5/52/Visa_II.ogv/Visa_II.ogv.360p.webm",
      "https://dagrs.berkeley.edu/sites/default/files/2020-01/sample.pdf",
      "_fotoAutorUrl",

  ),
  Proyecto(2,"Motor", [manolo], "_zona2", "2", "GS Automoción", "Automación de un nissan", "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse1.mm.bing.net%2Fth%3Fid%3DOIP.1ukVOUiiOqIqw4idjir_9wHaE7%26pid%3DApi&f=1&ipt=a7ba6b9ceb33327f3c3304c5f0d469590291dfda01c08ee71d6382660e82146d&ipo=images", "https://upload.wikimedia.org/wikipedia/commons/transcoded/7/70/Tr%C3%A1fico_-_Aguascalientes.webm/Tr%C3%A1fico_-_Aguascalientes.webm.720p.vp9.webm", "https://moodlesg.monlau.com/pluginfile.php/53687/mod_resource/content/1/React_Tutorial.pdf", "_fotoAutorUrl"),
  Proyecto(3,"Embrage", [manolo,manolo2], "_zona3", "3", "GM Carrocería'", "Carroceria de un nissan", "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse1.mm.bing.net%2Fth%3Fid%3DOIP.1ukVOUiiOqIqw4idjir_9wHaE7%26pid%3DApi&f=1&ipt=a7ba6b9ceb33327f3c3304c5f0d469590291dfda01c08ee71d6382660e82146d&ipo=images", "https://upload.wikimedia.org/wikipedia/commons/transcoded/a/a9/Coyote_Inspects_Badger_Den_Karl_E._Mundt_National_Wildlife_Refuge_South_Dakota.webm/Coyote_Inspects_Badger_Den_Karl_E._Mundt_National_Wildlife_Refuge_South_Dakota.webm.720p.vp9.webm", "https://moodlesg.monlau.com/pluginfile.php/53687/mod_resource/content/1/React_Tutorial.pdf", "_fotoAutorUrl"),
  Proyecto(4,"Caroceria", [manolo,manolo,manolo2], "_zona4", "4", "GM Motocicletas", "Moticicleta nissan", "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse1.mm.bing.net%2Fth%3Fid%3DOIP.1ukVOUiiOqIqw4idjir_9wHaE7%26pid%3DApi&f=1&ipt=a7ba6b9ceb33327f3c3304c5f0d469590291dfda01c08ee71d6382660e82146d&ipo=images", "https://upload.wikimedia.org/wikipedia/commons/transcoded/a/a9/Coyote_Inspects_Badger_Den_Karl_E._Mundt_National_Wildlife_Refuge_South_Dakota.webm/Coyote_Inspects_Badger_Den_Karl_E._Mundt_National_Wildlife_Refuge_South_Dakota.webm.720p.vp9.webm", "https://moodlesg.monlau.com/pluginfile.php/53687/mod_resource/content/1/React_Tutorial.pdf", "_fotoAutorUrl")
];
List<DinamicTest> testdinamicos = [
  DinamicTest(
    "12:00",
    "13:00",
    1,
    "Frenos",
    [manolo],
    "GM Electromecánica",
    "Electromecanica de un nissan",
    "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse1.mm.bing.net%2Fth%3Fid%3DOIP.1ukVOUiiOqIqw4idjir_9wHaE7%26pid%3DApi&f=1&ipt=a7ba6b9ceb33327f3c3304c5f0d469590291dfda01c08ee71d6382660e82146d&ipo=images", "https://upload.wikimedia.org/wikipedia/commons/transcoded/5/52/Visa_II.ogv/Visa_II.ogv.360p.webm",
    "https://dagrs.berkeley.edu/sites/default/files/2020-01/sample.pdf",
    "_fotoAutorUrl",

  ),
  DinamicTest("12:00",
      "13:00",2,"Motor", [manolo], "GS Automoción", "Automación de un nissan", "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse1.mm.bing.net%2Fth%3Fid%3DOIP.1ukVOUiiOqIqw4idjir_9wHaE7%26pid%3DApi&f=1&ipt=a7ba6b9ceb33327f3c3304c5f0d469590291dfda01c08ee71d6382660e82146d&ipo=images", "https://upload.wikimedia.org/wikipedia/commons/transcoded/7/70/Tr%C3%A1fico_-_Aguascalientes.webm/Tr%C3%A1fico_-_Aguascalientes.webm.720p.vp9.webm", "https://moodlesg.monlau.com/pluginfile.php/53687/mod_resource/content/1/React_Tutorial.pdf", "_fotoAutorUrl"),
  DinamicTest("12:00",
      "13:00",3,"Embrage", [manolo,manolo2],  "GM Carrocería'", "Carroceria de un nissan", "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse1.mm.bing.net%2Fth%3Fid%3DOIP.1ukVOUiiOqIqw4idjir_9wHaE7%26pid%3DApi&f=1&ipt=a7ba6b9ceb33327f3c3304c5f0d469590291dfda01c08ee71d6382660e82146d&ipo=images", "https://upload.wikimedia.org/wikipedia/commons/transcoded/a/a9/Coyote_Inspects_Badger_Den_Karl_E._Mundt_National_Wildlife_Refuge_South_Dakota.webm/Coyote_Inspects_Badger_Den_Karl_E._Mundt_National_Wildlife_Refuge_South_Dakota.webm.720p.vp9.webm", "https://moodlesg.monlau.com/pluginfile.php/53687/mod_resource/content/1/React_Tutorial.pdf", "_fotoAutorUrl"),
  DinamicTest("12:00",
      "13:00",4,"Caroceria", [manolo,manolo,manolo2], "GM Motocicletas", "Moticicleta nissan", "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse1.mm.bing.net%2Fth%3Fid%3DOIP.1ukVOUiiOqIqw4idjir_9wHaE7%26pid%3DApi&f=1&ipt=a7ba6b9ceb33327f3c3304c5f0d469590291dfda01c08ee71d6382660e82146d&ipo=images", "https://upload.wikimedia.org/wikipedia/commons/transcoded/a/a9/Coyote_Inspects_Badger_Den_Karl_E._Mundt_National_Wildlife_Refuge_South_Dakota.webm/Coyote_Inspects_Badger_Den_Karl_E._Mundt_National_Wildlife_Refuge_South_Dakota.webm.720p.vp9.webm", "https://moodlesg.monlau.com/pluginfile.php/53687/mod_resource/content/1/React_Tutorial.pdf", "_fotoAutorUrl")
];

Speakers josep = Speakers("josep", "mecanico", DateTime.now(), "surname1", "surname2");
Speakers maria = Speakers("maria", "biography", DateTime.now(), "surname1", "surname2");
Speakers josemaria = Speakers("josemaria", "biography", DateTime.now(), "surname1", "surname2");

Meetings met1 = Meetings("name1", "date", "description", "endTime", "initTime", [josep,maria], "ubication");
Meetings met2 = Meetings("name2", "date", "description", "endTime", "initTime", [josemaria,maria], "ubication");
Meetings met3 = Meetings("name3", "date", "description", "endTime", "initTime", [josep,josemaria,maria], "ubication");

var meets = [met1,met2,met3];
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