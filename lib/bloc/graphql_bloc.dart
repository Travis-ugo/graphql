import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:graphql_test/service/graphql_services_implementation.dart';

part 'graphql_event.dart';
part 'graphql_state.dart';

class GraphqlBloc extends Bloc<GraphqlEvent, GraphqlState> {
  
  final GraphQlService graphQlService;
  
  GraphqlBloc(  { required this.graphQlService,}) : super(const GraphqlState()) {
    on<CounterBlocGraphqlApiCallEvent>(onCounterBlocGraphqlApiCallEvent);
    on<GetCharacterGraphqlApiCallEvent>(onGraphqlApiCallEvent);
    on<DeleteCharacterGraphqlApiCallEvent>(onDeleteCharacterGraphqlApiCallEvent);
    on<CreateCharacterGraphqlApiCallEvent>(onCreateCharacterGraphqlApiCallEvent);
    on<UpdateCharacterGraphqlApiCallEvent>(onUpdateCharacterGraphqlApiCallEvent);
  }
  List mottyList = [];

  void onCounterBlocGraphqlApiCallEvent(CounterBlocGraphqlApiCallEvent event, Emitter<GraphqlState> emit){

    print("butto pressed");

    emit(state.copyWith(
      counter: state.counter + 1,
    ));
  }
  void onGraphqlApiCallEvent(
      GetCharacterGraphqlApiCallEvent event, Emitter<GraphqlState> emit) async {
    mottyList = await graphQlService.getCharacters();
    emit(state.copyWith(
      mutableList: mottyList,
    ));
  }

  void onDeleteCharacterGraphqlApiCallEvent(
      DeleteCharacterGraphqlApiCallEvent event,
      Emitter<GraphqlState> emit) async {
    mottyList = await graphQlService.getCharacters();
    emit(state.copyWith(
      mutableList: mottyList,
    ));
  }

  void onCreateCharacterGraphqlApiCallEvent(
      CreateCharacterGraphqlApiCallEvent event,
      Emitter<GraphqlState> emit) async {
    mottyList = await graphQlService.getCharacters();
    emit(state.copyWith(
      mutableList: mottyList,
    ));
  }

  void onUpdateCharacterGraphqlApiCallEvent(
      UpdateCharacterGraphqlApiCallEvent event,
      Emitter<GraphqlState> emit) async {
    mottyList = await graphQlService.getCharacters();
    emit(state.copyWith(
      mutableList: mottyList,
    ));
  }
}
