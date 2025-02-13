import 'dart:convert';
import 'dart:ffi';
import 'dart:math';
import 'dart:developer';
import 'package:app_maquinista/model/projectos.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;


//clase para manejar la carga de los datos desde una api

abstract class Netload<T>{
  String server = ""; //direcion del servidor
  String token = ""; //token de la api
  String pages_endpoint =""; //enpoint para obtener las pagina de los datos a consultar
  String items_endpoit = ""; //endpoint para cargar los datos
  int available_pages = 0; //paginas disponibles
  int limit = 6; //catidad de registros de los datos maximos

  // Cargar configuración direcion del servidor y el token de la api
  Future<void> loadEnv() async {
    await dotenv.load(fileName:"assets/conf.env");
    server = dotenv.get('SERVER');
    token = dotenv.get('TOKEN');
  }
  //constructor de Netload
  Netload(int limit,String pagesEndpoint,String itemsEndpoit){
    this.limit = limit;
    this.pages_endpoint = pagesEndpoint;
    this.items_endpoit = itemsEndpoit;
    loadEnv().then((r){
      fetch_pages().then((p){
        available_pages = p;
      });
    });
  }
  //buscamos las paginas disponibles a partir del limit proporcionado
  Future<int> fetch_pages() async{
    Map<String, String> headers = {
      "Content-Type": "application/json",
      "Accept": "application/json",
      "Authorization": "Bearer $token",
    };
    final response = await http.get(
        Uri.parse( "$server/$pages_endpoint/"+limit.toString()),

        headers: headers
    );
    if (response.statusCode == 200) {
      return int.parse(response.body);
    } else {
      throw Exception("Error al obtener páginas: ${response.body}");
    }
  }
  //cargamos los datos con paginación
  Future<List<dynamic>> fetch_items(int page)async{
    Map<String, String> headers = {
      "Content-Type": "application/json",
      "Accept": "application/json",
      "Authorization": "Bearer $token",
    };
    final response = await http.get(
      Uri.parse("$server/$items_endpoit/$limit/$page"),
      headers: headers,
    );
    if (response.statusCode == 200) {
      final decodedProjects = jsonDecode(response.body) as List;
      print(decodedProjects);
      return decodedProjects;

    } else {
      print("Ruta pag: $server/$items_endpoit/$limit/$page");
      throw Exception("Error al obtener proyectos: ${response.body}");
    }
  }

  //controlamos que se carge alguna pagina auue este fuera de rango

  Future<List<dynamic>> get_items_page(int pages)async{

    await loadEnv(); // Asegúrate de cargar el entorno
    available_pages = await fetch_pages();

    if (pages <= available_pages) {

      List<dynamic> page = await fetch_items(pages);
      return page;
    } else {
      List<dynamic> page = await fetch_items(available_pages);
      return page;
    }
  }
  //función para transformar las restpuesta de la api a los objectos
  Future<List<T>> get_page(int pages);
}