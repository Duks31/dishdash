import 'dart:io';

import 'package:dishdash/components/my_button.dart';
import 'package:flutter/material.dart';
import 'package:dishdash/models/food.dart';
import 'package:image_picker/image_picker.dart';

class AddPage extends StatefulWidget {
  const AddPage({super.key});

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  XFile? _imageFile;

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
            const Padding(
              padding: EdgeInsets.only(top: 20, left: 20, right: 20),
              child: TextField(
                decoration: InputDecoration(
                  labelText: "Name",
                  border: OutlineInputBorder(),
                ),
              ),
            ),

            const SizedBox(
              height: 20,
            ),

            // add the description of the food item
            const Padding(
              padding: EdgeInsets.only(top: 20, left: 20, right: 20),
              child: TextField(
                decoration: InputDecoration(
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
            const Padding(
              padding: EdgeInsets.only(top: 20, left: 20, right: 20),
              child: TextField(
                decoration: InputDecoration(
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
                onChanged: (FoodCategory? value) {},
              ),
            ),

            const SizedBox(
              height: 20,
            ),

            // add the image of the food item
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: GestureDetector(
                onTap: _pickImage,
                child: Container(
                  height: 100,
                  width: 50,
                  decoration: BoxDecoration(
                    // transparent border
                    border: Border.all(
                      color: Colors.grey.withOpacity(0.5),
                    ),
                  ),
                  child: Center(
                    child: _imageFile != null
                        ? Image.file(File(_imageFile!.path))
                        : const Icon(Icons.add_a_photo, size: 50),
                  ),
                ),
              ),
            ),

            const SizedBox(
              height: 50,
            ),

            // add the Add button icon to add the food item
            MyButton(
              text: "Add",
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
