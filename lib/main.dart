import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:restaurant_app/controller/controller.dart';
import 'package:restaurant_app/view/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Restaurant App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        textTheme: GoogleFonts.jostTextTheme()
      ),
      debugShowCheckedModeBanner: false,
      initialBinding: BindingsBuilder((){
        Get.put(TruncateTextController());
        Get.put(ThemeController());
        Get.put(RestaurantController());
      }),
      home: const SplashScreen(),
    );
  }
}
