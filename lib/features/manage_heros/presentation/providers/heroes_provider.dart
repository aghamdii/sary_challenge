import 'package:flutter/material.dart';
import 'package:sary_challenge/features/manage_heros/data/models/models.dart';

class HeroesProvider extends ChangeNotifier {
  // Used to store heroes obtained from the database
  List<HeroModel> _heroesList = new List();
  // Used to store the list of the filtered heroes
  List<HeroModel> _filteredList = new List();
  // Used to store the latest state of hte filtered list
  List<HeroModel> _filteredListLastResult = new List();

  // Initialize the provider
  void setHeroesList(List<HeroModel> heroesList) {
    // Sort the heroes by name
    heroesList.sort((a, b) => a.name.compareTo(b.name));

    _heroesList = heroesList;
    _filteredList = heroesList;
    _filteredListLastResult = heroesList;
    notifyListeners();
  }

  // Get the list of heroes, it will return a copy of the list
  List<HeroModel> get heroesList {
    return [..._heroesList];
  }

  // Get the list of heroes, it will return a copy of the list
  List<HeroModel> get filteredList {
    return [..._filteredList];
  }

  // Filter and find the hero by name
  void filterHeroByName(String name, List<int> typesListIds) {
    _filteredList = _heroesList;

    // Entered name and the hero's name should be lowercase to filter
    _filteredList = _heroesList
        .where((hero) => hero.name.toLowerCase().contains(name.toLowerCase()))
        .toList();

    // Need to filter the names based on the selected power type, not all types
    if (typesListIds.length != 0) {
      filterHeroByTypes(typesListIds);
    }

    // To store the latest state of the filtered hero list
    _filteredListLastResult = [..._filteredList];
    notifyListeners();
  }

  // Filter and find the hero by powers' type
  void filterHeroByTypes(List<int> typesListIds) {
    if (typesListIds.length != 0) {
      print("This is triggered!");
      List<HeroModel> newFilteredList = new List();
      // Access each hero in the filtered list
      for (int i = 0; i < _filteredList.length; i++) {
        // Store a single hero in a variable
        HeroModel hero = _filteredList[i];

        // Access the hero's powers
        for (int j = 0; j < hero.powers.length; j++) {
          // If the power type id is in the "typesListIds" then add it to the list
          // And exist the loop and iterate the next hero
          if (typesListIds.contains(hero.powers[j].type.id)) {
            newFilteredList.add(hero);
            break;
          }
        }
      }
      // Update the provider list
      _filteredList = newFilteredList;
      notifyListeners();
    } else {
      // If no type is selected, get back to the lastest filtered hero list state
      _filteredList = _filteredListLastResult;
      notifyListeners();
    }
  }

  //
  void updateHeroRating({int heroId, int rating}) {
    // Find the hero by id
    var heroElement =
        _filteredList.where((element) => element.id == heroId).toList();

    // Update the hero's rating
    heroElement[0].rating = rating;
    notifyListeners();
  }
}
