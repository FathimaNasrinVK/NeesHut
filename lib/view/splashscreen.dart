import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

import '../controller/splashcontrollerr.dart';
import '../utils/colors.dart';


class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final splashScreenProvider = Provider.of<SplashScreenProvider>(context);
    Future.delayed(Duration(seconds: 6), () {
      splashScreenProvider.setLoading(false);
    });

    return Scaffold(
      backgroundColor: AppColor.primary,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Text(
              "News Hut",
              style: GoogleFonts.fahkwang(
                  fontSize: 30, color: Colors.white),
            ),
            // if (splashScreenProvider.isLoading)
            //   LottieBuilder.asset(
            //     "aassets/animations/splshloading.json",
            //     // fit: BoxFit.cover,
            //     repeat: true,
            //     height: 150,
            //     width: 150,
            //   )
          ],
        ),
      ),
    );
  }
}