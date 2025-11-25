import 'package:somativa_apm/model/dish.dart';

class Restaurant {
  String id;
  String imagePath;
  String name;
  String description;
  double stars;
  int distance;
  List<String> categories;
  List<Dish> dishes;

  Restaurant({
    required this.id,
    required this.imagePath,
    required this.name,
    required this.description,
    required this.stars,
    required this.distance,
    required this.categories,
    required this.dishes,
  });

  factory Restaurant.fromMap(Map<String, dynamic> map) {
    return Restaurant(
      id: map['id'],
      imagePath: map['imagePath'],
      name: map['name'],
      description: map['description'],
      stars: map['stars'] is int
          ? (map['stars'] as int).toDouble()
          : map['stars'],
      distance: map['distance'],
      categories: List<String>.from(map['categories']),
      dishes: List<Dish>.from(
        map['dishes'].map((dish) => Dish.fromMap(dish)),
      ),
    );
  }
}
