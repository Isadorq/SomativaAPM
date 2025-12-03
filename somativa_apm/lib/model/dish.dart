class Dish {
  final String id;
  final String name;
  final String description;
  final double price;
  final String imageUrl;
  final String restaurant;

  Dish({
    String? id,
    required this.name,
    required this.description,
    required this.price,
    required this.imageUrl,
    required this.restaurant,
  }) : id = id ?? '${restaurant}_${name}'.toLowerCase().replaceAll(' ', '_');
}
