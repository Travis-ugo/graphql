import 'package:graphql_flutter/graphql_flutter.dart';

class GraphQlConfig {
  static HttpLink httpLink = HttpLink(
      "https://rickandmortyapi.com/graphql"); // https://rickandmortyapi.com/

  GraphQLClient clientQuery() {
    return GraphQLClient(link: httpLink, cache: GraphQLCache());
  }
}
