import 'package:flutter_test/flutter_test.dart';
import 'package:sary_challenge/features/manage_heros/presentation/providers/providers.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  group("Types provider functionalities", () {
    // Initialize empty provider
    TypesProvider typesProvider = new TypesProvider();

    // This function fires before performing the group test
    setUp(() {
      typesProvider.setSelectedTypesIds([]);
    });

    test("Add type id", () {
      typesProvider.addTypeId(1);
      expect(typesProvider.selectedTypesIds[0], 1);
    });

    test("Remove type id", () {
      typesProvider.addTypeId(1);
      typesProvider.removeTypeId(1);
      expect(typesProvider.selectedTypesIds.length, 0);
    });
  });
}
