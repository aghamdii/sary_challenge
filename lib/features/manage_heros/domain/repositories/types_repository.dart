import 'package:sary_challenge/features/manage_heros/data/models/models.dart';

abstract class TypesRepository {
  // Should return all types from the database
  Future<List<TypeModel>> fetchTypes();
}
