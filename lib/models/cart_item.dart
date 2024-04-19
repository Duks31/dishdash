import 'package:dishdash/models/food.dart';

class CartItem {
  Food food;
  List<Addons> selectedAddons;
  int quantity;

  CartItem({
    required this.food,
    required this.selectedAddons,
    this.quantity = 1,
  });

  double get totalPrice {
    double addonsPrice =
        selectedAddons.fold(0, (sum, addon) => sum + addon.price);
      return (food.price + addonsPrice) * quantity;
  }
}
