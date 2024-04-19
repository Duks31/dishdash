import "package:dishdash/models/food.dart";
import "package:flutter/material.dart";

class QuantitySelector extends StatelessWidget {
  final int quantity;
  final Food food;
  final VoidCallback onIncreament;
  final VoidCallback onDecreament;

  const QuantitySelector(
      {super.key,
      required this.quantity,
      required this.food,
      required this.onIncreament,
      required this.onDecreament});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.background,
        borderRadius: BorderRadius.circular(50),
      ),
      padding: const EdgeInsets.all(8),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [

          // decrease button
          GestureDetector(
            onTap: onDecreament,
            child: Icon(
              Icons.remove,
              size: 20,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),

          // quantity count
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: SizedBox(
              width: 20,
              child: Center(
                child: Text(
                  quantity.toString(),
                ),
              ),
            ),
          ),

          // increase button
          GestureDetector(
            onTap: onIncreament,
            child: Icon(
              Icons.add,
              size: 20,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),

        ],
      ),
    );
  }
}
