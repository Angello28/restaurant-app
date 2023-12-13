import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant_app/controller/controller.dart';
import 'package:restaurant_app/model/restaurant.dart';
import 'package:restaurant_app/view/menu_grid.dart';

class DetailScreen extends StatelessWidget {
  final Restaurant restaurant;
  const DetailScreen({super.key, required this.restaurant});

  @override
  Widget build(BuildContext context) {
    final TruncateTextController controller = Get.put(TruncateTextController());
    final ThemeController theme = Get.put(ThemeController());

    return Obx((){
      return Scaffold(
        backgroundColor: theme.getTheme().backgroundColor,
        body: CustomScrollView(
          shrinkWrap: true,
          slivers: [
            SliverAppBar(
              backgroundColor: theme.getTheme().backgroundColor,
              expandedHeight: MediaQuery.of(context).size.height / 3,
              flexibleSpace: FlexibleSpaceBar(
                background: Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(24),
                      bottomRight: Radius.circular(24),
                    ),
                    image: DecorationImage(
                      image: NetworkImage(restaurant.pictureId),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              leading: IconButton(
                onPressed: (){
                  Navigator.of(context).pop();
                },
                icon: Icon(Icons.arrow_back),
                color: Colors.black,
                style: IconButton.styleFrom(
                  backgroundColor: Colors.white
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      restaurant.name,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: theme.getTheme().textColor
                      ),
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        const Icon(Icons.star, color: Colors.amber, size: 16),
                        const SizedBox(width: 4),
                        Text(
                          restaurant.rating.toString(),
                          style: TextStyle(
                            fontSize: 16,
                            color: theme.getTheme().textColor
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        Icon(
                          Icons.location_on,
                          color: theme.getTheme().textColor,
                          size: 16
                        ),
                        const SizedBox(width: 4),
                        Text(
                          restaurant.city,
                          style: TextStyle(
                            fontSize: 16,
                            color: theme.getTheme().textColor
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Text(
                            restaurant.description,
                            textAlign: TextAlign.justify,
                            maxLines: controller.isExpanded.value ? restaurant.description.length : 3,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: theme.getTheme().textColor
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            controller.toggleExpansion();
                          },
                          child: Text(
                            controller.isExpanded.value ? 'less' : 'more',
                            style: TextStyle(color: theme.getTheme().primaryColor),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Foods",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: theme.getTheme().textColor
                      ),
                    ),
                  ],
                ),
              ),
            ),
            MenuGrid(menus: restaurant.foods, isFood: true),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Drinks",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: theme.getTheme().textColor
                      ),
                    ),
                  ],
                ),
              ),
            ),
            MenuGrid(menus: restaurant.drinks, isFood: false)
          ],
        )
      );
    });
  }
}
