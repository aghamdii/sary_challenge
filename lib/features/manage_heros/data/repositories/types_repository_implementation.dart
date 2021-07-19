import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:sary_challenge/features/manage_heros/data/models/models.dart';
import 'package:sary_challenge/features/manage_heros/domain/repositories/repositories.dart';

// This class is the implementation of the repository's blueprint

class TypesRepositoryImplementation extends TypesRepository {
  @override
  Future<List<TypeModel>> fetchTypes() async {
    // Read json from in-project file instead of real database
    final String response =
        await rootBundle.loadString('assets/types_list.json');
    final data = await json.decode(response);

    var list = data["types"] as List;
    // Construct TypeModel list from the json file
    List<TypeModel> typesList =
        list.map((element) => TypeModel.fromJson(element)).toList();

    return typesList;
  }
}
