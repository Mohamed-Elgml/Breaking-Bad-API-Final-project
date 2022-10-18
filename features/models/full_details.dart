import 'character.dart';

class FullDetails extends Character {
  final String nickname;
  final String birthday;
  final String status;

  FullDetails({
    int id,
    String name,
    String image,
    this.nickname, this.birthday, this.status,
  }) : super(image: image, name: name, id: id);
}
