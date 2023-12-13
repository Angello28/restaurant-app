import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';

import 'package:restaurant_app/model/restaurant.dart';

Future<List<Restaurant>> loadAndParseRestaurants() async {
  try {
    String jsonString = await rootBundle.loadString('assets/local_restaurant.json');
    List<dynamic> restaurantsData = json.decode(jsonString)['restaurants'];

    List<Restaurant> restaurants = restaurantsData
      .map((json) => Restaurant.fromJson(json))
      .toList();

    return restaurants;
  }
  catch (e) {
    if (kDebugMode) {
      print('Error loading and parsing local restaurant data: $e');
    }
    return [];
  }
}
