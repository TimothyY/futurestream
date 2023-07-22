class User{

  int? id;
  String? name;
  int? rank;

  User({int? id, int? rank}){
    this.id = id;
    this.name = "User"+id.toString();
    this.rank = rank;
  }

}