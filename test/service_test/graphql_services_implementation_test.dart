import 'package:flutter_test/flutter_test.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:graphql_test/service/graphql_services_implementation.dart';
import 'package:mocktail/mocktail.dart';

class MockGraphQlService extends Mock implements GraphQlService {}

class MockGraphQLClient extends Mock implements GraphQLClient {}

class MockQueryResult extends Mock implements QueryResult {}

class FakeUri extends Fake implements Uri {}

void main() {
  group("motty models test", () {
    late MockGraphQlService mockGraphQlService;
    late MockGraphQLClient mockGraphQLClient;
    late MockQueryResult mockQueryResult;

    setUpAll(() {
      registerFallbackValue(FakeUri());
    });

    setUp(() {
      final mockGraphQlService = MockGraphQlService();
      final mockGraphQLClient = MockGraphQLClient();
      final mockQueryResult = MockQueryResult();
    });

    test(
      "test value equality",
      () {},
    );
  });
}
