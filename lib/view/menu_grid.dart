import 'package:flutter/material.dart';
import 'package:restaurant_app/controller/breakpoint.dart';
import 'package:restaurant_app/model/restaurant.dart';

class MenuGrid extends StatelessWidget {
  final List<MenuItem> menus;
  final bool isFood;
  const MenuGrid({super.key, required this.menus, required this.isFood});

  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: RestaurantGridCount(context),
        childAspectRatio: 1.3
      ),
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(16),
            child: Card(
              color: Colors.transparent,
              elevation: 0,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                    image: AssetImage(isFood ? "assets/food.jpg" : "assets/drink.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.black.withOpacity(0.5),
                  ),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: FittedBox(
                        fit: BoxFit.fill,
                        child: Text(
                          menus[index].name,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
        childCount: menus.length,
      )
    );
  }
}
