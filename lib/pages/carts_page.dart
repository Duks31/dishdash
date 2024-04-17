import "package:flutter/material.dart";

class CartsPage extends StatelessWidget {
  const CartsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text("Carts Page"),
      ),
      body: const Center(
        child: Text("Welcome to the Carts Page"),
      ),
    );
  }
}