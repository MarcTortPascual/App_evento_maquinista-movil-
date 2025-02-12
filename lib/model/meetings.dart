import 'package:app_maquinista/model/speakers.dart';

class Meetings {
  String name;
  String description;
  String date;
  String ubication;
  String initTime;
  String endTime;
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
  factory Meetings.fromjson(Map<String, dynamic> meet){
    var jspeakers = meet["speakers"];
    List<Speakers> speakers = [];
    for (var speak in jspeakers){
      speakers.add(Speakers.fromjson(speak));
    }

    return Meetings(meet["presentationName"],meet["presentationDate"],meet["topic"],"","",speakers,meet["ubication"]);
  }
}