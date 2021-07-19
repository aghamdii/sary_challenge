import 'package:flutter/material.dart';
import 'package:sary_challenge/features/manage_heros/domain/entities/entities.dart';

class TypeModel extends TypeEntity {
  TypeModel({@required String title, @required String color, @required int id})
      : super(title: title, color: color, id: id);

  // Factory used to construct object from a map "json" file
  factory TypeModel.fromJson(Map<String, dynamic> json) {
    return TypeModel(
        title: json["title"], color: json["color"], id: json["id"]);
  }

  // Factory used to convert the object to a map "json" file
  Map<String, dynamic> toJson() {
    return {
      "id": this.id,
      "title": this.title,
      "color": this.color,
    };
  }
}
