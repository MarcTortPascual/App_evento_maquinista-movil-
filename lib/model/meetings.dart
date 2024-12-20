import 'package:app_maquinista/model/speakers.dart';

class Meetings {
  String name;
  String description;
  String date;
  String ubication;
  String initTime;
  String  endTime;
  List<Speakers> speakers;
  
  Meetings(
      this.name,
      this.date,
      this.description,
      this.endTime,
      this.initTime,
      this.speakers,
      this.ubication,
      );
}