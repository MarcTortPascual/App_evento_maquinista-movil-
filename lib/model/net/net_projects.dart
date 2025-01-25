import 'dart:convert';
import 'dart:ffi';
import 'dart:math';
import 'dart:developer';
import 'package:app_maquinista/model/projectos.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:app_maquinista/model/projectos.dart';


class NetProjects {
  String server = "";
  String token = "";
  int available_pages = 0;
  int limit = 3;
  Iterable projects = [];

  // Cargar configuración
  Future<void> loadEnv() async {
    await dotenv.load(fileName:"assets/conf.env");
    server = dotenv.get('SERVER');
    token = dotenv.get('TOKEN');
  }

  // Fetch páginas disponibles
  Future<int> fetch_project_page() async {
    print("hola");
    Map<String, String> headers = {
      "Content-Type": "application/json",
      "Accept": "application/json",
      "Authorization": "Bearer $token",
    };
    final response = await http.get(
      Uri.parse( server+"/projectsPages/"+limit.toString()),
      headers: headers
    );
    if (response.statusCode == 200) {
      return int.parse(response.body);
    } else {
      throw Exception("Error al obtener páginas: ${response.body}");
    }

  }

  // Fetch proyectos
  Future<List<Proyecto>> fetch_projects(int page) async {
    print("hola2");
    Map<String, String> headers = {
      "Content-Type": "application/json",
      "Accept": "application/json",
      "Authorization": "Bearer $token",
    };
    final response = await http.get(
      Uri.parse("$server/projects/$limit/$page"),
      headers: headers,
    );
    if (response.statusCode == 200) {
      final decodedProjects = jsonDecode(response.body) as List;
      return decodedProjects
          .map((jproj) => Proyecto.fromJson(jproj, server))
          .toList();
    } else {
      throw Exception("Error al obtener proyectos: ${response.body}");
    }
  }

  // Obtener página
  Future<List<Proyecto>> get_page(int page) async {
    print("h");
    await loadEnv(); // Asegúrate de cargar el entorno
    available_pages = await fetch_project_page();
    print("0");
    if (page <= available_pages) {
      print("l");
      return await fetch_projects(page); // Retorna los proyectos

    } else {
      print("a");
      throw Exception("Número de página fuera de rango");

    }
  }
}


