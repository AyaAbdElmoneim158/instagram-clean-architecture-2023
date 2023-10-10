import 'package:flutter/material.dart';
import 'package:instagram_app/core/consts.dart';
import 'package:instagram_app/features/presentation/widgets/form_container_widget.dart';
import 'package:instagram_app/features/presentation/widgets/profile_widget.dart';

import 'package:intl/intl.dart';

class SingleCommentWidget extends StatefulWidget {
  final VoidCallback? onLongPressListener;
  final VoidCallback? onLikeClickListener;

  const SingleCommentWidget({
    Key? key,
    this.onLongPressListener,
    this.onLikeClickListener,
  }) : super(key: key);

  @override
  State<SingleCommentWidget> createState() => _SingleCommentWidgetState();
}

class _SingleCommentWidgetState extends State<SingleCommentWidget> {
  final TextEditingController _replayDescriptionController =
      TextEditingController();
  final String _currentUid = "";

  bool _isUserReplaying = false;
  final TextEditingController _descriptionController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onLongPress: widget.onLongPressListener,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // |> Image~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
            SizedBox(
              width: 40,
              height: 40,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: profileWidget(imageUrl: ''),
              ),
            ),
            sizeHor(10),
            // |> CommentManInfo~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "username",
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: AppColors.primaryColor),
                        ),
                        GestureDetector(
                            onTap: widget.onLikeClickListener,
                            child: const Icon(
                              Icons.favorite,
                              size: 20,
                              color: AppColors.darkGreyColor,
                            ))
                      ],
                    ),
                    sizeVer(4),
                    const Text(
                      "description",
                      style: TextStyle(color: AppColors.primaryColor),
                    ),
                    sizeVer(4),
                    Row(
                      children: [
                        Text(
                          DateFormat("dd/MMM/yyy").format(DateTime.now()),
                          style:
                              const TextStyle(color: AppColors.darkGreyColor),
                        ),
                        sizeHor(15),
                        GestureDetector(
                            onTap: () {
                              setState(() {
                                _isUserReplaying = !_isUserReplaying;
                              });
                            },
                            child: const Text(
                              "Replay",
                              style: TextStyle(
                                  color: AppColors.darkGreyColor, fontSize: 12),
                            )),
                        sizeHor(15),
                        GestureDetector(
                          onTap: () {},
                          child: const Text(
                            "View Replays",
                            style: TextStyle(
                                color: AppColors.darkGreyColor, fontSize: 12),
                          ),
                        ),
                      ],
                    ),
                    _isUserReplaying == true ? sizeVer(10) : sizeVer(0),
                    _isUserReplaying == true
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              FormContainerWidget(
                                  hintText: "Post your replay...",
                                  controller: _replayDescriptionController),
                              sizeVer(10),
                              GestureDetector(
                                onTap: () {},
                                child: const Text(
                                  "Post",
                                  style: TextStyle(color: AppColors.blueColor),
                                ),
                              )
                            ],
                          )
                        : const SizedBox(
                            width: 0,
                            height: 0,
                          )
                  ],
                ),
              ),
            ),
            //|>commentSection ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
            // _commentSection(currentUser: 'ld,opsk')
          ],
        ),
      ),
    );
  }

  _commentSection({required currentUser}) {
    return Container(
      width: double.infinity,
      height: 55,
      color: Colors.grey[800],
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Row(
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
            Expanded(
                child: TextFormField(
              controller: _descriptionController,
              style: const TextStyle(color: AppColors.primaryColor),
              decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: "Post your comment...",
                  hintStyle: TextStyle(color: AppColors.secondaryColor)),
            )),
            GestureDetector(
                onTap: () {
                  // _createComment(currentUser);
                },
                child: const Text(
                  "Post",
                  style: TextStyle(fontSize: 15, color: AppColors.blueColor),
                ))
          ],
        ),
      ),
    );
  }

  _createComment(currentUser) {
    // BlocProvider.of<CommentCubit>(context)
    //     .createComment(
    //     comment: CommentEntity(
    //       totalReplays: 0,
    //       commentId: Uuid().v1(),
    //       createAt: Timestamp.now(),
    //       likes: [],
    //       username: currentUser.username,
    //       userProfileUrl: currentUser.profileUrl,
    //       description: _descriptionController.text,
    //       creatorUid: currentUser.uid,
    //       postId: widget.appEntity.postId,
    //     ))
    //     .then((value) {
    //   setState(() {
    //     _descriptionController.clear();
    //   });
    // });
  }

/*
  _createReplay() {
    BlocProvider.of<ReplayCubit>(context)
        .createReplay(
            replay: ReplayEntity(
      replayId: Uuid().v1(),
      createAt: Timestamp.now(),
      likes: [],
      username: widget.currentUser!.username,
      userProfileUrl: widget.currentUser!.profileUrl,
      creatorUid: widget.currentUser!.uid,
      postId: widget.comment.postId,
      commentId: widget.comment.commentId,
      description: _replayDescriptionController.text,
    ))
        .then((value) {
      setState(() {
        _replayDescriptionController.clear();
        _isUserReplaying = false;
      });
    });
  }

  _openBottomModalSheet(
      {required BuildContext context, required ReplayEntity replay}) {
    return showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            height: 150,
            decoration: BoxDecoration(color: backGroundColor.withOpacity(.8)),
            child: SingleChildScrollView(
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Text(
                        "More Options",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: primaryColor),
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Divider(
                      thickness: 1,
                      color: secondaryColor,
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: GestureDetector(
                        onTap: () {
                          _deleteReplay(replay: replay);
                        },
                        child: Text(
                          "Delete Replay",
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                              color: primaryColor),
                        ),
                      ),
                    ),
                    sizeVer(7),
                    Divider(
                      thickness: 1,
                      color: secondaryColor,
                    ),
                    sizeVer(7),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(
                              context, PageConst.updateReplayPage,
                              arguments: replay);

                          // Navigator.push(context, MaterialPageRoute(builder: (context) => UpdatePostPage()));
                        },
                        child: Text(
                          "Update Replay",
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                              color: primaryColor),
                        ),
                      ),
                    ),
                    sizeVer(7),
                  ],
                ),
              ),
            ),
          );
        });
  }

  _deleteReplay({required ReplayEntity replay}) {
    BlocProvider.of<ReplayCubit>(context).deleteReplay(
        replay: ReplayEntity(
            postId: replay.postId,
            commentId: replay.commentId,
            replayId: replay.replayId));
  }

  _likeReplay({required ReplayEntity replay}) {
    BlocProvider.of<ReplayCubit>(context).likeReplay(
        replay: ReplayEntity(
            postId: replay.postId,
            commentId: replay.commentId,
            replayId: replay.replayId));
  }
*/
}
