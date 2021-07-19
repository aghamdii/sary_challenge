import 'package:sary_challenge/features/manage_heros/data/models/models.dart';

class HeroEntity {
  String name;
  String picUrl;
  String description;
  int rating;
  int id;
  List<PowerModel> powers;

  HeroEntity(
      {this.name,
      this.picUrl,
      this.powers,
      this.rating,
      this.id,
      this.description});
}
