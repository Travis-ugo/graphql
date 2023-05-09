import 'package:flutter_test/flutter_test.dart';
import 'package:graphql_test/domain/motty_models.dart';

void main() {
  group("motty models test", () {
    const String id = "ID";
    const String name = "Travis Okonicha";
    const String gender = "Male";
    const String type = "Anime";
    const String image = "URl";

    test(
      "test value equality",
      () {
        expect(
          const MottyModels(
              id: id, name: name, gender: gender, type: type, image: image),
          equals(
            const MottyModels(
                id: id, name: name, gender: gender, type: type, image: image),
          ),
        );
      },
    );
  });
}
