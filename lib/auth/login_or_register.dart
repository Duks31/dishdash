import "package:dishdash/pages/login_page.dart";
import "package:dishdash/pages/register_page.dart";
import "package:flutter/material.dart";

class LoginOrRegister extends StatefulWidget {
  const LoginOrRegister({super.key});

  @override
  State<LoginOrRegister> createState() => _LoginOrRegisterState();
}

class _LoginOrRegisterState extends State<LoginOrRegister> {
  // initially show the login page
  bool showLoginPage = true;

  // togglepages between login and register pages
  void togglepages() {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
      if (showLoginPage) {
        return LoginPage(
        onTap: togglepages);
        }else {
        return RegisterPage(
          onTap: togglepages,
        );
      }
    }
  }