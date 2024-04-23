import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dishdash/components/my_button.dart';
import 'package:dishdash/models/food_item.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:dishdash/models/food.dart';
import 'package:image_picker/image_picker.dart';

class AddPage extends StatefulWidget {
  const AddPage({super.key});

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController priceController = TextEditingController();

  FoodCategory selectedCategory = FoodCategory.values.first;

  XFile? _imageFile;

  final currentUser = FirebaseAuth.instance.currentUser!;

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      setState(
        () {
          _imageFile = pickedImage;
        },
      );
    }
  }

  void addFoodItemToFirestore(FoodItem foodItem) async {
    try {
      // get refernce to the user's document based on their email
      DocumentReference userDocRef =
          FirebaseFirestore.instance.collection("Users").doc(currentUser.email);

      // get a refernce to the "foods" collection within the user's document
      CollectionReference foodsCollection = userDocRef.collection("foods");

      await foodsCollection.add({
        'name': foodItem.name,
        'description': foodItem.description,
        'price': foodItem.price,
        'category': foodItem.category.toString(),
        // 'imageUrl' : foodItem.imageURL,
      });

      // Alert user and clear text fields
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Success'),
            content: Text('Food added successfully.'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  nameController.clear();
                  descriptionController.clear();
                  priceController.clear();
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    } catch (e) {
      // alert the user
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text('Failed to add food item: $e'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
      print("Error adding food to Firestore: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: [
            const SizedBox(height: 30),

            // add food item text
            Text(
              "Add Food Item",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 20, color: Theme.of(context).colorScheme.secondary),
            ),

            const SizedBox(
              height: 40,
            ),

            // add name of the food item
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
              child: TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  labelText: "Name",
                  border: OutlineInputBorder(),
                ),
              ),
            ),

            const SizedBox(
              height: 20,
            ),

            // add the description of the food item
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
              child: TextField(
                controller: descriptionController,
                decoration: const InputDecoration(
                  labelText: "Description",
                  border: OutlineInputBorder(),
                ),
                maxLines: 3,
              ),
            ),

            const SizedBox(
              height: 20,
            ),

            // add the price of the food item
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
              child: TextField(
                controller: priceController,
                decoration: const InputDecoration(
                  labelText: "Price",
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
              ),
            ),

            const SizedBox(
              height: 20,
            ),

            // add the category of the food item (Drop down)
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
              child: DropdownButtonFormField<FoodCategory>(
                decoration: const InputDecoration(
                  labelText: 'Category',
                  border: OutlineInputBorder(),
                ),
                items: FoodCategory.values.map((category) {
                  return DropdownMenuItem<FoodCategory>(
                    value: category,
                    child: Text(category.toString().split('.').last),
                  );
                }).toList(),
                onChanged: (FoodCategory? value) {
                  setState(() {
                    selectedCategory = value!;
                  });
                },
              ),
            ),

            const SizedBox(
              height: 20,
            ),

            // add the image of the food item
            // Padding(
            //   padding: const EdgeInsets.all(20.0),
            //   child: GestureDetector(
            //     onTap: _pickImage,
            //     child: Container(
            //       height: 100,
            //       width: 50,
            //       decoration: BoxDecoration(
            //         // transparent border
            //         border: Border.all(
            //           color: Colors.grey.withOpacity(0.5),
            //         ),
            //       ),
            //       child: Center(
            //         child: _imageFile != null
            //             ? Image.file(File(_imageFile!.path))
            //             : const Icon(Icons.add_a_photo, size: 50),
            //       ),
            //     ),
            //   ),
            // ),

            const SizedBox(
              height: 50,
            ),

            // add the Add button icon to add the food item
            MyButton(
              text: "Add",
              onTap: () {
                // add the food item to the
                FoodItem foodItem = FoodItem(
                    name: nameController.text,
                    description: descriptionController.text,
                    price: double.tryParse(priceController.text) ?? 0.0,
                    category: selectedCategory.toString());
                addFoodItemToFirestore(foodItem);
              },
            ),
          ],
        ),
      ),
    );
  }
}
