import 'package:flutter_test/flutter_test.dart';
import 'package:sary_challenge/features/manage_heros/data/models/models.dart';
import 'package:sary_challenge/features/manage_heros/data/repositories/repositories.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  test("Read types list from database", () async {
    // Perform the db call
    var requestResult = await TypesRepositoryImplementation().fetchTypes();

    // If the return type is the list and not an exception, then the request created successfuly
    expect(requestResult, isA<List<TypeModel>>());
  });
}
