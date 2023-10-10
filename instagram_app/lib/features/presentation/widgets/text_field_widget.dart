import 'package:flutter/material.dart';
import 'package:instagram_app/core/consts.dart';

class TextFieldWidget extends StatefulWidget {
  final Key? fieldKey;
  final TextEditingController? controller;
  final void Function(String)? onFieldSubmitted;
  final void Function(String?)? onSaved;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final bool? isPasswordField;
  final String? hintText;
  final String? labelText;
  final String? helperText;

  const TextFieldWidget({
    Key? key,
    this.fieldKey,
    required this.controller,
    this.onFieldSubmitted,
    this.onSaved,
    this.validator,
    this.keyboardType,
    this.hintText,
    this.labelText,
    this.helperText,
    this.isPasswordField,
  }) : super(key: key);

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.secondaryColor.withOpacity(.35),
        borderRadius: BorderRadius.circular(4),
      ),
      child: TextFormField(
        key: widget.fieldKey,
        style: const TextStyle(color: AppColors.primaryColor),
        controller: widget.controller,
        keyboardType: widget.keyboardType,
        obscureText: widget.isPasswordField == true ? _obscureText : false,
        onSaved: widget.onSaved,
        validator: widget.validator,
        onFieldSubmitted: widget.onFieldSubmitted,
        decoration: InputDecoration(
            border: InputBorder.none,
            filled: true,
            hintText: widget.hintText,
            hintStyle: const TextStyle(color: AppColors.secondaryColor),
            labelText: widget.labelText,
            helperText: widget.helperText,
            suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  _obscureText = !_obscureText;
                });
              },
              icon: (widget.isPasswordField == true)
                  ? Icon(
                      _obscureText ? Icons.visibility_off : Icons.visibility,
                      color: _obscureText == false
                          ? AppColors.blueColor
                          : AppColors.secondaryColor,
                    )
                  : const Text(""),
            )),
      ),
    );
  }
}
