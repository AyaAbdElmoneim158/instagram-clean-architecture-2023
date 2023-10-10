import 'package:flutter/material.dart';
import 'package:instagram_app/core/consts.dart';
import 'package:instagram_app/features/presentation/pages/post/comments/comment_screen.dart';
import 'package:instagram_app/features/presentation/pages/post/update_post_page.dart';
import 'package:instagram_app/features/presentation/widgets/profile_widget.dart';
import 'package:intl/intl.dart';
import 'package:flutter_icons_null_safety/flutter_icons_null_safety.dart';

class SinglePostCardWidget extends StatelessWidget {
  const SinglePostCardWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //|> 1. Who
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                SizedBox(
                  width: 30,
                  height: 30,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: profileWidget(imageUrl: "userProfileUrl"),
                  ),
                ),
                sizeHor(10),
                const Text(
                  "username",
                  style: TextStyle(
                    color: AppColors.primaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            GestureDetector(
              onTap:() {
                Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>  const UpdatePostPage(),
                        ),
                      );
              }, 
              child: const Icon(
                Icons.more_vert,
                color: AppColors.primaryColor,
              ),
            )
          ],
        ),
        sizeHor(10),
        //|> 2. PostImage
        SizedBox(
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.30,
          child: profileWidget(imageUrl: "postImageUrl"),
        ),
        sizeVer(10),
        //|> 3. funPost
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                GestureDetector(
                  onTap: () {},
                  child: const Icon(
                    Icons.favorite_outline,
                    color: AppColors.primaryColor,
                  ),
                ),
                sizeHor(10),
                GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const CommentPage(),
                        ),
                      );
                    },
                    child: const Icon(
                      Feather.message_circle,
                      color: AppColors.primaryColor,
                    )),
                sizeHor(10),
                const Icon(
                  Feather.send,
                  color: AppColors.primaryColor,
                ),
              ],
            ),
            const Icon(
              Icons.bookmark_border,
              color: AppColors.primaryColor,
            ),
          ],
        ),
        //|> 4. postInfo
        sizeVer(10),
        const Text(
          "1 likes",
          style: TextStyle(
              color: AppColors.primaryColor, fontWeight: FontWeight.bold),
        ),
        sizeVer(10),
        Row(
          children: [
            const Text(
              "username",
              style: TextStyle(
                  color: AppColors.primaryColor, fontWeight: FontWeight.bold),
            ),
            sizeHor(10),
            const Text(
              "description",
              style: TextStyle(color: AppColors.primaryColor),
            ),
          ],
        ),
        sizeVer(10),
        GestureDetector(
            onTap: () {},
            child: const Text(
              "View all 3 comments",
              style: TextStyle(color: AppColors.darkGreyColor),
            )),
        sizeVer(10),
        Text(
          DateFormat("dd/MMM/yyy").format(DateTime.now()),
          style: const TextStyle(color: AppColors.darkGreyColor),
        ),
      ],
    );
  }
}
