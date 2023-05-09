// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'graphql_bloc_test.dart';

class GraphqlState extends Equatable {
  final List mutableList;
  final int counter;

  const GraphqlState({
    this.mutableList = const [],
    this.counter = 0,
  });

  @override
  List<Object?> get props => [mutableList, counter];

  GraphqlState copyWith({List? mutableList, int? counter}) {
    return GraphqlState(
      mutableList: mutableList ?? this.mutableList,
      counter: counter ?? this.counter,
    );
  }
}
