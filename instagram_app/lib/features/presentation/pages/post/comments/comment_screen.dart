import 'package:flutter/material.dart';
import 'package:instagram_app/core/consts.dart';
import 'package:instagram_app/features/presentation/pages/post/comments/widgets/single_comment_widget.dart';
import 'package:instagram_app/features/presentation/widgets/profile_widget.dart';

class CommentPage extends StatelessWidget {
  const CommentPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.backGroundColor,
        appBar: AppBar(
          backgroundColor: AppColors.backGroundColor,
          leading: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: const Icon(Icons.arrow_back),
          ),
          title: const Text("Comment"),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10.0,
                vertical: 10,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Who this Comment post ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                  Row(
                    children: [
                      SizedBox(
                        width: 40,
                        height: 40,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: profileWidget(imageUrl: ""),
                        ),
                      ),
                      sizeHor(10),
                      const Text(
                        "username",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: AppColors.primaryColor),
                      ),
                    ],
                  ),
                  sizeVer(10),
                  const Text(
                    "description",
                    style: TextStyle(color: AppColors.primaryColor),
                  ),
                ],
              ),
            ),
            sizeVer(10),
            const Divider(color: AppColors.secondaryColor),
            sizeVer(10),
            //|> All Comments ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
            Expanded(
              child: ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) => SingleCommentWidget(
                  // currentUser: "singleUser",
                  // comment: "singleComment",
                  onLongPressListener: () {
                    // _openBottomModalSheet(
                    //   context: context,
                    //   comment: commentState.comments[index],
                    // );
                  },
                  onLikeClickListener: () {
                    // _likeComment(comment: commentState.comments[index]);
                  },
                ),
              ),
            ),
            // _commentSection(currentUser: singleUser)
          ],
        ));
  }
}
