import 'package:flutter_test/flutter_test.dart';
import 'package:sary_challenge/features/manage_heros/data/models/models.dart';

void main() {
  test("Construct TypeModel from json", () {
    Map<String, dynamic> json = {"title": "Defense", "color": "Green"};
    // Factory used to construct object from json
    TypeModel typeModel = TypeModel.fromJson(json);
    // Check if the type is TypeModel
    expect(typeModel, isA<TypeModel>());
  });
}
