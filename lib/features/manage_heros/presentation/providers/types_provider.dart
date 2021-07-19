import 'package:flutter/material.dart';
import 'package:sary_challenge/features/manage_heros/data/models/models.dart';

class TypesProvider extends ChangeNotifier {
  List<int> _selectedTypesIds = new List();

  List<int> get selectedTypesIds {
    return [..._selectedTypesIds];
  }

  void setSelectedTypesIds(List<int> selectedTypesIds) {
    _selectedTypesIds = selectedTypesIds;
    notifyListeners();
  }

  void addTypeId(int id) {
    _selectedTypesIds.add(id);
    notifyListeners();
  }

  void removeTypeId(int id) {
    _selectedTypesIds.remove(id);
    notifyListeners();
  }
}
