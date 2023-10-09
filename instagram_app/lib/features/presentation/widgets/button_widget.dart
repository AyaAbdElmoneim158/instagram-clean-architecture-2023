import 'package:flutter/material.dart';
import 'package:instagram_app/core/consts.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({
    super.key,
    required this.textBtn,
    this.onPressed,
  });
  final String textBtn;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 46,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: const ButtonStyle(
          backgroundColor: MaterialStatePropertyAll(
            AppColors.blueColor,
          ),
          textStyle: MaterialStatePropertyAll(
            TextStyle(
              color: AppColors.primaryColor,
              fontSize: 20,
            ),
          ),
        ),
        child: Text(textBtn),
      ),
    );
  }
}
