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
      description: "Juicy beef patty with melted cheese on a toasted bun. Add extra cheese for more flavor.",
      imagePath: "assets/images/burger/burger1.jpg",
      price: 5.99,
      category: FoodCategory.Burgers,
      availableAddons: [
        Addons(name: 'Extra Cheese', price: 0.99),
        Addons(name: 'Extra Patty', price: 1.99),
        Addons(name: 'Extra Bacon', price: 1.49),
      ],
    ),
    Food(
      name: 'Chicken Burger',
      description: "Grilled chicken breast with lettuce, tomato, and mayo on a soft bun. Customize with extra cheese or bacon.",
      imagePath: "assets/images/burger/burger2.jpg",
      price: 6.99,
      category: FoodCategory.Burgers,
      availableAddons: [
        Addons(name: 'Extra Cheese', price: 0.99),
        Addons(name: 'Extra Patty', price: 1.99),
        Addons(name: 'Extra Bacon', price: 1.49),
      ],
    ),
    Food(
      name: 'Fish Burger',
      description: "Crispy fish fillet with tartar sauce on a toasted bun. Add extra cheese or bacon for a twist.",
      imagePath: "assets/images/burger/burger3.jpg",
      price: 7.99,
      category: FoodCategory.Burgers,
      availableAddons: [
        Addons(name: 'Extra Cheese', price: 0.99),
        Addons(name: 'Extra Patty', price: 1.99),
        Addons(name: 'Extra Bacon', price: 1.49),
      ],
    ),    
    Food(
      name: 'Veggie Burger',
      description: "Grilled vegetable patty with lettuce and mayo on a soft bun. Customize with extra cheese or bacon.",
      imagePath: "assets/images/burger/burger4.jpg",
      price: 4.99,
      category: FoodCategory.Burgers,
      availableAddons: [
        Addons(name: 'Extra Cheese', price: 0.99),
        Addons(name: 'Extra Patty', price: 1.99),
        Addons(name: 'Extra Bacon', price: 1.49),
      ],
    ),
    Food(
      name: 'Double Burger',
      description: "Two beef patties with melted cheese, lettuce, and pickles on toasted buns. Add extra cheese or bacon for extra satisfaction.",
      imagePath: "assets/images/burger/burger5.jpg",
      price: 8.99,
      category: FoodCategory.Burgers,
      availableAddons: [
        Addons(name: 'Extra Cheese', price: 0.99),
        Addons(name: 'Extra Patty', price: 1.99),
        Addons(name: 'Extra Bacon', price: 1.49),
      ],
    ),

    // salads x5 items
    Food(
      name: 'Garden Salad',
      description: "Fresh greens tossed with ripe tomatoes, crisp cucumbers, and colorful bell peppers. Optional cheese, chicken, or bacon for extra flavor.",
      imagePath: "assets/images/salads/salad1.jpg",
      price: 3.99,
      category: FoodCategory.Salads,
      availableAddons: [
        Addons(name: 'Extra Cheese', price: 0.99),
        Addons(name: 'Extra Chicken', price: 1.99),
        Addons(name: 'Extra Bacon', price: 1.49),
      ],
    ),
    Food(
      name: 'Greek Salad',
      description: "Crisp romaine lettuce with kalamata olives, juicy tomatoes, cucumbers, red onions, and creamy feta cheese. Drizzled with Greek dressing for a tangy finish.",
      imagePath: "assets/images/salads/salad2.jpg",
      price: 4.99,
      category: FoodCategory.Salads,
      availableAddons: [
        Addons(name: 'Extra Cheese', price: 0.99),
        Addons(name: 'Extra Chicken', price: 1.99),
        Addons(name: 'Extra Bacon', price: 1.49),
      ],
    ),
    Food(
      name: 'Caesar Salad',
      description: "Romaine lettuce tossed in Caesar dressing with crunchy croutons and shaved Parmesan cheese. Add grilled chicken or crispy bacon for a protein boost.",
      imagePath: "assets/images/salads/salad3.jpg",
      price: 5.99,
      category: FoodCategory.Salads,
      availableAddons: [
        Addons(name: 'Extra Cheese', price: 0.99),
        Addons(name: 'Extra Chicken', price: 1.99),
        Addons(name: 'Extra Bacon', price: 1.49),
      ],
    ),
    Food(
      name: 'Cobb Salad',
      description: "A hearty mix of lettuce, grilled chicken, avocado, bacon, hard-boiled eggs, tomatoes, and blue cheese crumbles. Tossed in a tangy vinaigrette dressing.",
      imagePath: "assets/images/salads/salad4.jpg",
      price: 6.99,
      category: FoodCategory.Salads,
      availableAddons: [
        Addons(name: 'Extra Cheese', price: 0.99),
        Addons(name: 'Extra Chicken', price: 1.99),
        Addons(name: 'Extra Bacon', price: 1.49),
      ],
    ),
    Food(
      name: 'Waldorf Salad',
      description: "Crisp apples, celery, grapes, and toasted walnuts in creamy mayonnaise dressing. A refreshing blend of sweet and crunchy flavors.",
      imagePath: "assets/images/salads/salad5.jpg",
      price: 7.99,
      category: FoodCategory.Salads,
      availableAddons: [
        Addons(name: 'Extra Cheese', price: 0.99),
        Addons(name: 'Extra Chicken', price: 1.99),
        Addons(name: 'Extra Bacon', price: 1.49),
      ],
    ),

    // sides x5 items
    Food(
      name: 'French Fries',
      description: "Crispy golden fries, perfect for dipping or enjoying on their own.",
      imagePath: "assets/images/sides/sides1.jpg",
      price: 1.99,
      category: FoodCategory.Sides,
      availableAddons: [
        Addons(name: 'Extra Cheese', price: 0.99),
        Addons(name: 'Extra Chicken', price: 1.99),
        Addons(name: 'Extra Bacon', price: 1.49),
      ],
    ),
    Food(
      name: 'Onion Rings',
      description: "Crispy battered onion rings, fried to perfection for a satisfying crunch.",
      imagePath: "assets/images/sides/sides2.jpg",
      price: 2.99,
      category: FoodCategory.Sides,
      availableAddons: [
        Addons(name: 'Extra Cheese', price: 0.99),
        Addons(name: 'Extra Chicken', price: 1.99),
        Addons(name: 'Extra Bacon', price: 1.49),
      ],
    ),
    Food(
      name: 'Mozzarella Sticks',
      description: "Melt-in-your-mouth mozzarella sticks with a crispy coating, served hot and gooey.",
      imagePath: "assets/images/sides/sides3.jpg",
      price: 3.99,
      category: FoodCategory.Sides,
      availableAddons: [
        Addons(name: 'Extra Cheese', price: 0.99),
        Addons(name: 'Extra Chicken', price: 1.99),
        Addons(name: 'Extra Bacon', price: 1.49),
      ],
    ),
    Food(
      name: 'Garlic Bread',
      description: "Toasted bread infused with savory garlic butter, a classic side for any meal.",
      imagePath: "assets/images/sides/sides4.jpg",
      price: 4.99,
      category: FoodCategory.Sides,
      availableAddons: [
        Addons(name: 'Extra Cheese', price: 0.99),
        Addons(name: 'Extra Chicken', price: 1.99),
        Addons(name: 'Extra Bacon', price: 1.49),
      ],
    ),
    Food(
      name: 'Potato Wedges',
      description: "Thick-cut potato wedges seasoned and baked to crispy perfection, a hearty side dish option.",
      imagePath: "assets/images/sides/sides5.jpg",
      price: 5.99,
      category: FoodCategory.Sides,
      availableAddons: [
        Addons(name: 'Extra Cheese', price: 0.99),
        Addons(name: 'Extra Chicken', price: 1.99),
        Addons(name: 'Extra Bacon', price: 1.49),
      ],
    ),

    // desserts x5 items
    Food(
      name: 'Chocolate Cake',
      description: "Rich and decadent chocolate cake, a timeless indulgence for any sweet tooth.",
      imagePath: "assets/images/desserts/desserts1.jpg",
      price: 3.99,
      category: FoodCategory.Desserts,
      availableAddons: [
        Addons(name: 'Extra Cheese', price: 0.99),
        Addons(name: 'Extra Chicken', price: 1.99),
        Addons(name: 'Extra Bacon', price: 1.49),
      ],
    ),
    Food(
      name: 'Cheese Cake',
      description: "Creamy cheesecake on a graham cracker crust, a classic dessert favorite.",
      imagePath: "assets/images/desserts/desserts2.jpg",
      price: 4.99,
      category: FoodCategory.Desserts,
      availableAddons: [
        Addons(name: 'Extra Cheese', price: 0.99),
        Addons(name: 'Extra Chicken', price: 1.99),
        Addons(name: 'Extra Bacon', price: 1.49),
      ],
    ),
    Food(
      name: 'Apple Pie',
      description: "Warm apple pie with a flaky crust and cinnamon-spiced filling, reminiscent of home-baked ",
      imagePath: "assets/images/desserts/desserts3.jpg",
      price: 5.99,
      category: FoodCategory.Desserts,
      availableAddons: [
        Addons(name: 'Extra Cheese', price: 0.99),
        Addons(name: 'Extra Chicken', price: 1.99),
        Addons(name: 'Extra Bacon', price: 1.49),
      ],
    ),
    Food(
      name: 'Brownie',
      description: "Fudgy brownie squares, loaded with chocolate flavor and topped with a hint of sweetness.",
      imagePath: "assets/images/desserts/desserts4.jpg",
      price: 6.99,
      category: FoodCategory.Desserts,
      availableAddons: [
        Addons(name: 'Extra Cheese', price: 0.99),
        Addons(name: 'Extra Chicken', price: 1.99),
        Addons(name: 'Extra Bacon', price: 1.49),
      ],
    ),
    Food(
      name: 'Ice Cream',
      description: "Creamy scoops of ice cream in various flavors, the perfect treat to cool down and satisfy your cravings.",
      imagePath: "assets/images/desserts/desserts5.jpg",
      price: 7.99,
      category: FoodCategory.Desserts,
      availableAddons: [
        Addons(name: 'Extra Cheese', price: 0.99),
        Addons(name: 'Extra Chicken', price: 1.99),
        Addons(name: 'Extra Bacon', price: 1.49),
      ],
    ),

    // drinks x5 items
    Food(
      name: 'Coke',
      description: "Classic Coca-Cola, refreshing and fizzy, perfect for any occasion.",
      imagePath: "assets/images/drinks/drink1.jpg",
      price: 1.99,
      category: FoodCategory.Drinks,
      availableAddons: [
        Addons(name: 'Extra Cheese', price: 0.99),
        Addons(name: 'Extra Chicken', price: 1.99),
        Addons(name: 'Extra Bacon', price: 1.49),
      ],
    ),
    Food(
      name: 'Pepsi',
      description: "Pepsi's bold and sweet taste, a timeless favorite for soda enthusiasts.",
      imagePath: "assets/images/drinks/drink2.jpg",
      price: 2.99,
      category: FoodCategory.Drinks,
      availableAddons: [
        Addons(name: 'Extra Cheese', price: 0.99),
        Addons(name: 'Extra Chicken', price: 1.99),
        Addons(name: 'Extra Bacon', price: 1.49),
      ],
    ),
    Food(
      name: 'Sprite',
      description: "Crisp and clear Sprite, with its lemon-lime flavor offering a refreshing twist.",
      imagePath: "assets/images/drinks/drink3.jpg",
      price: 3.99,
      category: FoodCategory.Drinks,
      availableAddons: [
        Addons(name: 'Extra Cheese', price: 0.99),
        Addons(name: 'Extra Chicken', price: 1.99),
        Addons(name: 'Extra Bacon', price: 1.49),
      ],
    ),
    Food(
      name: 'Fanta',
      description: "Fanta's fruity and vibrant taste, available in various exciting flavors to tantalize your taste buds.",
      imagePath: "assets/images/drinks/drink4.jpg",
      price: 4.99,
      category: FoodCategory.Drinks,
      availableAddons: [
        Addons(name: 'Extra Cheese', price: 0.99),
        Addons(name: 'Extra Chicken', price: 1.99),
        Addons(name: 'Extra Bacon', price: 1.49),
      ],
    ),
    Food(
      name: 'Lemonade',
      description: "Zesty and refreshing lemonade, a perfect balance of sweet and tangy flavors to quench your thirst.",
      imagePath: "assets/images/drinks/drink5.jpg",
      price: 5.99,
      category: FoodCategory.Drinks,
      availableAddons: [
        Addons(name: 'Extra Cheese', price: 0.99),
        Addons(name: 'Extra Chicken', price: 1.99),
        Addons(name: 'Extra Bacon', price: 1.49),
      ],
    ),
  ];

  // user cart
  final List<CartItem> _cart = [];

  // delivert address
  String _deliveryAddress = "I hazel groove, Nigeria";

  /* 

  G E T T E R S

  */
  List<Food> get menu => _menu;
  List<CartItem> get cart => _cart;
  String get deliveryAddress => _deliveryAddress;

  /* 

  O P E R A T I O N S

  */

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

  //update delivery address
  void updateDeliveryAddress(String newAddress) {
    _deliveryAddress = newAddress;
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
    
    String formattedDate = DateFormat('yyyy-MM-dd  HH:mm:ss').format(DateTime.now());

    receipt.writeln("Date & Time: $formattedDate");
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
      receipt.writeln("Total: ${getTotalItems()}"); 
      receipt.writeln("Total Price: ${_formatPrice(getTotalPrice())}");
      receipt.writeln("Delivering to: $deliveryAddress");

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
