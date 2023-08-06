import 'package:flutter/material.dart';
import 'package:twitter/assets/dummy_data.dart';
import 'package:twitter/widgets/users_search_results_widget.dart';

class SearchScreen extends StatefulWidget {

  const SearchScreen({ super.key });

  @override
  State<SearchScreen> createState() => _SearchScreen();
}

class _SearchScreen extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: const Color.fromRGBO(250, 250, 250, 255),
        title: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: NetworkImage(
                            "https://media.licdn.com/dms/image/D4E03AQFax6fciha3yg/profile-displayphoto-shrink_800_800/0/1675347507006?e=2147483647&v=beta&t=HWpYg68Lvvbh7UP6VeaFpRSrnX_xXHszsjwPGqIfFZ0")
                    )
                )
              ),
              const SizedBox(width: 20),
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey[200]!,
                    hintText: "Search...",
                    hintStyle: const TextStyle(color: Colors.grey),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(color: Colors.grey[200]!, width: 1),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: const BorderSide(color: Colors.blue),
                    )
                  ),
                ),
              ),
              const SizedBox(width: 20),
              IconButton(
                icon: const Icon(
                  Icons.settings_outlined,
                  color: Colors.blue,
                  size: 30,
                ),
                onPressed: () {},
              )
            ],
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: userList.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 15.0),
            child: UsersSearchResultsWidget(
              name: userList.elementAt(index)["name"],
              username: userList.elementAt(index)["username"],
              bio: userList.elementAt(index)["bio"],
              imgUrl: userList.elementAt(index)["imgUrl"],
              isVerified: userList.elementAt(index)["isVerified"],
            ),
          );
        },
      ),
    );
  }
}
