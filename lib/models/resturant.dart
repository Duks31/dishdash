import 'package:collection/collection.dart';
import 'package:dishdash/models/cart_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'food.dart';

class Resturant extends ChangeNotifier {
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
  List<CartItem> get cart => _cart;

  /* 

  O P E R A T I O N S

  */
  // user cart
  final List<CartItem> _cart = [];

  // add to cart
  void addToCart(Food food, List<Addons> selectedAddons) {
    // see if there is a cart item already with the same food and selected addons
    CartItem? cartItem = _cart.firstWhereOrNull((item) {
      // check if the food is the same
      bool isSameFood = item.food == food;

      // check if the list of selected items are the same
      bool isSameAddons =
          const ListEquality().equals(item.selectedAddons, selectedAddons);

      return isSameFood && isSameAddons;
    });
    // if cart item already exists, increase quantity
    if (cartItem != null) {
      cartItem.quantity++;
    }

    // otherwise add new cartItem
    else {
      _cart.add(
        CartItem(food: food, selectedAddons: selectedAddons),
      );
    }

    notifyListeners();
  }

  // remove from cart
  void removeFromCart(CartItem cartItem) {
    int cartIndex = _cart.indexOf(cartItem);

    if (cartIndex != -1) {
      if (_cart[cartIndex].quantity > 1) {
        _cart[cartIndex].quantity--;
      } else {
        _cart.removeAt(cartIndex);
      }
    }
    notifyListeners();
  }

  // get total price of cart
  double getTotalPrice() {
    double total = 0.0;

    for (CartItem cartItem in _cart) {
      double itemTotal = cartItem.food.price;

      for (Addons addon in cartItem.selectedAddons) {
        itemTotal += addon.price;
      }

      total += itemTotal * cartItem.quantity;
    }

    return total;
  }

  // get total number of items in cart
  int getTotalItems() {
    int total = 0;

    for (CartItem cartItem in _cart) {
      total += cartItem.quantity;
    }

    return total;
  }

  // clear cart
  void clearCart() {
    _cart.clear();
    notifyListeners();
  } 

  /* 

  H E L P E R   F U N C T I O N S

  */
  // generate the receipt
  String displayCartReceipt() {
    final receipt  = StringBuffer();
    receipt.writeln("Here is your receipt.");
    receipt.writeln();
    
    String formattedDate = DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now());

    receipt.writeln("Date: $formattedDate");
    receipt.writeln();
    receipt.writeln("-----------------------------");


    for(final cartItem in cart) {
      receipt.writeln(
        "${cartItem.quantity} x ${cartItem.food.name} - ${_formatPrice(cartItem.food.price)}");

        if(cartItem.selectedAddons.isNotEmpty) {
          receipt.writeln("         Add-ons: ${_formatAddons(cartItem.selectedAddons)}");
        }

        receipt.writeln();
    }
      receipt.writeln("-----------------------------");
      receipt.writeln();
      receipt.writeln("Total: ${getTotalItems()})}"); 
      receipt.writeln("Total Price: ${_formatPrice(getTotalPrice())}");

      return receipt.toString();
  }

  // format double value into money format
  String _formatPrice(double price) {
    return '\$${price.toStringAsFixed(2)}';
  }

  // format list of addons into string summary
  String _formatAddons(List<Addons> addons) {
    return addons.map((addon) => "${addon.name} (${_formatPrice(addon.price)})").join(", ");
  }
}
