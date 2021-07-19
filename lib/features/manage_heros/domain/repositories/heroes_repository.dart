import 'package:sary_challenge/features/manage_heros/data/models/models.dart';

abstract class HeroesRepository {
  // Should return all heroes from the database
  Future<List<HeroModel>> fetchHeros();
}
