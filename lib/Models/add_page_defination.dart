import 'dart:io';

class AddPage {
  final String id;
  final String title;
  final String description;
  final String price;
  final File image;

  AddPage({
    this.description,
    this.id,
    this.image,
    this.price,
    this.title,
  });
}
