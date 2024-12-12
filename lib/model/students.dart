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
  String get_all_name(){
    return this.name + " " + this.surname_1 + " " + this.surname_2;
  }
}