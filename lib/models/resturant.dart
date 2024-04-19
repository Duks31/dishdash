import 'package:flutter/material.dart';
import 'food.dart';

class Resturant extends ChangeNotifier{
  // list of food menu
  final List<Food> _menu = [
    // Burger x5 items
    Food( 
      name: 'Cheese Burger',
      description: "Cheese Burger",
      imagePath: "assets/images/burger/burger1.jpg",
      price: 5.99,
      category: FoodCategory.burgers,
      availableAddons: [
        Addons(name: 'Extra Cheese', price: 0.99),
        Addons(name: 'Extra Patty', price: 1.99),
        Addons(name: 'Extra Bacon', price: 1.49),
      ],
    ),
    Food(
      name: 'Chicken Burger',
      description: "Chicken Burger",
      imagePath: "assets/images/burger/burger2.jpg",
      price: 6.99,
      category: FoodCategory.burgers,
      availableAddons: [
        Addons(name: 'Extra Cheese', price: 0.99),
        Addons(name: 'Extra Patty', price: 1.99),
        Addons(name: 'Extra Bacon', price: 1.49),
      ],
    ),
    Food(
      name: 'Fish Burger',
      description: "Fish Burger",
      imagePath: "assets/images/burger/burger3.jpg",
      price: 7.99,
      category: FoodCategory.burgers,
      availableAddons: [
        Addons(name: 'Extra Cheese', price: 0.99),
        Addons(name: 'Extra Patty', price: 1.99),
        Addons(name: 'Extra Bacon', price: 1.49),
      ],
    ),
    Food(
      name: 'Veggie Burger',
      description: "Veggie Burger",
      imagePath: "assets/images/burger/burger4.jpg",
      price: 4.99,
      category: FoodCategory.burgers,
      availableAddons: [
        Addons(name: 'Extra Cheese', price: 0.99),
        Addons(name: 'Extra Patty', price: 1.99),
        Addons(name: 'Extra Bacon', price: 1.49),
      ],
    ),
    Food(
      name: 'Double Burger',
      description: "Double Burger",
      imagePath: "assets/images/burger/burger5.jpg",
      price: 8.99,
      category: FoodCategory.burgers,
      availableAddons: [
        Addons(name: 'Extra Cheese', price: 0.99),
        Addons(name: 'Extra Patty', price: 1.99),
        Addons(name: 'Extra Bacon', price: 1.49),
      ],
    ),

    // salads x5 items
    Food(
      name: 'Garden Salad',
      description: "Garden Salad",
      imagePath: "assets/images/salads/salad1.jpg",
      price: 3.99,
      category: FoodCategory.salads,
      availableAddons: [
        Addons(name: 'Extra Cheese', price: 0.99),
        Addons(name: 'Extra Chicken', price: 1.99),
        Addons(name: 'Extra Bacon', price: 1.49),
      ],
    ),
    Food(
      name: 'Greek Salad',
      description: "Greek Salad",
      imagePath: "assets/images/salads/salad2.jpg",
      price: 4.99,
      category: FoodCategory.salads,
      availableAddons: [
        Addons(name: 'Extra Cheese', price: 0.99),
        Addons(name: 'Extra Chicken', price: 1.99),
        Addons(name: 'Extra Bacon', price: 1.49),
      ],
    ),
    Food(
      name: 'Caesar Salad',
      description: "Caesar Salad",
      imagePath: "assets/images/salads/salad3.jpg",
      price: 5.99,
      category: FoodCategory.salads,
      availableAddons: [
        Addons(name: 'Extra Cheese', price: 0.99),
        Addons(name: 'Extra Chicken', price: 1.99),
        Addons(name: 'Extra Bacon', price: 1.49),
      ],
    ),
    Food(
      name: 'Cobb Salad',
      description: "Cobb Salad",
      imagePath: "assets/images/salads/salad4.jpg",
      price: 6.99,
      category: FoodCategory.salads,
      availableAddons: [
        Addons(name: 'Extra Cheese', price: 0.99),
        Addons(name: 'Extra Chicken', price: 1.99),
        Addons(name: 'Extra Bacon', price: 1.49),
      ],
    ),
    Food(
      name: 'Waldorf Salad',
      description: "Waldorf Salad",
      imagePath: "assets/images/salads/salad5.jpg",
      price: 7.99,
      category: FoodCategory.salads,
      availableAddons: [
        Addons(name: 'Extra Cheese', price: 0.99),
        Addons(name: 'Extra Chicken', price: 1.99),
        Addons(name: 'Extra Bacon', price: 1.49),
      ],
    ),

    // sides x5 items
    Food(
      name: 'French Fries',
      description: "French Fries",
      imagePath: "assets/images/sides/sides1.jpg",
      price: 1.99,
      category: FoodCategory.sides,
      availableAddons: [
        Addons(name: 'Extra Cheese', price: 0.99),
        Addons(name: 'Extra Chicken', price: 1.99),
        Addons(name: 'Extra Bacon', price: 1.49),
      ],
    ),
    Food(
      name: 'Onion Rings',
      description: "Onion Rings",
      imagePath: "assets/images/sides/sides2.jpg",
      price: 2.99,
      category: FoodCategory.sides,
      availableAddons: [
        Addons(name: 'Extra Cheese', price: 0.99),
        Addons(name: 'Extra Chicken', price: 1.99),
        Addons(name: 'Extra Bacon', price: 1.49),
      ],
    ),
    Food(
      name: 'Mozzarella Sticks',
      description: "Mozzarella Sticks",
      imagePath: "assets/images/sides/sides3.jpg",
      price: 3.99,
      category: FoodCategory.sides,
      availableAddons: [
        Addons(name: 'Extra Cheese', price: 0.99),
        Addons(name: 'Extra Chicken', price: 1.99),
        Addons(name: 'Extra Bacon', price: 1.49),
      ],
    ),
    Food(
      name: 'Garlic Bread',
      description: "Garlic Bread",
      imagePath: "assets/images/sides/sides4.jpg",
      price: 4.99,
      category: FoodCategory.sides,
      availableAddons: [
        Addons(name: 'Extra Cheese', price: 0.99),
        Addons(name: 'Extra Chicken', price: 1.99),
        Addons(name: 'Extra Bacon', price: 1.49),
      ],
    ),
    Food(
      name: 'Potato Wedges',
      description: "Potato Wedges",
      imagePath: "assets/images/sides/sides5.jpg",
      price: 5.99,
      category: FoodCategory.sides,
      availableAddons: [
        Addons(name: 'Extra Cheese', price: 0.99),
        Addons(name: 'Extra Chicken', price: 1.99),
        Addons(name: 'Extra Bacon', price: 1.49),
      ],
    ),

    // desserts x5 items
    Food(
      name: 'Chocolate Cake',
      description: "Chocolate Cake",
      imagePath: "assets/images/desserts/desserts1.jpg",
      price: 3.99,
      category: FoodCategory.dessets,
      availableAddons: [
        Addons(name: 'Extra Cheese', price: 0.99),
        Addons(name: 'Extra Chicken', price: 1.99),
        Addons(name: 'Extra Bacon', price: 1.49),
      ],
    ),
    Food(
      name: 'Cheese Cake',
      description: "Cheese Cake",
      imagePath: "assets/images/desserts/desserts2.jpg",
      price: 4.99,
      category: FoodCategory.dessets,
      availableAddons: [
        Addons(name: 'Extra Cheese', price: 0.99),
        Addons(name: 'Extra Chicken', price: 1.99),
        Addons(name: 'Extra Bacon', price: 1.49),
      ],
    ),
    Food(
      name: 'Apple Pie',
      description: "Apple Pie",
      imagePath: "assets/images/desserts/desserts3.jpg",
      price: 5.99,
      category: FoodCategory.dessets,
      availableAddons: [
        Addons(name: 'Extra Cheese', price: 0.99),
        Addons(name: 'Extra Chicken', price: 1.99),
        Addons(name: 'Extra Bacon', price: 1.49),
      ],
    ),
    Food(
      name: 'Brownie',
      description: "Brownie",
      imagePath: "assets/images/desserts/desserts4.jpg",
      price: 6.99,
      category: FoodCategory.dessets,
      availableAddons: [
        Addons(name: 'Extra Cheese', price: 0.99),
        Addons(name: 'Extra Chicken', price: 1.99),
        Addons(name: 'Extra Bacon', price: 1.49),
      ],
    ),
    Food(
      name: 'Ice Cream',
      description: "Ice Cream",
      imagePath: "assets/images/desserts/desserts5.jpg",
      price: 7.99,
      category: FoodCategory.dessets,
      availableAddons: [
        Addons(name: 'Extra Cheese', price: 0.99),
        Addons(name: 'Extra Chicken', price: 1.99),
        Addons(name: 'Extra Bacon', price: 1.49),
      ],
    ),

    // drinks x5 items
    Food(
      name: 'Coke',
      description: "Coke",
      imagePath: "assets/images/drinks/drink1.jpg",
      price: 1.99,
      category: FoodCategory.drinks,
      availableAddons: [
        Addons(name: 'Extra Cheese', price: 0.99),
        Addons(name: 'Extra Chicken', price: 1.99),
        Addons(name: 'Extra Bacon', price: 1.49),
      ],
    ),
    Food(
      name: 'Pepsi',
      description: "Pepsi",
      imagePath: "assets/images/drinks/drink2.jpg",
      price: 2.99,
      category: FoodCategory.drinks,
      availableAddons: [
        Addons(name: 'Extra Cheese', price: 0.99),
        Addons(name: 'Extra Chicken', price: 1.99),
        Addons(name: 'Extra Bacon', price: 1.49),
      ],
    ),
    Food(
      name: 'Sprite',
      description: "Sprite",
      imagePath: "assets/images/drinks/drink3.jpg",
      price: 3.99,
      category: FoodCategory.drinks,
      availableAddons: [
        Addons(name: 'Extra Cheese', price: 0.99),
        Addons(name: 'Extra Chicken', price: 1.99),
        Addons(name: 'Extra Bacon', price: 1.49),
      ],
    ),
    Food(
      name: 'Fanta',
      description: "Fanta",
      imagePath: "assets/images/drinks/drink4.jpg",
      price: 4.99,
      category: FoodCategory.drinks,
      availableAddons: [
        Addons(name: 'Extra Cheese', price: 0.99),
        Addons(name: 'Extra Chicken', price: 1.99),
        Addons(name: 'Extra Bacon', price: 1.49),
      ],
    ),
    Food(
      name: 'Lemonade',
      description: "Lemonade",
      imagePath: "assets/images/drinks/drink5.jpg",
      price: 5.99,
      category: FoodCategory.drinks,
      availableAddons: [
        Addons(name: 'Extra Cheese', price: 0.99),
        Addons(name: 'Extra Chicken', price: 1.99),
        Addons(name: 'Extra Bacon', price: 1.49),
      ],
    ),
  ];

  /* 

  G E T T E R S

  */
  List<Food> get menu => _menu;

  /* 

  O P E R A T I O N S

  */
  // add to cart 

  // remove from cart

  // get total price of cart

  // get total number of items in cart

  // clear cart

  /* 

  H E L P E R   F U N C T I O N S

  */
  // generate the recipt

  // format double value into money format

  // format list of addons into string summary


}
