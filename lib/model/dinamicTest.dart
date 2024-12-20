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
}