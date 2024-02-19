import 'package:ecommerce_app/common/navigation_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

import 'export_screens.dart';

class NavigationScreen extends StatefulWidget {
  NavigationScreen({super.key});

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  BottomNavigationController bottomNavigationController =
      Get.put(BottomNavigationController());

  final screens = [
    const HomeScreen(),
    CartScreen(),
    const WishlistScreen(),
    const ProfileScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Obx(
          () => IndexedStack(
            index: bottomNavigationController.selectedIndex.value,
            children: screens,
          ),
        ),
        bottomNavigationBar: Obx(
          () => BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            selectedItemColor: Colors.teal,
            unselectedItemColor: Colors.grey[600],
            showSelectedLabels: true,
            showUnselectedLabels: true,
            onTap: (index) {
              bottomNavigationController.changeIndex(index);
            },
            currentIndex: bottomNavigationController.selectedIndex.value,
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(IconlyLight.home), label: "Home"),
              BottomNavigationBarItem(
                  icon: Icon(IconlyLight.bag), label: "Cart"),
              BottomNavigationBarItem(
                  icon: Icon(IconlyLight.heart), label: "Favorites"),
              BottomNavigationBarItem(
                  icon: Icon(IconlyBold.user_2), label: "Profile"),
            ],
          ),
        ));
  }
}
