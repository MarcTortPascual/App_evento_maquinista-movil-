import 'package:app_maquinista/custom_widgets/page.dart';
import 'package:app_maquinista/projectos_detalles_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:app_maquinista/model/projectos.dart';


class ProyectosPage extends StatelessWidget{
  ProyectosPage({
   super.key,
  required this.projectos,
});
  List<Proyecto> projectos ;
  @override
  Widget build(BuildContext context) {
    List<Widget> children = [];

    for (var proj in projectos){
        children.add(Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),

          child:
                ListTile(
                  leading: Icon(Icons.insert_emoticon),
                  title:  Text(proj.titulo, style: TextStyle(color: Color.fromARGB(255, 255, 212, 0))),
                  subtitle:  Column(
                    children: [
                      Text(proj.autor.get_all_name(),style: TextStyle(color: Color.fromARGB(255, 175, 175, 175)),textAlign: TextAlign.left,),
                      Image.network(proj.imagenUrl,height: 100, width: 200,)
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
    return PageMaquinista(tittle: Text("Proyectos"), body: ListView(children: children,));
  }
}


