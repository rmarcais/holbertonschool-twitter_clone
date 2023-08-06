import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:twitter/screens/signin_screen.dart';
import 'package:twitter/providers/share_state.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (_) => SharedState()),
      ],
      child: const MaterialApp(
        title: "Twitter clone",
        home: SignIn(),
      ),
    );
  }
}
