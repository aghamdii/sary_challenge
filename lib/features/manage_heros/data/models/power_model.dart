import 'package:flutter/material.dart';
import 'package:sary_challenge/features/manage_heros/data/models/models.dart';
import 'package:sary_challenge/features/manage_heros/domain/entities/entities.dart';

class PowerModel extends PowerEntity {
  PowerModel({@required String title, @required TypeModel type})
      : super(title: title, type: type);

  // Factory used to construct object from a map "json" file
  factory PowerModel.fromJson(Map<String, dynamic> json) {
    return PowerModel(
      title: json["title"],
      type: TypeModel.fromJson(json["type"]),
    );
  }
  // Factory used to convert the object to a map "json" file
  Map<String, dynamic> toJson() {
    return {
      "title": this.title,
      "type": this.type.toJson(),
    };
  }
}
