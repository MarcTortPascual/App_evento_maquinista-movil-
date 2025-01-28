import 'package:flutter/foundation.dart';

class Estudents {
  int id;
  String name;
  String surname_1;
  String surname_2;
  String photoName;
  String cvLink;
  bool isTeamLeader;
  Estudents(
    this.id,
    this.name,
    this.cvLink,
    this.photoName,
    this.isTeamLeader,
    this.surname_1,
    this.surname_2,
  );
  factory Estudents.fromJson (Map<String, dynamic> json,String server){
      json["isTeamLeader"] ?? 0;
      bool leader = json["isTeamLeader"] == 1  ? true : false;
      return Estudents(json["idStudent"], json["name"]?? "", json["cvLink"]?? "", "$server/storage/photos/"+(json["photoName"]?? ""), leader , json["surname1"]?? "", json["surname2"]?? "");
  }
  String get_all_name(){
    return this.name + " " + this.surname_1 + " " + this.surname_2;
  }
}