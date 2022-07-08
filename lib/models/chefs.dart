class Chefs
{
  String? name;
  String? uid;
  String? photoUrl;
  String? email;
  String? ratings;

  Chefs({
    this.name,
    this.uid,
    this.photoUrl,
    this.email,
    this.ratings,
  });

  Chefs.fromJson(Map<String, dynamic> json)
  {
    name = json["name"];
    uid = json["uid"];
    photoUrl = json["photoUrl"];
    email = json["email"];
    ratings = json["ratings"];
  }
}