import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:graphql_test/bloc/graphql_bloc.dart';
import 'package:graphql_test/domain/motty_models.dart';
import 'package:graphql_test/presentation/view.dart';
import 'package:bloc/bloc.dart';
import 'package:graphql_test/service/graphql_config.dart';
import 'package:graphql_test/service/graphql_services_implementation.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    GraphQlConfig graphQlConfig = GraphQlConfig(); 
  GraphQLClient client = graphQlConfig.clientQuery();
    return BlocProvider(
      create: (context) => GraphqlBloc(  graphQlService: GraphQlService(client: client))..add(GetCharacterGraphqlApiCallEvent()),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}
