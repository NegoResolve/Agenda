class Contact {
  bool isFavorite;
  final String name;
  final String photo;
  final String phone;
  final String email;

  Contact(
      {this.isFavorite = false,
      required this.name,
      required this.photo,
      required this.phone,
      required this.email});
}
