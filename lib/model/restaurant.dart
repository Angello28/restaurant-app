class MenuItem {
  final String name;
  MenuItem({required this.name});
}

class Restaurant {
  final String id;
  final String name;
  final String description;
  final String pictureId;
  final String city;
  final double rating;
  final List<MenuItem> foods;
  final List<MenuItem> drinks;

  Restaurant({
    required this.id,
    required this.name,
    required this.description,
    required this.pictureId,
    required this.city,
    required this.rating,
    required this.foods,
    required this.drinks,
  });

  factory Restaurant.fromJson(Map<String, dynamic> json) {
    var foodsList = <MenuItem>[];
    var drinksList = <MenuItem>[];

    for(var food in json['menus']['foods']){
      foodsList.add(MenuItem(name: food['name']));
    }

    for(var drink in json['menus']['drinks']){
      drinksList.add(MenuItem(name: drink['name']));
    }

    return Restaurant(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      pictureId: json['pictureId'],
      city: json['city'],
      rating: json['rating'].toDouble(),
      foods: foodsList,
      drinks: drinksList,
    );
  }
}
