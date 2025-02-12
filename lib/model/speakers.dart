class Speakers{
  String name;
  String surname1;
  String surname2;
  String biography;
  Speakers(
      this.name,
      this.biography,
      this.surname1,
      this.surname2,
      );
  String get_all_name(){
    return this.name + " " + this.surname1 + " " + this.surname2;
  }
  factory Speakers.fromjson(Map<String, dynamic> speaker){
    return Speakers(speaker["name"], speaker["description"], speaker["surname1"] , speaker["surname2"]);
  }
}