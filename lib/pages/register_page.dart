import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dishdash/components/my_button.dart';
import 'package:dishdash/components/my_textfield.dart';
import 'package:dishdash/services/auth/auth_service.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  final void Function()? onTap;

  const RegisterPage({super.key, required this.onTap()});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmpasswordController =
      TextEditingController();

  // resiter method
  void register() async {
    // get the auth service
    final authService = AuthService();

    // check if passwords match -> create new user
    if (passwordController.text == confirmpasswordController.text) {
      // try creating user
      try {
        await authService.signUpWithEmailAndPassword(
            emailController.text, passwordController.text);
        // after creating new user, create a new document in cloudstore called users
        await FirebaseFirestore.instance
            .collection("Users")
            .doc(authService.currentUser!.email)
            .set(
          {
            'username': emailController.text.split("@")[0],
            'bio': "Hey there! I'm using DishDash",
          },
        );
      }

      // display errors
      catch (e) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text(
              e.toString(),
            ),
          ),
        );
      }
    }
    // if passords dont match show error
    else {
      showDialog(
        context: context,
        builder: (context) => const AlertDialog(
          title: Text("Passwords don't match"),
        ),
      );
    }
  }

  //google login method
  void gLogin() async {
    final authService = AuthService();

    try {
      await authService.signInWithGoogle();
    } catch (e) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(e.toString()),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          backgroundColor: Theme.of(context).colorScheme.background,
          body: Center(
            child: SingleChildScrollView(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    //logo
                    Icon(
                      Icons.lock_open_rounded,
                      size: 100,
                      color: Theme.of(context).colorScheme.inversePrimary,
                    ),
                    const SizedBox(height: 25),
                    //app slogan
                    Text(
                      "Let's create an account for you",
                      style: TextStyle(
                          fontSize: 16,
                          color: Theme.of(context).colorScheme.inversePrimary),
                    ),
                    const SizedBox(height: 25),

                    //email
                    MyTextField(
                      controller: emailController,
                      hintText: "Email",
                      obscureText: false,
                    ),
                    const SizedBox(height: 25),

                    //password
                    MyTextField(
                      controller: passwordController,
                      hintText: "Password",
                      obscureText: true,
                    ),
                    const SizedBox(height: 25),

                    //confirm password
                    MyTextField(
                      controller: confirmpasswordController,
                      hintText: "Confirm Password",
                      obscureText: true,
                    ),
                    const SizedBox(height: 25),

                    //signup
                    MyButton(
                      text: "Sign Up",
                      onTap: register,
                    ),
                    const SizedBox(height: 25),

                    //already have an account?, Login
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Already have an account?",
                            style: TextStyle(
                                color: Theme.of(context)
                                    .colorScheme
                                    .inversePrimary)),
                        const SizedBox(width: 5),
                        GestureDetector(
                          onTap: widget.onTap,
                          child: Text(
                            "Login Now",
                            style: TextStyle(
                                color: Theme.of(context)
                                    .colorScheme
                                    .inversePrimary,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),

                    //google sign in
                    const SizedBox(height: 25),
                    Text(
                      "------------------- Or -------------------",
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.inversePrimary),
                    ),

                    const SizedBox(height: 25),

                    OutlinedButton.icon(
                      onPressed: gLogin,
                      icon: Image.asset("assets/google.png",
                          width: 25, height: 25),
                      label: const Text("Sign in with Google"),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
