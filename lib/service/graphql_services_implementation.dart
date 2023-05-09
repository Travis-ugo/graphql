import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:graphql_test/domain/motty_models.dart';
import 'package:graphql_test/service/graphql_config.dart';
import 'package:graphql_test/service/graphql_service_interface.dart';

class GraphQlService implements GraphQlServiceInterface {
  final GraphQLClient client;

  GraphQlService({required this.client});

  @override
  Future<List<MottyModels>> getCharacters() async {
    try {
      QueryResult result = await client.query(
        QueryOptions(
          fetchPolicy: FetchPolicy.noCache,
          document: gql(
            """ 
          query {
              characters(\page: 6 ) {
                results {
                id
                name
                gender
                type
                image 
              }
            }
          }
          """,
          ),
        ),
      );
      if (result.hasException) {
        throw Exception(result.exception);
      }

      List? res = result.data!['characters']['results'];

      if (res == null || res.isEmpty) {
        return [];
      }

      List<MottyModels> mottyCharaters =
          res.map((motty) => MottyModels.fromMap(mottyMap: motty)).toList();

      return mottyCharaters;
    } catch (error) {
      throw Exception(error);
    }
  }

  @override
  Future<bool> deleteCharacters({required String id, int number = 6}) async {
    try {
      QueryResult result = await client.mutate(
        MutationOptions(
          fetchPolicy: FetchPolicy.noCache,
          variables: {"id": id},
          document: gql(
            """ 
          mutation {
              characters(\$page: $number ) {
                results {
                id
                name
                gender
                type
                image 
              }
            }
          }
          """,
          ),
        ),
      );
      if (result.hasException) {
        throw Exception(result.exception);
      } else {
        return true;
      }
    } catch (error) {
      return false;
    }
  }

  @override
  Future<bool> createCharacters({
    required String title,
    required String author,
    required String year,
  }) async {
    try {
      QueryResult result = await client.mutate(
        MutationOptions(
          fetchPolicy: FetchPolicy.noCache,
          variables: {"title": title, "author": author, "year": year},
          document: gql(
            """ 
          mutation {
              characters(\page: 6 ) {
                results {
                id
                name
                gender
                type
                image 
              }
            }
          }
          """,
          ),
        ),
      );
      if (result.hasException) {
        throw Exception(result.exception);
      } else {
        return true;
      }
    } catch (error) {
      return false;
    }
  }

  @override
  Future<bool> updateCharacters({
    required String title,
    required String author,
    required String year,
    required String id,
  }) async {
    try {
      QueryResult result = await client.mutate(
        MutationOptions(
          fetchPolicy: FetchPolicy.noCache,
          variables: {
            "id": id,
            "booInfo": {
              "title": title,
              "author": author,
              "year": year,
            },
          },
          document: gql(
            """ 
            mutation Mutation(\$id: ID!, \$bookInput: BookInput) {
              updateBook(ID: \$id, bookInput: \$bookInput)
            }
          """,
          ),
        ),
      );
      if (result.hasException) {
        throw Exception(result.exception);
      } else {
        return true;
      }
    } catch (error) {
      return false;
    }
  }
}
