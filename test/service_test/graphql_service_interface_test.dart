
import 'package:graphql_test/domain/motty_models.dart';

abstract class GraphQlServiceInterface {
  Future<List<MottyModels>> getCharacters();
  Future<bool> deleteCharacters({required String id, int number = 6});

  Future<bool> createCharacters({
    required String title,
    required String author,
    required String year,
  });

  Future<bool> updateCharacters({
    required String title,
    required String author,
    required String year,
    required String id,
  });
}