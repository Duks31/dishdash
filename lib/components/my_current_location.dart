import 'package:dishdash/models/resturant.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyCurrentLocation extends StatelessWidget {
  MyCurrentLocation({super.key});

  final textController = TextEditingController(); 

  void openLocationSearchBox(BuildContext context) {

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Theme.of(context).colorScheme.background,
        title: const Text("Your locatioin"),
        content: TextField(
          controller: textController,
          decoration: const InputDecoration(
            hintText: "Enter Adress...",
          ),
        ),
        actions: [
          //cancel
          MaterialButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text("Cancel"),
          ),

          //save
          MaterialButton(
            onPressed: () {
              // update delivery address 
              String newAddress = textController.text;
              context.read<Resturant>().updateDeliveryAddress(newAddress);
              Navigator.pop(context);
              textController.clear();
            },
            child: const Text("Save"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Delivery Now",
              style: TextStyle(color: Theme.of(context).colorScheme.primary)),
          GestureDetector(
            onTap: () {
              openLocationSearchBox(context);
            },
            child: Row(
              children: [
                Consumer<Resturant>(
                  builder:
                    (context, resturant, builder) => Text(
                          resturant.deliveryAddress,
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.inversePrimary,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                  ),
                // Drop down menu
                const Icon(Icons.keyboard_arrow_down_rounded),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
