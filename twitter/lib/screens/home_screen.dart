import 'package:flutter/material.dart';
import 'package:twitter/widgets/side_bar_menu.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({ super.key });

  @override
  State<HomeScreen> createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
      ),
      drawer: const Drawer(
        child: SideBarMenu(),
      ),
    );
  }
}
