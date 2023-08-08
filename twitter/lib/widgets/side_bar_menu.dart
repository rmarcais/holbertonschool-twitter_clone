import 'package:flutter/material.dart';
import 'package:twitter/providers/auth_state.dart';
import 'package:twitter/screens/signin_screen.dart';

class SideBarMenu extends StatefulWidget {
  const SideBarMenu({ super.key });

  @override
  State<SideBarMenu> createState() => _SideBarMenu();
}

class _SideBarMenu extends State<SideBarMenu> {
  @override
  Widget build(BuildContext context) {
    final Auth auth = Auth();
    TextStyle defaultTextStyle = const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.bold,
    );
    return ListView(
      children: [
        DrawerHeader(
          decoration: const BoxDecoration(
            border: Border(
              bottom: BorderSide(color: Colors.black, width: 1.0),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 70,
                height: 70,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: NetworkImage(
                            "https://media.licdn.com/dms/image/D4E03AQFax6fciha3yg/profile-displayphoto-shrink_800_800/0/1675347507006?e=2147483647&v=beta&t=HWpYg68Lvvbh7UP6VeaFpRSrnX_xXHszsjwPGqIfFZ0")
                    )
                )
              ),
              const SizedBox(height: 10),
              const Text(
                "Rémi Marçais",
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 18,
                  fontWeight: FontWeight.bold
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                "524 Followers 321 Following",
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
        ListTile(
          leading: const Icon(Icons.person),
          title: Text(
            'Profile',
            style: defaultTextStyle,
          ),
          onTap: () {},
        ),
        ListTile(
          leading: const Icon(Icons.list),
          title: Text(
            'Lists',
            style: defaultTextStyle,
          ),
          onTap: () {},
        ),
        ListTile(
          leading: const Icon(Icons.bookmark),
          title: Text(
            'Bookmark',
            style: defaultTextStyle,
          ),
          onTap: () {},
        ),
        ListTile(
          leading: const Icon(Icons.flash_on),
          title: Text(
            'Moments',
            style: defaultTextStyle,
          ),
          onTap: () {},
        ),
        const SizedBox(height: 8),
        const Divider(
          color: Colors.black,
          height: 1,
          thickness: 1,
        ),
        const SizedBox(height: 8),
        ListTile(
          title: Text(
            'Settings and privacy',
            style: defaultTextStyle,
          ),
          onTap: () {},
        ),
        ListTile(
          title: Text(
            'Help Center',
            style: defaultTextStyle,
          ),
          onTap: () {},
        ),
        ListTile(
          title: Text(
            'Logout',
            style: defaultTextStyle,
          ),
          onTap: () async {
            await auth.logout();
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const SignIn()),
            );
          },
        ),
      ],
    );
  }
}
