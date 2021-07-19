import 'package:flutter_test/flutter_test.dart';
import 'package:sary_challenge/features/manage_heros/data/models/models.dart';
import 'package:sary_challenge/features/manage_heros/data/repositories/repositories.dart';
import 'package:sary_challenge/features/manage_heros/presentation/providers/providers.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  group("Heroes provider filtering", () {
    // Initialize empty provider
    HeroesProvider heroesProvider = new HeroesProvider();
    List<HeroModel> heroesList;

    // This function will be fired before performing any group test
    setUp(() async {
      // This call should not be from a real database
      heroesList = await HeroesRepositoryImplementation().fetchHeros();
      heroesProvider.setHeroesList(heroesList);
    });

    test("Initialize the provider's heroes list", () {
      // 5 is the number of objects returned from the mocked db call
      expect(heroesProvider.filteredList.length, 5);
    });

    test("Filter hero by name", () {
      heroesProvider.filterHeroByName("r", []);
      // There are two heroes with an "r" letter in their name
      expect(heroesProvider.filteredList.length, 2);
    });

    test("Filter hero by power type", () {
      // 2 is the id of "Defense" type
      heroesProvider.filterHeroByTypes([2]);
      // There are three heroes with a defensive power type
      expect(heroesProvider.filteredList.length, 3);
    });
  });
}
