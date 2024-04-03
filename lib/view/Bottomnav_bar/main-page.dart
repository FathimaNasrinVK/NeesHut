import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:molten_navigationbar_flutter/molten_navigationbar_flutter.dart';

import '../../controller/bottom_nav_controller.dart';
import '../../utils/colors.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Provider.of<BottomNavController>(context)
          .myPages[Provider.of<BottomNavController>(context).selectedIndex],
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(left: 5,right: 5),
        child: MoltenBottomNavigationBar(
          domeCircleColor: Colors.lightBlue[900],

          barColor: AppColor.primary,
          selectedIndex:
          Provider.of<BottomNavController>(context).selectedIndex,
               onTabChange: Provider.of<BottomNavController>(context, listen: false)
                   .onItemTap,

            tabs: [
              MoltenTab(
                icon: Icon(Icons.home),
              ),
              MoltenTab(
                icon: Icon(Icons.category),
              ),
              MoltenTab(
                icon: Icon(Icons.search),
              ),
            ],
          ),
      ),

    );
  }
}