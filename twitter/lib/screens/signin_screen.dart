import 'package:flutter/material.dart';
import 'package:twitter/widgets/bar_menu.dart';
import 'package:twitter/widgets/entry_field.dart';
import 'package:twitter/widgets/flat_button.dart';
import 'package:twitter/providers/auth_state.dart';
import 'package:twitter/screens/signup_screen.dart';
import 'package:twitter/screens/forgot_password_screen.dart';

class SignIn extends StatefulWidget {
  const SignIn({ super.key });

  @override
  State<SignIn> createState() => _SignIn();
}

class _SignIn extends State<SignIn> {
  TextEditingController? _emailController;
  TextEditingController? _passwordController;

  @override
  void initState() {
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _emailController!.dispose();
    _passwordController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Auth auth = Auth();
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 60),
              const Center(
                child: Text(
                  "Sign In",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 40),
              Image.network("https://upload.wikimedia.org/wikipedia/commons/thumb/6/6f/Logo_of_Twitter.svg/2491px-Logo_of_Twitter.svg.png", height: 50,),
              const SizedBox(height: 40),
              CustomEntryField(hint: "Enter email", controller: _emailController!),
              const SizedBox(height: 20),
              CustomEntryField(hint: "Enter password", controller: _passwordController!, isPassword: true),
              const SizedBox(height: 40),
              CustomFlatButton(
                label: "Submit",
                onPressed: () async {
                  final res = await auth.attemptLogin(_emailController!.text, _passwordController!.text);
                  if (res == Errors.none) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const BarMenu()),
                    );
                  } else {
                    String errorMessage = "";
                    if (res == Errors.noUserError) {
                      errorMessage = "No user found for that email!";
                    } else if (res == Errors.wrongError) {
                      errorMessage = "Wrong password!";
                    } else if (res == Errors.error) {
                      errorMessage = "Failed to Login! Please try later";
                    } else {
                      errorMessage = "You need to fill each field to submit";
                    }
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(errorMessage), backgroundColor: Colors.red,)
                    );
                  }
                }
                  
              ),
              const SizedBox(height: 50),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SignUp()),
                  );
                },
                child: const Text(
                  "Sign up",
                  style: TextStyle(
                    fontSize: 20,
                    height: 1,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ForgetPassword()),
                  );
                },
                child: const Text(
                  "Forget password?",
                  style: TextStyle(
                    fontSize: 20,
                    height: 1,
                  ),
                ),
              ),
            ],
          ),
        )
      ),
    );
  }
}
