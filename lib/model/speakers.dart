class Speakers{
  String name;
  String surname1;
  String surname2;
  String biography;
  DateTime birthdate;
  Speakers(
      this.name,
      this.biography,
      this.birthdate,
      this.surname1,
      this.surname2,
      );
  String get_all_name(){
    return this.name + " " + this.surname1 + " " + this.surname2;
  }
}