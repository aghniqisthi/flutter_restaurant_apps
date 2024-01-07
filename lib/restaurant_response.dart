import 'dart:convert';

class Restaurants {
  final List<RestaurantsItem> restaurants;

  Restaurants({
    required this.restaurants,
  });

  factory Restaurants.fromJson(Map<String, dynamic> data) => Restaurants(
    restaurants: data["restaurants"] = List<RestaurantsItem>.from(data["restaurants"].map((x) => RestaurantsItem.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    'restaurants': restaurants.map((e) => e.toJson()).toList(),
  };
}

class RestaurantsItem {
  final String id;
  final String name;
  final String description;
  final String pictureId;
  final String city;
  final double rating;
  final Menus menus;

  RestaurantsItem({
    required this.id ,
    required this.name ,
    required this.description ,
    required this.pictureId ,
    required this.city ,
    required this.rating,
    required this.menus,
  });

  factory RestaurantsItem.fromJson(Map<String, dynamic> data) => RestaurantsItem(
    id: data['id'],
    name: data['name'],
    description: data['description'],
    pictureId: data['pictureId'],
    city: data['city'],
    rating: data['rating'].toDouble(),
    menus: Menus.fromJson(data['menus']),
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'description': description,
    'pictureId': pictureId,
    'city': city,
    'rating': rating,
    'menus': menus.toJson(),
  };
}

class Menus {
  final List<FoodsItem> foods;
  final List<DrinksItem> drinks;

  Menus({
    required this.foods,
    required this.drinks,
  });

  factory Menus.fromJson(Map<String, dynamic> data) => Menus(
    foods: data["foods"] = List<FoodsItem>.from(data["foods"].map((x) => FoodsItem.fromJson(x))),
    drinks: data["drinks"] = List<DrinksItem>.from(data["drinks"].map((x) => DrinksItem.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    'foods': foods.map((e) => e.toJson()).toList(),
    'drinks': drinks.map((e) => e.toJson()).toList(),
  };
}

class FoodsItem {
  // Salad yuzu
  final String name;

  FoodsItem({
    required this.name,
  });

  factory FoodsItem.fromJson(Map<String, dynamic> json) => FoodsItem(
    name: json['name'],
  );

  Map<String, dynamic> toJson() => {
    'name': name,
  };
}


class DrinksItem {
  final String name;

  DrinksItem({
    required this.name,
  });

  factory DrinksItem.fromJson(Map<String, dynamic> json) => DrinksItem(
    name: json['name'],
  );

  Map<String, dynamic> toJson() => {
    'name': name,
  };
}

List<RestaurantsItem> parseRestaurantsItem(String json) {
  return Restaurants.fromJson(jsonDecode(json)).restaurants;
}


