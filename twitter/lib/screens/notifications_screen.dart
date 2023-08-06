import 'package:flutter/material.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({ super.key });

  @override
  State<NotificationsScreen> createState() => _NotificationsScreen();
}

class _NotificationsScreen extends State<NotificationsScreen> {
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
              const Expanded(
                child: Text(
                  "Notifications",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.black87
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
      body: const Center(
        child: Text(
          "No Notifications Yet",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold
          ),
        ),
      ),
    );
  }
}
