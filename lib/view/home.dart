import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant_app/controller/breakpoint.dart';
import 'package:restaurant_app/controller/controller.dart';
import 'package:restaurant_app/model/restaurant.dart';
import 'package:restaurant_app/view/restaurant_card.dart';

class HomeScreen extends StatelessWidget {
  final List<Restaurant> restaurants;
  HomeScreen({super.key, required this.restaurants});

  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final ThemeController theme = Get.put(ThemeController());
    final RestaurantController restaurantController = Get.put(RestaurantController());
    final RxString searchQuery = ''.obs;

    restaurantController.restaurants.assignAll(restaurants);
    restaurantController.filteredRestaurants.assignAll(restaurants);

    restaurantController.filterRatingRestaurants();
    restaurantController.filterNearYouRestaurants();
    restaurantController.filterSurabayaRestaurants();

    return Obx((){
      return Scaffold(
        backgroundColor: theme.getTheme().backgroundColor,
        appBar: AppBar(
          backgroundColor: theme.getTheme().backgroundColor,
          title: Text(
            'Restaurants App',
            style: TextStyle(
              color: theme.getTheme().textColor,
              fontWeight: FontWeight.bold
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 8),
              child: IconButton(
                onPressed:(){
                  theme.toggleTheme();
                },
                icon: Icon(
                  theme.isDark.value ? Icons.dark_mode : Icons.light_mode,
                  color: theme.getTheme().textColor,
                )
              ),
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 12),
                TextField(
                  controller: searchController,
                  cursorColor: theme.getTheme().primaryColor,
                  onChanged: (value) {
                    restaurantController.filterRestaurants(value);
                    searchQuery.value = value;
                  },
                  decoration: InputDecoration(
                    hintText: 'Search...',
                    hintStyle: TextStyle(
                      color: theme.getTheme().textColor.withOpacity(0.5),
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: theme.getTheme().textColor
                      ),
                      borderRadius: BorderRadius.circular(30)
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: theme.getTheme().primaryColor
                      ),
                      borderRadius: BorderRadius.circular(30)
                    ),
                  ),
                  style: TextStyle(
                    color: theme.getTheme().textColor,
                  ),
                ),
                const SizedBox(height: 12),
                searchQuery.value.isNotEmpty ?
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: RestaurantGridCount(context),
                      childAspectRatio: 1,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10
                    ),
                    itemCount: restaurantController.filteredRestaurants.length,
                    itemBuilder: (context, index) {
                      return RestaurantCard(restaurant: restaurantController.filteredRestaurants[index]);
                    }
                  )
                    :
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 10),
                      Text(
                        "Top Rating",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: theme.getTheme().textColor
                        ),
                      ),
                      const SizedBox(height: 10),
                      CarouselSlider.builder(
                        itemCount: restaurantController.highRatingRestaurants.length,
                        options: CarouselOptions(
                          enableInfiniteScroll: false,
                          padEnds: false
                        ),
                        itemBuilder: (BuildContext context, int index, int realIndex) {
                          return RestaurantCard(
                            restaurant: restaurantController.highRatingRestaurants[index],
                          );
                        },
                      ),
                      const SizedBox(height: 10),
                      Text(
                        "Near You",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: theme.getTheme().textColor
                        ),
                      ),
                      const SizedBox(height: 10),
                      CarouselSlider.builder(
                        itemCount: restaurantController.nearYouRestaurants.length,
                        options: CarouselOptions(
                          enableInfiniteScroll: false,
                          padEnds: false
                        ),
                        itemBuilder: (BuildContext context, int index, int realIndex) {
                          return RestaurantCard(
                            restaurant: restaurantController.nearYouRestaurants[index],
                          );
                        },
                      ),
                      const SizedBox(height: 10),
                      Text(
                        "At Surabaya",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: theme.getTheme().textColor
                        ),
                      ),
                      const SizedBox(height: 10),
                      CarouselSlider.builder(
                        itemCount: restaurantController.surabayaRestaurants.length,
                        options: CarouselOptions(
                          enableInfiniteScroll: false,
                          padEnds: false
                        ),
                        itemBuilder: (BuildContext context, int index, int realIndex) {
                          return RestaurantCard(
                            restaurant: restaurantController.surabayaRestaurants[index],
                          );
                        },
                      )
                    ],
                  )
              ],
            ),
          ),
        ),
      );
    });
  }
}
