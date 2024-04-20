import "package:dishdash/components/my_button.dart";
import "package:dishdash/components/my_cart_tile.dart";
import "package:dishdash/models/resturant.dart";
import "package:dishdash/pages/payment_page.dart";
import "package:flutter/material.dart";
import "package:provider/provider.dart";

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Resturant>(
      builder: (
        context,
        resturant,
        child,
      ) {
        // cart
        final userCart = resturant.cart;

        // scafold UI
        return Scaffold(
          appBar: AppBar(
            title: const Text("Cart"),
            backgroundColor: Colors.transparent,
            foregroundColor: Theme.of(context).colorScheme.inversePrimary,
            actions: [
              // clear cart button
              IconButton(
                icon: const Icon(Icons.delete),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text("Clear Cart"),
                      content: const Text(
                          "Are you sure you want to clear the cart?"),
                      actions: [
                        // cancel button
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text("Cancel"),
                        ),

                        // yes button
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                            resturant.clearCart();
                          },
                          child: const Text("Yes"),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
          body: Column(
            children: [
              // list of cart items
              Expanded(
                child: Column(
                  children: [
                    userCart.isEmpty
                        ? const Expanded(
                            child: Center(
                              child: Text("Cart is Empty..."),
                            ),
                          )
                        : Expanded(
                            child: ListView.builder(
                              itemCount: userCart.length,
                              itemBuilder: (context, index) {
                                // get individual cart item
                                final cartItem = userCart[index];

                                // return cart title UI
                                return ListTile(
                                  title: MyCartTile(cartItem: cartItem),
                                );
                              },
                            ),
                          ),
                  ],
                ),
              ),

              // Button to pay
              MyButton(
                text: "Go to checkout",
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const PaymentPage(),
                  ),
                ),
              ),

              
              const SizedBox(height: 25.0),
            ],
          ),
        );
      },
    );
  }
}
