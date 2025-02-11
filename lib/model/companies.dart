import 'package:app_maquinista/model/roles.dart';
import 'package:app_maquinista/model/users.dart';
import 'package:flutter/cupertino.dart';

class Companies{
  String name;
  User agent;
  String stand;

  Companies(
      this.name,
      this.agent,
      this.stand
      );
  factory Companies.fromJson (Map<String, dynamic> com){
    return Companies(com["companyName"], User(com["asistenteNombre"],"",Role.COMPANIE), "");
  }
}