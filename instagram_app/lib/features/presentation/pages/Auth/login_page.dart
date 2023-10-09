import 'package:flutter/material.dart';
import 'package:instagram_app/core/app_assets.dart';
import 'package:instagram_app/core/consts.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:instagram_app/features/presentation/pages/Auth/signup_page.dart';
import 'package:instagram_app/features/presentation/widgets/button_widget.dart';
import 'package:instagram_app/features/presentation/widgets/text_field_Widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backGroundColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
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
              TextFieldWidget(
                hintText: "Enter your Email",
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
              ),
              sizeVer(12),
              TextFieldWidget(
                hintText: "Enter your Password",
                controller: passwordController,
                keyboardType: TextInputType.text,
                isPasswordField: true,
              ),
              sizeVer(24),
              ButtonWidget(
                textBtn: "Login",
                onPressed: () {},
              ),
              Flexible(
                flex: 2,
                child: Container(),
              ),
              const Divider(color: AppColors.secondaryColor),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Don't have and account? ",
                    style: TextStyle(color: AppColors.primaryColor),
                  ),
                  InkWell(
                    onTap: () {
                      //ToDo|> Navigator.pushNamedAndRemoveUntil(context, PageConst.signUpPage, (route) => false);
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SignUpPage(),
                          ),
                          (route) => false);
                    },
                    child: const Text(
                      "Sign Up.",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: AppColors.primaryColor),
                    ),
                  ),
                ],
              ),
              sizeVer(12),
            ],
          ),
        ),
      ),
    );
  }
}
