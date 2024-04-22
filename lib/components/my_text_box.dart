import "package:flutter/material.dart";

class MyTextBox extends StatelessWidget {
  final String text;
  final String sectionName;
  void Function()? onPressed;

  MyTextBox(
      {super.key,
      required this.text,
      required this.sectionName,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.tertiary,
        borderRadius: BorderRadius.circular(8.0),
      ),
      padding: const EdgeInsets.only(left: 15, bottom: 15),
      margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // section Name
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                sectionName,
                style:
                    TextStyle(color: Theme.of(context).colorScheme.secondary),
              ),

              // edit button
              IconButton(
                icon: Icon(Icons.edit,
                    color: Theme.of(context).colorScheme.primary),
                onPressed: onPressed 
              ),
            ],
          ),

          // Text
          Text(text),
        ],
      ),
    );
  }
}
