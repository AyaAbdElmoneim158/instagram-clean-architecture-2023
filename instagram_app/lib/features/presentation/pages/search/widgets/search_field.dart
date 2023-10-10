import 'package:flutter/material.dart';
import 'package:instagram_app/core/consts.dart';

class SearchField extends StatelessWidget {
  final TextEditingController controller;
  const SearchField({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 45,
      decoration: BoxDecoration(
        color: AppColors.secondaryColor.withOpacity(.3),
        borderRadius: BorderRadius.circular(15),
      ),
      child: TextFormField(
        controller: controller,
        style: const TextStyle(color: AppColors.primaryColor),
        decoration: const InputDecoration(
            border: InputBorder.none,
            prefixIcon: Icon(
              Icons.search,
              color: AppColors.primaryColor,
            ),
            hintText: "Search",
            hintStyle:
                TextStyle(color: AppColors.secondaryColor, fontSize: 15)),
      ),
    );
  }
}
