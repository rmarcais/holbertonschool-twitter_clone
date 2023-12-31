import 'package:flutter/material.dart';

class UsersSearchResultsWidget extends StatelessWidget {
  final String? name;
  final String? username;
  final String? bio;
  final String? imgUrl;
  final bool isVerified;

  const UsersSearchResultsWidget({ super.key, this.name, this.username, this.bio, this.imgUrl, this.isVerified = false });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(width: 15),
        Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: Colors.blue,
              shape: BoxShape.circle,
              image: DecorationImage(
                image: NetworkImage(imgUrl!))
            )
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name!,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              Text(
                bio!,
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
              Text(
                username!,
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 18,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: 10),
        if (isVerified)
          Container(
              width: 30,
              height: 30,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: NetworkImage("https://upload.wikimedia.org/wikipedia/commons/thumb/e/e4/Twitter_Verified_Badge.svg/1200px-Twitter_Verified_Badge.svg.png"))
              )
          ),
        if (!isVerified)
          const SizedBox(width: 30),
        const SizedBox(width: 15),
      ],
    );
  }
}
