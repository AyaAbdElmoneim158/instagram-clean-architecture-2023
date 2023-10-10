import 'package:flutter/material.dart';
import 'package:instagram_app/core/consts.dart';

class PostScreen extends StatelessWidget {
  const PostScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircleAvatar(
        radius: 64,
        backgroundColor: AppColors.secondaryColor,
        child: Icon(
          Icons.upload,
          color: AppColors.primaryColor,
        ),
      ),
    );
  }
}
