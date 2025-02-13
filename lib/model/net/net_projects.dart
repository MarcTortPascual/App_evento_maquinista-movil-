
import 'package:app_maquinista/model/net/Netload.dart';
import 'package:app_maquinista/model/projectos.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';


//clase para cargar los projectos tanto normales como monlautech
class NetProjects extends Netload<Proyecto> {

  NetProjects(int limit,String pagesEndpoint,String itemsEndpoit) :super(limit,pagesEndpoint,itemsEndpoit);


  // Obtener página
  @override
  //implementación de la función para transformar json a proyectos.
  Future<List<Proyecto>> get_page(int pages) async {
    var json  = await get_items_page(pages);
    return json.map((i) => Proyecto.fromJson(i, server)).toList();
  }
}


