import 'package:app_maquinista/custom_widgets/page.dart';
import 'package:app_maquinista/homePage.dart';
import 'package:app_maquinista/model/dinamicTest.dart';
import 'package:app_maquinista/model/net/net_projects.dart';
import 'package:app_maquinista/projectos_detalles_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:app_maquinista/model/projectos.dart';


class ProyectosPage<T extends Proyecto> extends StatefulWidget{
  ProyectosPage({
    super.key,
    required this.projectos,
    required this.name,
    required this.projects_mng
  });
  int current = 1;
  NetProjects projects_mng;
  List<Proyecto> projectos ;
  String name;

  @override
  State<ProyectosPage<T>> createState() => _ProyectosPageState<T>();
}

class _ProyectosPageState<T extends Proyecto> extends State<ProyectosPage<T>> {
  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    List<Widget> children = [];
    for (var proj in widget.projectos){
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
                Image.network(test.ImagenUrl,height: 100, width: 200,
                  errorBuilder:
                      (BuildContext context, Object exception, StackTrace? stackTrace) {
                        return const Text('Error a cargar la imagen');
                      },

                )
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
    ScrollController Sc_Lw = ScrollController();
    Sc_Lw.addListener((){

        if (Sc_Lw.position.pixels != 0 && Sc_Lw.position.atEdge){
          setState(() {
            widget.projects_mng.get_page(widget.current).then((proj){

                if (widget.current <= widget.projects_mng.available_pages){
                  print("projectos ");
                  print(proj);
                  widget.projectos.addAll(proj);
                  widget.current ++;
                  print("actual page " + widget.current.toString());
                }
              });
            });
        }
    });
    ListView lwproj =  ListView(children: children,controller: Sc_Lw,);
    return PageMaquinista(tittle: Text(widget.name), body: lwproj );
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