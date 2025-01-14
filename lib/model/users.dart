import 'package:app_maquinista/model/roles.dart';

class User {
  String userName;
  String password;
  Role role;
  User(
      this.userName,
      this.password,
      this.role
      );
}