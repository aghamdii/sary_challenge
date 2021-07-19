import 'package:flutter/material.dart';
import 'package:sary_challenge/features/manage_heros/data/models/models.dart';
import 'package:sary_challenge/features/manage_heros/domain/entities/entities.dart';

class HeroModel extends HeroEntity {
  HeroModel(
      {@required String name,
      @required String picUrl,
      @required String description,
      @required int rating,
      @required int id,
      @required List<PowerModel> powers})
      : super(
          name: name,
          picUrl: picUrl,
          rating: rating,
          id: id,
          powers: powers,
          description: description,
        );

  // Factory used to construct object from a map "json" file
  factory HeroModel.fromJson(Map<String, dynamic> json) {
    return HeroModel(
      id: json["id"],
      name: json["name"],
      picUrl: json["picUrl"],
      description: json["description"],
      rating: json["rating"],
      powers: parsePowers(json),
    );
  }

  // Function to convert the object to a map "json"
  Map<String, dynamic> toJson() {
    return {
      "id": this.id,
      "name": this.name,
      "description": this.description,
      "picUrl": this.picUrl,
      "rating": this.rating,
      "powers": powers.map((PowerModel power) => power.toJson()),
    };
  }

  // Helper function to parse a list of PowerModel objects
  static List<PowerModel> parsePowers(Map<String, dynamic> json) {
    var list = json["powers"] as List;
    if (list == null) {
      return [];
    } else {
      List<PowerModel> powers =
          list.map((power) => PowerModel.fromJson(power)).toList();
      return powers;
    }
  }
}
