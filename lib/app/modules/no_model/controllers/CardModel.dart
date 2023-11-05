import 'dart:ffi';

class CardModel {
  CardModel({
    required this.id,
    required this.image,
    required this.title,
    required this.description,
  });

  String id;
  String image;
  String title;
  String description;
}
