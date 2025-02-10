import 'package:app_maquinista/model/projectos.dart';
import 'package:app_maquinista/model/students.dart';

class DinamicTest extends Proyecto{
  String initTime;
  String endDate;
  DinamicTest(
      this.initTime,
      this.endDate,
      int id,
      String titulo,
      List<Estudents> autor,
      String nivelEstudios,
      String resumen,
      String imagenUrl,
      String videoUrl,
      String memoriaUrl,
      String fotoAutorUrl,
  ) :  super(
    id,
    titulo,
    autor,
    "Circuito",
    "Circuito",
    nivelEstudios,
    resumen,
    imagenUrl,
    videoUrl,
    memoriaUrl,
    fotoAutorUrl,
  );
  factory DinamicTest.fromJson (Map<String, dynamic> project, String server ){



    List<Estudents> students = [];
    var jstudents = project["students"];
    for (
    var s in jstudents){
      students.add(Estudents.fromJson(s,server));
    }
    if (students.length  == 0){
      students.add(Estudents(0,"","","",false,"",""));
    }

    project.forEach((k,v){
      if (v == null){
        project[k] = " ";
      }
    });

    return DinamicTest(
      "",
      "",
      project["idProject"],
      project["title"] ?? " ",
      students,
      project["specialization"]??" ",
      project["abstract"]??" ",
      "$server/storage/photos/"+(project['photoName']??" "),
      "$server/storage/videos/"+(project['videoURL']??" "),
      "$server/storage/pdfs/"+(project['pdfURL']??" "),
      "$server/storage/photos/"+(project['photoName']??" "),
    );
  }
}