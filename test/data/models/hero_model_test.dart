import 'package:flutter_test/flutter_test.dart';
import 'package:sary_challenge/features/manage_heros/data/models/models.dart';

void main() {
  test("Construct HeroModel from json", () {
    Map<String, dynamic> json = {
      "id": 5,
      "name": "Fat Gum",
      "picUrl":
          "https://64.media.tumblr.com/f93d817c579f698556aeec15849cb23c/445ce579c4d0cd97-25/s250x250_c1/9e160676998665ddca748d631e0b3e31ae7e6eee.jpg",
      "rating": 4,
      "description":
          "Taishiro Toyomitsu , also known as BMI Hero: Fat Gum, is the current No. 58 Pro Hero. He employed Tamaki Amajiki and Eijiro Kirishima during the Shie Hassaikai Arc.",
      "powers": [
        {
          "title": "Fat Absorption",
          "type": {"id": 2, "title": "Defense", "color": "#578fff"}
        }
      ]
    };
    // Factory used to construct object from json
    HeroModel heroModel = HeroModel.fromJson(json);
    // Check if the type is TypeModel
    expect(heroModel, isA<HeroModel>());
  });
}
