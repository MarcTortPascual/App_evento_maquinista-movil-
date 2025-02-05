import 'dart:convert';
import 'dart:ffi';
import 'dart:math';
import 'dart:developer';
import 'package:app_maquinista/model/projectos.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;



abstract class Netload<T>{
  String server = "";
  String token = "";
  String pages_endpoint ="";
  String items_endpoit = "";
  int available_pages = 0;
  int limit = 6;

  // Cargar configuración
  Future<void> loadEnv() async {
    await dotenv.load(fileName:"assets/conf.env");
    server = dotenv.get('SERVER');
    token = dotenv.get('TOKEN');
  }
  Netload(int limit,String pagesEndpoint,String itemsEndpoit){
    print("called");
    this.limit = limit;
    this.pages_endpoint = pagesEndpoint;
    this.items_endpoit = itemsEndpoit;
    loadEnv().then((r){
      fetch_pages().then((p){

        available_pages = p;
        print("paginas: " + available_pages.toString());
      });
    });
  }
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
      print("Ruta pag: $server/$pages_endpoint/"+limit.toString());
      throw Exception("Error al obtener páginas: ${response.body}");
    }
  }
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
  Future<List<dynamic>> get_items_page(int pages)async{
    print("pag av " +available_pages.toString());
    print("h");
    await loadEnv(); // Asegúrate de cargar el entorno
    available_pages = await fetch_pages();
    print("0");
    if (pages <= available_pages) {
      print("l");
      List<dynamic> page = await fetch_items(pages);
      return page;
    } else {
      List<dynamic> page = await fetch_items(available_pages);
      return page;
    }
  }
  Future<List<T>> get_page(int pages);
}