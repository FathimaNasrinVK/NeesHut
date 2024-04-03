import 'package:flutter/material.dart';
import 'package:newsapp/view/Bottomnav_bar/main-page.dart';
import 'package:newsapp/view/splashscreen.dart';
import 'package:provider/provider.dart';
import 'controller/bottom_nav_controller.dart';
import 'controller/category_controller.dart';
import 'controller/homescreen_controller.dart';
import 'controller/search_screeeen-controller.dart';
import 'controller/splashcontrollerr.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => SplashScreenProvider(),
          ),
          ChangeNotifierProvider(
            create: (context) => HomeScreenController(),
          ),
          ChangeNotifierProvider(
            create: (context) => SearchScreenController(),
          ),
          ChangeNotifierProvider(
            create: (context) => BottomNavController(),
          ),
          ChangeNotifierProvider(
            create: (context) => CategoryController(),
          )
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: Consumer<SplashScreenProvider>(
            builder: (context, splashScreenProvider, _) {
              return splashScreenProvider.isLoading
                  ? SplashPage()
                  : MainPage();
            },
          ),
        ));
  }
}