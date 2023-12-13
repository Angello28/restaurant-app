import 'package:get/get.dart';
import 'package:restaurant_app/model/restaurant.dart';
import 'package:restaurant_app/model/theme_color.dart';

class TruncateTextController extends GetxController {
  var isExpanded = false.obs;

  void toggleExpansion() {
    isExpanded.value = !isExpanded.value;
  }
}

class ThemeController extends GetxController {
  var isDark = false.obs;

  void toggleTheme(){
    isDark.value = !isDark.value;
  }

  ThemeColor getTheme(){
    if(isDark.value){
      return darkTheme;
    }
    else{
      return lightTheme;
    }
  }
}

class RestaurantController extends GetxController {
  RxList<Restaurant> restaurants = <Restaurant>[].obs;
  RxList<Restaurant> filteredRestaurants = <Restaurant>[].obs;
  RxList<Restaurant> highRatingRestaurants = <Restaurant>[].obs;
  RxList<Restaurant> nearYouRestaurants = <Restaurant>[].obs;
  RxList<Restaurant> surabayaRestaurants = <Restaurant>[].obs;

  void filterRestaurants(String searchText) {
    if (searchText.isEmpty) {
      filteredRestaurants.assignAll(restaurants);
    }
    else {
      filteredRestaurants.assignAll(restaurants.where(
        (restaurant) => restaurant.name.toLowerCase().contains(searchText.toLowerCase()))
      );
    }
  }

  void filterRatingRestaurants() {
    highRatingRestaurants.assignAll(restaurants.where(
      (restaurant) => restaurant.rating > 4)
    );
    highRatingRestaurants.sort((a, b) => b.rating.compareTo(a.rating));
  }

  void filterNearYouRestaurants() {
    nearYouRestaurants.assignAll(restaurants.where(
        (restaurant) => restaurant.city == "Medan")
    );
  }

  void filterSurabayaRestaurants() {
    surabayaRestaurants.assignAll(restaurants.where(
      (restaurant) => restaurant.city == "Surabaya")
    );
  }
}