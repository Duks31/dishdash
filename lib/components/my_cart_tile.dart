import "package:dishdash/components/my_quantity_selector.dart";
import "package:dishdash/models/cart_item.dart";
import "package:dishdash/models/resturant.dart";
import "package:flutter/material.dart";
import "package:provider/provider.dart";

class MyCartTile extends StatelessWidget {
  final CartItem cartItem;

  const MyCartTile({super.key, required this.cartItem});

  @override
  Widget build(BuildContext context) {
    return Consumer<Resturant>(
      builder: (context, resturant, child) => Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
          borderRadius: BorderRadius.circular(8),
        ),
        margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //food image
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      cartItem.food.imagePath,
                      fit: BoxFit.cover,
                      width: 100,
                      height: 100,
                    ),
                  ),

                  const SizedBox(width: 10),

                  // name and price
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // food name
                      Text(cartItem.food.name),

                      // food price
                      Text(
                        "\$${cartItem.food.price.toString()}",
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                    ],
                  ),

                  const Spacer(),

                  // increament nad decreament the quantity
                  QuantitySelector(
                      quantity: cartItem.quantity,
                      food: cartItem.food,
                      onIncreament: () {
                        resturant.addToCart(
                            cartItem.food, cartItem.selectedAddons);
                      },
                      onDecreament: () {
                        resturant.removeFromCart(cartItem);
                      })
                ],
              ),
            ),

            //addons
            SizedBox(
              height: cartItem.selectedAddons.isEmpty ? 0 : 60,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.only(left: 10, bottom: 10, right: 10),
                children: cartItem.selectedAddons
                    .map(
                      (addon) => Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: FilterChip(
                          label: Row(children: [
                            // addon name
                            Text(addon.name),

                            // addon price
                            Text(" (\$${addon.price})"),
                          ]),
                          shape: StadiumBorder(
                            side: BorderSide(
                                color: Theme.of(context).colorScheme.primary),
                          ),
                          onSelected: (bool value) {},
                          backgroundColor:
                              Theme.of(context).colorScheme.secondary,
                          labelStyle: TextStyle(
                            color: Theme.of(context).colorScheme.inversePrimary,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
