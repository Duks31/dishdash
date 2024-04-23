import "package:cloud_firestore/cloud_firestore.dart";
import "package:dishdash/components/my_current_location.dart";
import "package:dishdash/components/my_description_box.dart";
import "package:dishdash/components/my_food_tile.dart";
import "package:dishdash/components/my_sliver_appbar.dart";
import "package:dishdash/components/my_tab_bar.dart";
import "package:dishdash/models/food.dart";
import "package:dishdash/models/resturant.dart";
import "package:dishdash/pages/food_page.dart";
import "package:flutter/foundation.dart";
import "package:flutter/material.dart";
import "package:provider/provider.dart";

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> 
    with SingleTickerProviderStateMixin {
  // tab controller

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController =
        TabController(length: FoodCategory.values.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  //sort out and return a list of food items that belong to a specific category
  List<Food> _filterMenuByCategory(FoodCategory category, List<Food> fullMenu) {
    return fullMenu.where((food) => food.category == category).toList();
  }

  //return list of foods in given category
  List<Widget> getFoodInThisCategory(List<Food> fullMenu) {
    return FoodCategory.values.map((category) {
      // category menu
      List<Food> categoryMenu = _filterMenuByCategory(category, fullMenu);
      return ListView.builder(
        itemCount: categoryMenu.length,
        physics: const NeverScrollableScrollPhysics(),
        padding: EdgeInsets.zero,
        itemBuilder: (context, index) {
          // get individual food item
          final food = categoryMenu[index];

          // return food tile UI
          return FoodTile(
            food: food,
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => FoodPage(food: food),
              ),
            ),
          );
        },
      );
    }).toList();
  }

  List<Food> _getManualFoodItems(BuildContext context) {
    final resturant = Provider.of<Resturant>(context);
    return resturant.menu;

    // Consumer<Resturant>(builder: (context, resturant, child) {
    //   return TabBarView(
    //     controller: _tabController,
    //     children: getFoodInThisCategory(resturant.menu),
    //   );
    // });
  }

  Future<List<Food>> _fetchFoodItems() async {
    try{
      // access the food collection in firestore
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection('food').get();

      // map the snapshot to a list of Food Objects
      List<Food> foodItems = querySnapshot.docs.map((doc) {
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;

        // create food object from data 
        return Food(
          name : data['name'] ?? '',
          description: data['description'] ?? '',
          price : (data['price']  ?? 0.0).toDouble(),
          category : data['category'] ?? FoodCategory.values.first, availableAddons: [],
          imagePath: data['imageUrl'] ?? '', 

        );}).toList();

        return foodItems;

    } catch(e) {
        if (kDebugMode) {
          print('Error fetching food items: $e');
        }
        return [];
      }
    } 
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxScrolled) => [
          MySilverAppBar(
            title: MyTabBar(tabController: _tabController),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Divider(
                  indent: 25,
                  endIndent: 25,
                  color: Theme.of(context).colorScheme.secondary,
                ),

                // Current Location
                MyCurrentLocation(),

                // description box
                const MyDescriptionBox(),
              ],
            ),
          ),
        ],
        body: FutureBuilder<List<Food>>(
          future: _fetchFoodItems(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text('Error: ${snapshot.error}'),
              );
            } else {
              final manualFoodItems = _getManualFoodItems(context);
              final allFoodItems = manualFoodItems + (snapshot.data ?? []);
              return TabBarView(
                controller: _tabController,
                children: FoodCategory.values.map((category) {
                  final categoryMenu =
                      _filterMenuByCategory(category, allFoodItems);
                  return ListView.builder(
                    itemCount: categoryMenu.length,
                    itemBuilder: (context, index) {
                      final food = categoryMenu[index];
                      return FoodTile(
                        food: food,
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => FoodPage(food: food),
                          ),
                        ),
                      );
                    },
                  );
                }).toList(),
              );
            }
          },
        ),
      ),
    );
  }
}
