import "package:cloud_firestore/cloud_firestore.dart";
import "package:dishdash/components/my_button.dart";
import "package:dishdash/components/my_text_box.dart";
import "package:dishdash/services/auth/auth_service.dart";
import "package:firebase_auth/firebase_auth.dart";
import "package:flutter/material.dart";

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final currentUser = FirebaseAuth.instance.currentUser!;
  final usersCollection = FirebaseFirestore.instance.collection("Users");

  void logout() async {
    // get auth service and logout
    final authService = AuthService();
    authService.signOut();
  }

  // edit field
  Future<void> editField(String field) async {
    String newValue = "";

    await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Theme.of(context).colorScheme.background,
        title: Text(
          "Edit $field",
          style: TextStyle(color: Theme.of(context).colorScheme.secondary),
        ),
        content: TextField(
          autofocus: true,
          style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary),
          decoration: InputDecoration(
            hintText: "Enter new $field",
            hintStyle:
                TextStyle(color: Theme.of(context).colorScheme.inversePrimary),
          ),
          onChanged: (value) {
            newValue = value;
          },
        ),
        actions: [
          // cancel button
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Cancel"),
          ),

          // save button
          TextButton(
            onPressed: () => Navigator.of(context).pop(newValue),
            child: const Text("Save"),
          ),
        ],
      ),
    );

    // update in firestore
    if (newValue.trim().isNotEmpty) {
      // only update if there is something in the textfield
      await usersCollection.doc(currentUser.email).update({field: newValue});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<DocumentSnapshot>(
        stream: FirebaseFirestore.instance
            .collection("Users")
            .doc(currentUser.email)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final userData = snapshot.data!.data() as Map<String, dynamic>;
            return ListView(
              children: [
                const SizedBox(height: 50),

                // user avatar
                const CircleAvatar(
                  radius: 50,
                  child: Icon(Icons.person, size: 50),
                ),

                const SizedBox(
                  height: 10,
                ),

                // user email
                Text(currentUser.email!, textAlign: TextAlign.center),

                const SizedBox(height: 30),

                // user details
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Text(
                    "My Details",
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.inversePrimary,
                        fontSize: 15),
                  ),
                ),

                // username
                MyTextBox(
                  sectionName: "Username",
                  text: userData['username'],
                  onPressed: () => editField("username"),
                ),

                // bio

                MyTextBox(
                  sectionName: "Bio",
                  text: userData["bio"],
                  onPressed: () => editField("bio"),
                ),

                // logout button
                Padding(
                  padding: const EdgeInsets.all(80.0),
                  child: MyButton(text: "Logout", onTap: logout),
                ),
              ],
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text("Error${snapshot.error}"),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
