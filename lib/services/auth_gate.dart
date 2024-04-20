import "package:dishdash/components/my_navigation_bar.dart";
import "package:dishdash/services/auth/login_or_register.dart";
import "package:firebase_auth/firebase_auth.dart";
import "package:flutter/material.dart";

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          // user logged in
          if (snapshot.hasData) {
            return MyNavigationBar();
          }
          // user not logged in
          else {
            return const LoginOrRegister();
          }
        },
      ),
    );
  }
}