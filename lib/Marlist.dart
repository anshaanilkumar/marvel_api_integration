import 'dart:convert';
Marlist marlistFromJson(String str) => Marlist.fromJson(json.decode(str));
String marlistToJson(Marlist data) => json.encode(data.toJson());

class Marlist {
  Marlist({
    this.name,
    this.realname,
    this.team,
    this.firstappearance,
    this.createdby,
    this.publisher,
    this.imageurl,
    this.bio,
  });

  // Fields
  String? name;
  String? realname;
  String? team;
  String? firstappearance;
  String? createdby;
  String? publisher;
  String? imageurl;
  String? bio;

  factory Marlist.fromJson(Map<String, dynamic> json) => Marlist(
    name: json['name'] ?? 'Unknown',
    realname: json['realname'],
    team: json['team'],
    firstappearance: json['firstappearance'],
    createdby: json['createdby'],
    publisher: json['publisher'],
    imageurl: json['imageurl'],
    bio: json['bio'],
  );


  Map<String, dynamic> toJson() => {
    'name': name,
    'realname': realname,
    'team': team,
    'firstappearance': firstappearance,
    'createdby': createdby,
    'publisher': publisher,
    'imageurl': imageurl,
    'bio': bio,
  };
}
