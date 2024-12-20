import 'package:app_maquinista/model/students.dart';
import 'package:flutter/cupertino.dart';

class Proyecto{
  @protected
  int id;
  @protected
  String titulo;
  @protected
  List<Estudents> autor;
  @protected
  String zona;
  @protected
  String box;
  @protected
  String nivelEstudios;
  @protected
  String resumen;
  @protected
  String imagenUrl;
  @protected
  String videoUrl;
  @protected
  String memoriaUrl;
  @protected
  String fotoAutorUrl;


  Proyecto(
      this.id,
      this.titulo,
      this.autor,
      this.zona,
      this.box,
      this.nivelEstudios,
      this.resumen,
      this.imagenUrl,
      this.videoUrl,
      this.memoriaUrl,
      this.fotoAutorUrl,
      );


  String get FotoAutorUrl => fotoAutorUrl;

  set FotoAutorUrl(String value) {
    fotoAutorUrl = value;
  }

  String get MemoriaUrl => memoriaUrl;

  set MemoriaUrl(String value) {
    memoriaUrl = value;
  }

  String get VideoUrl => videoUrl;

  set VideoUrl(String value) {
    videoUrl = value;
  }

  String get ImagenUrl => imagenUrl;

  set ImagenUrl(String value) {
    imagenUrl = value;
  }

  String get Resumen => resumen;

  set Resumen(String value) {
    resumen = value;
  }

  String get NivelEstudios => nivelEstudios;

  set NivelEstudios(String value) {
    nivelEstudios = value;
  }

  String get Box => box;

  set Box(String value) {
    box = value;
  }

  String get Zona => zona;

  set Zona(String value) {
    zona = value;
  }

  List<Estudents> get Autor => autor;

  set Autor(List<Estudents> value) {
    autor = value;
  }

  String get Titulo => titulo;

  set Titulo(String value) {
      titulo = value;
    }
}
