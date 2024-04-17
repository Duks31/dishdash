import "package:dishdash/pages/carts_page.dart";
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
            return const CartsPage();
          case 2:
            return const ProfilePage();
          case 3:
            return const SettingPage();
          default:
            return const HomePage();
        }
      }),
    );
  }
}



// class MyNavigationBar extends StatelessWidget { 
//   const MyNavigationBar({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final controller  = Get.put(NavigationController());


//     return Scaffold(
//       bottomNavigationBar: Obx(
//         () =>  NavigationBar(
//           height: 80,
//           elevation: 0,
//           selectedIndex: controller.selectedIndex.value,
//           onDestinationSelected: (index) => controller.selectedIndex.value = index,
        
//           destinations: const [
//             NavigationDestination(
//               icon: Icon(Icons.home),
//               label: "Home",
//             ),
//             NavigationDestination(
//               icon: Icon(Icons.shopping_cart),
//               label: "Cart",
//             ),
//             NavigationDestination(
//               icon: Icon(Icons.person),
//               label: "Profile",
//             ),
//             NavigationDestination(
//               icon: Icon(Icons.settings),
//               label: "Settings",
//             ),
//           ],
//         ),
//       ),

//       body: Obx(() => controller.screens[controller.selectedIndex.value]),
//     );
//   }
// }


// class NavigationController extends GetxController{
//   final Rx<int> selectedIndex = 0.obs;

//   final screens = [
//     const HomePage(),
//     const CartsPage(),
//     const ProfilePage(),
//     const SettingPage(),
//   ];
// }


/// --------------------------- //////////

// class MyNavigationBar extends StatefulWidget {
//   const MyNavigationBar({super.key});

//   @override
//   State<MyNavigationBar> createState() => _MyNavigationBarState();
// }

// class _MyNavigationBarState extends State<MyNavigationBar> {
//   int _selectedIndex = 0;

//   void _onTabChange(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });

//     // Navigate to the selected tab
//     switch (index) {
//       case 0:
//         Navigator.push(
//           context,
//           MaterialPageRoute(
//             builder: (context) => const HomePage(),
//           ),
//         );
//         break;
//       case 1:
//         Navigator.push(
//           context,
//           MaterialPageRoute(
//             builder: (context) => const CartsPage(),
//           ),
//         );
//         break;
//       case 2:
//         Navigator.push(
//           context,
//           MaterialPageRoute(
//             builder: (context) => const ProfilePage(),
//           ),
//         );
//         break;
//       case 3:
//         Navigator.push(
//           context,
//           MaterialPageRoute(
//             builder: (context) => const SettingPage(),
//           ),
//         );
//         break;
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       bottomNavigationBar: Container(
//         decoration: BoxDecoration(
//           color: Theme.of(context).colorScheme.primary,
//         ),
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
//           child: GNav(
//             backgroundColor: Theme.of(context).colorScheme.primary,
//             activeColor: Theme.of(context).colorScheme.inversePrimary,
//             color: Theme.of(context).colorScheme.secondary,
//             tabBackgroundColor: Theme.of(context).colorScheme.tertiary,
//             gap: 8,
//             onTabChange: _onTabChange,
//             padding: const EdgeInsets.all(6),
//             tabs: const [
//               GButton(icon: Icons.home, text: "Home"),
//               GButton(icon: Icons.shopping_cart, text: "Cart"),
//               GButton(icon: Icons.person, text: "Profile"),
//               GButton(icon: Icons.settings, text: "Settings"),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }