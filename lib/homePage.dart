import 'package:app_maquinista/Events/projectos.dart';
import 'package:app_maquinista/custom_widgets/menu_button.dart';
import 'package:flutter/material.dart';
import 'package:app_maquinista/proyectos_page.dart';
import 'package:app_maquinista/Events/projectos.dart';

List<Proyecto> projectos = [
  Proyecto("Frenos", "d", "_zona", "1", "GM Electromecánica", "Electromecanica de un nissan", "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse1.mm.bing.net%2Fth%3Fid%3DOIP.1ukVOUiiOqIqw4idjir_9wHaE7%26pid%3DApi&f=1&ipt=a7ba6b9ceb33327f3c3304c5f0d469590291dfda01c08ee71d6382660e82146d&ipo=images", "https://upload.wikimedia.org/wikipedia/commons/transcoded/5/52/Visa_II.ogv/Visa_II.ogv.360p.webm", "https://monlaues-my.sharepoint.com/:b:/g/personal/marctorpas_campus_monlau_com/ESbTnB6Q0tVIsimRyPNSlakBg-SnhVU9AekVg9rSXr-Slw?e=h3dgl5", "_fotoAutorUrl", "_cvUrl"),
  Proyecto("Motor", "dd", "_zona2", "2", "GS Automoción", "Automación de un nissan", "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse1.mm.bing.net%2Fth%3Fid%3DOIP.1ukVOUiiOqIqw4idjir_9wHaE7%26pid%3DApi&f=1&ipt=a7ba6b9ceb33327f3c3304c5f0d469590291dfda01c08ee71d6382660e82146d&ipo=images", "https://upload.wikimedia.org/wikipedia/commons/transcoded/7/70/Tr%C3%A1fico_-_Aguascalientes.webm/Tr%C3%A1fico_-_Aguascalientes.webm.720p.vp9.webm", "https://monlaues-my.sharepoint.com/:b:/g/personal/marctorpas_campus_monlau_com/ESbTnB6Q0tVIsimRyPNSlakBg-SnhVU9AekVg9rSXr-Slw?e=h3dgl5", "_fotoAutorUrl", "_cvUrl"),
  Proyecto("Embrage", "ddd", "_zona3", "3", "GM Carrocería'", "Carroceria de un nissan", "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse1.mm.bing.net%2Fth%3Fid%3DOIP.1ukVOUiiOqIqw4idjir_9wHaE7%26pid%3DApi&f=1&ipt=a7ba6b9ceb33327f3c3304c5f0d469590291dfda01c08ee71d6382660e82146d&ipo=images", "https://upload.wikimedia.org/wikipedia/commons/transcoded/a/a9/Coyote_Inspects_Badger_Den_Karl_E._Mundt_National_Wildlife_Refuge_South_Dakota.webm/Coyote_Inspects_Badger_Den_Karl_E._Mundt_National_Wildlife_Refuge_South_Dakota.webm.720p.vp9.webm", "https://monlaues-my.sharepoint.com/:b:/g/personal/marctorpas_campus_monlau_com/ESbTnB6Q0tVIsimRyPNSlakBg-SnhVU9AekVg9rSXr-Slw?e=h3dgl5", "_fotoAutorUrl", "_cvUrl"),
  Proyecto("Caroceria", "dddd", "_zona4", "4", "GM Motocicletas", "Moticicleta nissan", "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse1.mm.bing.net%2Fth%3Fid%3DOIP.1ukVOUiiOqIqw4idjir_9wHaE7%26pid%3DApi&f=1&ipt=a7ba6b9ceb33327f3c3304c5f0d469590291dfda01c08ee71d6382660e82146d&ipo=images", "https://upload.wikimedia.org/wikipedia/commons/transcoded/a/a9/Coyote_Inspects_Badger_Den_Karl_E._Mundt_National_Wildlife_Refuge_South_Dakota.webm/Coyote_Inspects_Badger_Den_Karl_E._Mundt_National_Wildlife_Refuge_South_Dakota.webm.720p.vp9.webm", "https://monlaues-my.sharepoint.com/:b:/g/personal/marctorpas_campus_monlau_com/ESbTnB6Q0tVIsimRyPNSlakBg-SnhVU9AekVg9rSXr-Slw?e=h3dgl5", "_fotoAutorUrl", "_cvUrl")
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