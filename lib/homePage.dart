import 'package:app_maquinista/model/projectos.dart';
import 'package:app_maquinista/custom_widgets/menu_button.dart';
import 'package:app_maquinista/model/students.dart';
import 'package:app_maquinista/proyectos_page.dart';
import 'package:flutter/material.dart';


Estudents manolo = Estudents(
  5,
  "manolo",
  "https://dagrs.berkeley.edu/sites/default/files/2020-01/sample.pdf",
  "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse4.explicit.bing.net%2Fth%3Fid%3DOIP.awAiMS1BCAQ2xS2lcdXGlwHaHH%26pid%3DApi&f=1&ipt=1fc8c60c61b2bd74d5561b525e45110627980ac0aaac65f25d0e355135c370db&ipo=images",
   true,
  "jose",
  "luis2",
);
List<Proyecto> projectos = [
  Proyecto(
      1,
      "Frenos",
      manolo,
      "_zona",
      "1",
      "GM Electromecánica",
      "Electromecanica de un nissan",
      "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse1.mm.bing.net%2Fth%3Fid%3DOIP.1ukVOUiiOqIqw4idjir_9wHaE7%26pid%3DApi&f=1&ipt=a7ba6b9ceb33327f3c3304c5f0d469590291dfda01c08ee71d6382660e82146d&ipo=images", "https://upload.wikimedia.org/wikipedia/commons/transcoded/5/52/Visa_II.ogv/Visa_II.ogv.360p.webm",
      "https://dagrs.berkeley.edu/sites/default/files/2020-01/sample.pdf",
      "_fotoAutorUrl",

  ),
  Proyecto(2,"Motor", manolo, "_zona2", "2", "GS Automoción", "Automación de un nissan", "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse1.mm.bing.net%2Fth%3Fid%3DOIP.1ukVOUiiOqIqw4idjir_9wHaE7%26pid%3DApi&f=1&ipt=a7ba6b9ceb33327f3c3304c5f0d469590291dfda01c08ee71d6382660e82146d&ipo=images", "https://upload.wikimedia.org/wikipedia/commons/transcoded/7/70/Tr%C3%A1fico_-_Aguascalientes.webm/Tr%C3%A1fico_-_Aguascalientes.webm.720p.vp9.webm", "https://moodlesg.monlau.com/pluginfile.php/53687/mod_resource/content/1/React_Tutorial.pdf", "_fotoAutorUrl"),
  Proyecto(3,"Embrage", manolo, "_zona3", "3", "GM Carrocería'", "Carroceria de un nissan", "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse1.mm.bing.net%2Fth%3Fid%3DOIP.1ukVOUiiOqIqw4idjir_9wHaE7%26pid%3DApi&f=1&ipt=a7ba6b9ceb33327f3c3304c5f0d469590291dfda01c08ee71d6382660e82146d&ipo=images", "https://upload.wikimedia.org/wikipedia/commons/transcoded/a/a9/Coyote_Inspects_Badger_Den_Karl_E._Mundt_National_Wildlife_Refuge_South_Dakota.webm/Coyote_Inspects_Badger_Den_Karl_E._Mundt_National_Wildlife_Refuge_South_Dakota.webm.720p.vp9.webm", "https://moodlesg.monlau.com/pluginfile.php/53687/mod_resource/content/1/React_Tutorial.pdf", "_fotoAutorUrl"),
  Proyecto(4,"Caroceria", manolo, "_zona4", "4", "GM Motocicletas", "Moticicleta nissan", "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse1.mm.bing.net%2Fth%3Fid%3DOIP.1ukVOUiiOqIqw4idjir_9wHaE7%26pid%3DApi&f=1&ipt=a7ba6b9ceb33327f3c3304c5f0d469590291dfda01c08ee71d6382660e82146d&ipo=images", "https://upload.wikimedia.org/wikipedia/commons/transcoded/a/a9/Coyote_Inspects_Badger_Den_Karl_E._Mundt_National_Wildlife_Refuge_South_Dakota.webm/Coyote_Inspects_Badger_Den_Karl_E._Mundt_National_Wildlife_Refuge_South_Dakota.webm.720p.vp9.webm", "https://moodlesg.monlau.com/pluginfile.php/53687/mod_resource/content/1/React_Tutorial.pdf", "_fotoAutorUrl")
];
class Home extends StatelessWidget{
  Widget build(BuildContext context) {
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
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ProyectosPage(projectos: projectos,)))
                },
                icon: Icons.car_crash,
                text: 'Proyectos',
              ),
              MenuButton(
                onPressed: () =>{},
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
                onPressed: () {

                },
                icon: Icons.people_outline,
                text: 'Ponencias',

              ),
              MenuButton(
                onPressed: () {

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
                onPressed: () {

                },
                icon: Icons.map,
                text: 'Mapa',

              ),
              MenuButton(
                onPressed: () {

                },
                icon: Icons.access_time,
                text: 'Horario',

              ),
            ],
          ),
        ],
            ),
      )
    );
  }
}