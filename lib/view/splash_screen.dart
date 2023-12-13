import 'package:flutter/material.dart';
import 'package:restaurant_app/controller/load_data.dart';
import 'package:restaurant_app/model/restaurant.dart';
import 'package:restaurant_app/view/home.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  void toHomeScreen(context, List<Restaurant> restaurants) async {
    await Future.delayed(const Duration(seconds: 1));
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => HomeScreen(restaurants: restaurants)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<Restaurant>>(
        future: loadAndParseRestaurants(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Splash();
          }
          else if (snapshot.hasError) {
            return const Center(
              child: Text('Error loading data'),
            );
          }
          else {
            toHomeScreen(context, snapshot.data!);
            return const Splash();
          }
        },
      ),
    );
  }
}

class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      color: Color(0xFFFD6A02),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/logo.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: 20),
          Text(
            "Restaurant App",
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 36
            ),
          ),
          SizedBox(height: 60),
          Text(
            "by",
            style: TextStyle(
                color: Colors.white,
                fontSize: 16
            ),
          ),
          Text(
            "Rivaldi Lubis",
            style: TextStyle(
                color: Colors.white,
                fontSize: 16
            ),
          ),
        ],
      ),
    );
  }
}
