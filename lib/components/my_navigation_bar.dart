import "package:dishdash/pages/add_page.dart";
import 'package:dishdash/pages/cart_page.dart';
import "package:dishdash/pages/home_page.dart";
import "package:dishdash/pages/profile_page.dart";
import "package:dishdash/pages/settings_page.dart";
import "package:flutter/material.dart";
import "package:google_nav_bar/google_nav_bar.dart";
import 'package:get/get.dart';

class MyNavigationBar extends StatelessWidget {
  final RxInt selectedIndex = 0.obs;

  MyNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Obx(
        () => Container(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary,
            borderRadius: const BorderRadius.only( topLeft: Radius.circular(10), topRight: Radius.circular(10),),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
            child: GNav(
              backgroundColor: Theme.of(context).colorScheme.primary,
              activeColor: Theme.of(context).colorScheme.inversePrimary,
              color: Theme.of(context).colorScheme.secondary,
              tabBackgroundColor: Theme.of(context).colorScheme.tertiary,
              gap: 8,
              selectedIndex: selectedIndex.value,
              onTabChange: (index) => selectedIndex.value = index,
              padding: const EdgeInsets.all(6),
              tabs: const [
                GButton(icon: Icons.home, text: "Home"),
                GButton(icon: Icons.shopping_cart, text: "Cart"),
                GButton(icon: Icons.add),
                GButton(icon: Icons.person, text: "Profile"),
                GButton(icon: Icons.settings, text: "Settings"),
              ],
            ),
          ),
        ),
      ),
      body: Obx(() {
        switch (selectedIndex.value) {
          case 0:
            return const HomePage();
          case 1:
            return const CartPage();
          case 2:
            return const AddPage();
          case 3:
            return const ProfilePage();
          case 4:
            return const SettingPage();
          default:
            return const HomePage();
        }
      }),
    );
  }
}