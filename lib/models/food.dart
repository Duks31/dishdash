class Food {
  final String name;
  final String description;
  final String imagePath;
  final double price;
  final FoodCategory category;
  List<Addons> availableAddons;


  Food({
    required this.name,
    required this.description,
    required this.imagePath,
    required this.price,
    required this.category,
    required this.availableAddons
  });
}

enum FoodCategory {
  burgers,
  salads,
  sides,
  dessets,
  drinks,
}

class Addons {
  String name;
  double price;

  Addons ({
    required this.name,
    required this.price,
  });

}