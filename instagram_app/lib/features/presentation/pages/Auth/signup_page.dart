import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:instagram_app/core/app_assets.dart';
import 'package:instagram_app/core/consts.dart';
import 'package:instagram_app/features/presentation/pages/Auth/login_page.dart';
import 'package:instagram_app/features/presentation/widgets/button_widget.dart';
import 'package:instagram_app/features/presentation/widgets/profile_widget.dart';
import 'package:instagram_app/features/presentation/widgets/text_field_Widget.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _bioController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _usernameController.dispose();
    _bioController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backGroundColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          children: [
            Flexible(
              flex: 2,
              child: Container(),
            ),
            SvgPicture.asset(
              AppAssets.instagramLogo,
              // ignore: deprecated_member_use
              color: AppColors.primaryColor,
            ),
            sizeVer(24),
            const ProfileImage(),
            sizeVer(24),
            TextFieldWidget(
              controller: _usernameController,
              hintText: "Enter your User name",
              keyboardType: TextInputType.text,
            ),
            sizeVer(12),
            TextFieldWidget(
              controller: _emailController,
              hintText: "Enter your Email",
              keyboardType: TextInputType.emailAddress,
            ),
            sizeVer(12),
            TextFieldWidget(
              controller: _bioController,
              hintText: "Enter your Bio",
              keyboardType: TextInputType.text,
            ),
            sizeVer(12),
            TextFieldWidget(
              controller: _passwordController,
              hintText: "Enter your Password",
              keyboardType: TextInputType.text,
              isPasswordField: true,
            ),
            sizeVer(24),
            ButtonWidget(textBtn: "Login", onPressed: () {}),
            Flexible(
              flex: 2,
              child: Container(),
            ),
            const Divider(color: AppColors.secondaryColor),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Already have an account? ",
                  style: TextStyle(color: AppColors.primaryColor),
                ),
                InkWell(
                  onTap: () {
                    //ToDo|> Navigator.pushNamedAndRemoveUntil(context, PageConst.signInPage, (route) => false);

                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginPage()),
                        (route) => false);
                  },
                  child: const Text(
                    "Sign in.",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: AppColors.primaryColor),
                  ),
                )
              ],
            ),
            sizeVer(12),
          ],
        ),
      ),
    );
  }
}

class ProfileImage extends StatelessWidget {
  const ProfileImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          SizedBox(
            width: 60,
            height: 60,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: profileWidget(image: null), //   File? _image;
            ),
          ),
          Positioned(
            right: -10,
            bottom: -15,
            child: IconButton(
              onPressed: () {}, //selectImage,
              icon: const Icon(
                Icons.add_a_photo,
                size: 18,
                color: AppColors.blueColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
