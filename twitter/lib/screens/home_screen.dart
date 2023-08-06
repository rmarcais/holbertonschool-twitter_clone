import 'package:flutter/material.dart';
import 'package:twitter/assets/dummy_posts.dart';
import 'package:twitter/widgets/post_widget.dart';
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
      body: ListView.builder(
        itemCount: postList.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.fromLTRB(15.0, 15.0, 30.0, 15.0),
            child: PostWidget(
              name: postList.elementAt(index)["name"],
              username: postList.elementAt(index)["username"],
              content: postList.elementAt(index)["content"],
              imgUrl: postList.elementAt(index)["imgUrl"],
              isVerified: postList.elementAt(index)["isVerified"],
              likes: postList.elementAt(index)["likes"],
              retweets: postList.elementAt(index)["retweets"],
              comments: postList.elementAt(index)["comments"],
            ),
          );
        },
      ),
    );
  }
}
