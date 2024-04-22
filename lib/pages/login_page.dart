import "package:dishdash/components/my_button.dart";
import "package:dishdash/services/auth/auth_service.dart";
import "package:flutter/material.dart";
import "package:dishdash/components/my_textfield.dart";

class LoginPage extends StatefulWidget {
  final void Function()? onTap;

  const LoginPage({super.key, required this.onTap()});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  //login method
  void login() async {
    // get instance of auth Service
    final authService = AuthService();

    // try sign in
    try {
      await authService.signInWithEmailAndPassword(
          emailController.text, passwordController.text);
    } catch (e) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(e.toString()),
        ),
      );
    }

  }
    //google login method
  void gLogin() async {
    final authService = AuthService();

    try {
      await authService.signInWithGoogle();
    }
    catch (e) {
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
                      "Food Delivery App",
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
              
                    //signin
                    MyButton(
                      text: "Sign In",
                      onTap: login,
                    ),
                    const SizedBox(height: 25),
              
                    //not a member? register now
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Not a member",
                            style: TextStyle(
                                color:
                                    Theme.of(context).colorScheme.inversePrimary)),
                        const SizedBox(width: 5),
                        GestureDetector(
                          onTap: widget.onTap,
                          child: Text(
                            "Register Now",
                            style: TextStyle(
                                color: Theme.of(context).colorScheme.inversePrimary,
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
                      icon: Image.asset("assets/google.png", width: 25, height: 25),
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
