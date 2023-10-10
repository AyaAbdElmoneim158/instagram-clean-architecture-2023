import 'package:flutter/material.dart';
import 'package:instagram_app/core/consts.dart';

class ProfileFieldWidget extends StatelessWidget {
  final TextEditingController? controller;
  final String? title;
  const ProfileFieldWidget({Key? key, this.title, this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "$title",
          style: const TextStyle(color: AppColors.primaryColor, fontSize: 16),
        ),
        sizeVer(10),
        TextFormField(
          controller: controller,
          style: const TextStyle(color: AppColors.primaryColor),
          decoration: const InputDecoration(
              border: InputBorder.none,
              labelStyle: TextStyle(color: AppColors.primaryColor)),
        ),
        Container(
          width: double.infinity,
          height: 1,
          color: AppColors.secondaryColor,
        )
      ],
    );
  }
}
