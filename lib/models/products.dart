class Product {
  bool onSale;
  final int id;
  final String name;
  final String category;
  final String image;
  final String description;
  final String price;
  late int quantity;

  Product(
      {required this.onSale,
      required this.id,
      required this.name,
      required this.category,
      required this.image,
      required this.description,
      required this.price});
}
