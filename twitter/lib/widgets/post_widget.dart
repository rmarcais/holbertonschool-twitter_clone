import 'package:flutter/material.dart';

class PostWidget extends StatelessWidget {
  final String? name;
  final String? username;
  final String? content;
  final String? imgUrl;
  final bool isVerified;
  final int likes;
  final int retweets;
  final int comments;

  const PostWidget({
    super.key,
    required this.name,
    required this.username,
    required this.content,
    required this.imgUrl,
    this.isVerified = false,
    this.likes = 0,
    this.retweets = 0,
    this.comments = 0,
  });

    @override
    Widget build(BuildContext context) {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
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
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const SizedBox(width: 10),
                    Text(
                      name!,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(width: 10),
                    if (isVerified)
                      Container(
                        width: 16,
                        height: 16,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: NetworkImage("https://upload.wikimedia.org/wikipedia/commons/thumb/e/e4/Twitter_Verified_Badge.svg/1200px-Twitter_Verified_Badge.svg.png"))
                        )
                      ),
                    const SizedBox(width: 10),
                    Text(
                      "${username!} • 1h",
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.grey
                      ),
                    ),
                    const SizedBox(width: 10),
                    const Icon(
                      Icons.more_horiz,
                      size: 25,
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Text(
                  content!,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    const Icon(
                      Icons.mode_comment_outlined,
                      color: Colors.grey,
                    ),
                    Text(
                      " $comments",
                      style: const TextStyle(
                        fontSize: 18,
                        color: Colors.grey
                      ),
                    ),
                    const SizedBox(width: 10),
                    const Icon(
                      Icons.swap_horiz,
                      color: Colors.grey,
                    ),
                    Text(
                      " $retweets",
                      style: const TextStyle(
                        fontSize: 18,
                        color: Colors.grey
                      ),
                    ),
                    const SizedBox(width: 10),
                    const Icon(
                      Icons.favorite_border,
                      color: Colors.grey,
                    ),
                    Text(
                      " $likes",
                      style: const TextStyle(
                        fontSize: 18,
                        color: Colors.grey
                      ),
                    ),
                    const Expanded(
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Icon(
                            Icons.share,
                            color: Colors.grey,
                          ),
                        )
                    ),
                    const SizedBox(width: 20),
                  ],
                ),
              ],
            ),
          ),
        ],
      );
    }
}
