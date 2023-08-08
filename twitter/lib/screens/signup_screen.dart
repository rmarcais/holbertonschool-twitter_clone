import 'package:flutter/material.dart';
import 'package:twitter/widgets/entry_field.dart';
import 'package:twitter/widgets/flat_button.dart';
import 'package:twitter/providers/auth_state.dart';

class SignUp extends StatefulWidget {
  const SignUp({ super.key });

  @override
  State<SignUp> createState() => _SignUp();
}

class _SignUp extends State<SignUp> {
  TextEditingController? _nameController;
  TextEditingController? _emailController;
  TextEditingController? _passwordController;
  TextEditingController? _confirmController;
  final GlobalKey _formKey = GlobalKey();

  @override
  void initState() {
    _nameController = TextEditingController();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _confirmController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _nameController!.dispose();
    _emailController!.dispose();
    _passwordController!.dispose();
    _confirmController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Auth auth = Auth();
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.blue),
          onPressed: () => Navigator.of(context).pop(),
        ), 
        centerTitle: true,
        elevation: 0,
        backgroundColor: const Color.fromRGBO(250, 250, 250, 255),
        title: const Text(
          "Sign Up",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 18
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height - 88,
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Image.network("https://upload.wikimedia.org/wikipedia/commons/thumb/6/6f/Logo_of_Twitter.svg/2491px-Logo_of_Twitter.svg.png", height: 50,),
                const SizedBox(height: 20),
                CustomEntryField(hint: "Enter name", controller: _nameController!),
                const SizedBox(height: 10),
                CustomEntryField(hint: "Enter email", controller: _emailController!),
                const SizedBox(height: 10),
                CustomEntryField(hint: "Enter password", controller: _passwordController!, isPassword: true),
                const SizedBox(height: 10),
                CustomEntryField(hint: "Confirm password", controller: _confirmController!, isPassword: true),
                const SizedBox(height: 20),
                CustomFlatButton(label: "Submit", onPressed: () async {
                  final res = await auth.attemptSignUp(
                    _emailController?.text,
                    _nameController?.text,
                    _passwordController?.text,
                    _confirmController?.text
                  );
                  if (res == Errors.none) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Account Created!"))
                    );
                  } else {
                    String errorMessage = "";
                    if (res == Errors.weakError) {
                      errorMessage = "The password provided is too weak.";
                    } else if (res == Errors.matchError) {
                      errorMessage = "Passwords doesn't match";
                    } else if (res == Errors.existsError) {
                      errorMessage = "An account already exists with that email.";
                    } else if (res == Errors.error) {
                      errorMessage = "Failed to create account! Please try later";
                    } else {
                      errorMessage = "You need to fill each field to submit";
                    }
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(errorMessage), backgroundColor: Colors.red,)
                    );
                  }
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
