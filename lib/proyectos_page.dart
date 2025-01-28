import 'package:app_maquinista/custom_widgets/page.dart';
import 'package:app_maquinista/model/dinamicTest.dart';
import 'package:app_maquinista/model/net/net_projects.dart';
import 'package:app_maquinista/projectos_detalles_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:app_maquinista/model/projectos.dart';


class ProyectosPage<T extends Proyecto> extends StatelessWidget{
  ProyectosPage({
    super.key,
    required this.projectos,
    required this.name,
    required this.projects_mng
  });
  NetProjects projects_mng;
  List<T> projectos ;
  String name;
  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    List<Widget> children = [];
    /*children.add(
      Seach()
    );*/
    for (var proj in projectos){
      if (proj is DinamicTest){
        DinamicTest test  = proj as DinamicTest;

        children.add(Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),

          child:
          ListTile(
            leading: Icon(Icons.insert_emoticon),
            title:  Text(test.Titulo, style: TextStyle(color: Color.fromARGB(255, 255, 212, 0))),
            subtitle:  Column(
              children: [
                Text(test.Autor[0].get_all_name(),style: TextStyle(color: Color.fromARGB(255, 175, 175, 175)),textAlign: TextAlign.left,),
                Text(test.initTime + " - " + test.endDate),
                Image.network(test.ImagenUrl,height: 100, width: 200,)
              ],
            ),
            trailing: Icon(Icons.menu),
            onTap: () => {
              Navigator.push(context, MaterialPageRoute(builder: (context) => DetallesProyectos(proj: proj)))
            },
          ),
        ));

      }else{
        children.add(Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),

          child:
          ListTile(
            leading: Icon(Icons.insert_emoticon),
            title:  Text(proj.Titulo, style: TextStyle(color: Color.fromARGB(255, 255, 212, 0))),
            subtitle:  Column(
              children: [
                Text(proj.Autor[0].get_all_name(),style: TextStyle(color: Color.fromARGB(255, 175, 175, 175)),textAlign: TextAlign.left,),
                Text(proj.NivelEstudios),
                Image.network(proj.ImagenUrl,height: 100, width: 200,)
              ],
            ),
            trailing: Icon(Icons.menu),
            onTap: () => {
              Navigator.push(context, MaterialPageRoute(builder: (context) => DetallesProyectos(proj: proj)))
            },
          ),
        )

        );
      }
    }
    ListView lwproj =  ListView(children: children,);
    return PageMaquinista(tittle: Text(name), body: lwproj );
  }
}
class Seach extends StatefulWidget{
  const Seach({super.key});

  @override
  State<Seach> createState() => _SeachState();
}

class _SeachState extends State<Seach> {
  /*String nombre;
  String box;*/
  bool visible = false;
  Widget categories = Scaffold();
  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    if (visible){
      categories = Container(
        width: screenWidth/3 ,
        height: screenHeight/3,
        child: Column(
          children: [
            Text("GM motocicletas"),
            Text("GM coches")
          ],
        ),
      );
    }
    return Card(
      child: Column(
        children: [
          Row(children: [
            Expanded(child:
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'nombre projecto',
              ),
            ),)
          ],),
          Row(
              children: [
                Expanded(child:
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'numero de box',
                  ),
                ),), IconButton(onPressed: () => {
                  setState(() {
                    visible = !visible;
                  })
                }, icon: Icon(Icons.filter_alt_sharp)),
                categories,

              ]
          )
        ],
      ),
    );
  }
}