import 'package:flutter_test/flutter_test.dart';
import 'package:sary_challenge/features/manage_heros/data/models/models.dart';

void main() {
  test("Construct PowerModel from json", () {
    Map<String, dynamic> json = {
      "title": "Fat Absorption",
      "type": {"id": 2, "title": "Defense", "color": "#578fff"}
    };
    // Factory used to construct object from json
    PowerModel powerModel = PowerModel.fromJson(json);
    // Check if the type is TypeModel
    expect(powerModel, isA<PowerModel>());
  });
}
