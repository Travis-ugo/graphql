import 'package:equatable/equatable.dart';

class MottyModels extends Equatable {
  final String id;
  final String name;
  final String gender;
  final String type;
  final String image;

  const MottyModels({
    required this.id,
    required this.name,
    required this.gender,
    required this.type,
    required this.image,
  });

  static MottyModels fromMap({required Map mottyMap}) => MottyModels(
        id: mottyMap['id'],
        name: mottyMap['name'],
        type: mottyMap['type'],
        gender: mottyMap['gender'],
        image: mottyMap['image'],
      );

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
