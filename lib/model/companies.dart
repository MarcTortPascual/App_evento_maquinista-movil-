import 'package:app_maquinista/model/roles.dart';
import 'package:app_maquinista/model/users.dart';
import 'package:flutter/cupertino.dart';

class Companies{
  String name;
  User agent;
  String stand;
  String web;
  String img_url;

  Companies(
      this.name,
      this.agent,
      this.stand,
      this.web,
      this.img_url
      );
  factory Companies.fromJson (Map<String, dynamic> com){
    return Companies(com["companyName"], User(com["asistenteNombre"],"",Role.COMPANIE), "",com["companyWeb"],com["logo_url"]);
  }
}