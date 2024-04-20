import "package:dishdash/components/my_button.dart";
import "package:dishdash/services/auth/auth_service.dart";
import "package:flutter/material.dart";

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  void logout() async {
    // get auth service and logout
    final authService = AuthService();
    authService.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text("Profile Page"),
        backgroundColor: Colors.transparent,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Column(
        children: [
          const SizedBox(height: 25),
          MyButton(
            text: "Logout",
            onTap: logout,
          ),
        ],
      ),
    );
  }
}
