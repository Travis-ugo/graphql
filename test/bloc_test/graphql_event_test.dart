part of 'graphql_bloc_test.dart';

class GraphqlEvent extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}


class CounterBlocGraphqlApiCallEvent extends GraphqlEvent {}
class GetCharacterGraphqlApiCallEvent extends GraphqlEvent {}

class DeleteCharacterGraphqlApiCallEvent extends GraphqlEvent {
  final String id;

  DeleteCharacterGraphqlApiCallEvent({required this.id});

  @override
  // TODO: implement props
  List<Object?> get props => [id];
}

class CreateCharacterGraphqlApiCallEvent extends GraphqlEvent {
  final String name;
  final String gender;
  final String type;
  final String image;

  CreateCharacterGraphqlApiCallEvent({
    required this.name,
    required this.gender,
    required this.type,
    required this.image,
  });
  @override
  // TODO: implement props
  List<Object?> get props => [
        name,
        gender,
        type,
        image,
      ];
}

class UpdateCharacterGraphqlApiCallEvent extends GraphqlEvent {
  final String id;
  final String name;
  final String gender;
  final String type;
  final String image;

  UpdateCharacterGraphqlApiCallEvent({
    required this.id,
    required this.name,
    required this.gender,
    required this.type,
    required this.image,
  });
  @override
  // TODO: implement props
  List<Object?> get props => [
        id,
        name,
        gender,
        type,
        image,
      ];
}
