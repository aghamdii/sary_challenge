import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:sary_challenge/features/manage_heros/data/models/models.dart';
import 'package:sary_challenge/features/manage_heros/domain/repositories/repositories.dart';

// This class is the implementation of the repository's blueprint

class HeroesRepositoryImplementation extends HeroesRepository {
  @override
  Future<List<HeroModel>> fetchHeros() async {
    try {
      // Add delay to simulate real network call
      await Future.delayed(Duration(
        seconds: 3,
      ));

      // Read json from in-project file instead of real database
      final String response =
          await rootBundle.loadString('assets/heroes_list.json');
      final data = await json.decode(response);

      var list = data["heroes"] as List;

      // Construct HeroModel list from the json file
      List<HeroModel> heroesList =
          list.map((element) => HeroModel.fromJson(element)).toList();

      return heroesList;
    } catch (e) {
      throw Exception();
    }
  }
}
