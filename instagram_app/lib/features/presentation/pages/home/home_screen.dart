import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:instagram_app/features/presentation/pages/home/widgets/single_post_card_widget.dart';
import '../../../../core/app_assets.dart';
import '../../../../core/consts.dart';
import 'package:flutter_icons_null_safety/flutter_icons_null_safety.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backGroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.backGroundColor,
        title: SvgPicture.asset(
          AppAssets.instagramLogo,
          // ignore: deprecated_member_use
          color: AppColors.primaryColor,
          height: 32,
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 10.0),
            child: Icon(
              MaterialCommunityIcons.facebook_messenger,
              color: AppColors.primaryColor,
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.separated(
          itemBuilder: (context, index) => const SinglePostCardWidget(),
          separatorBuilder: (context, index) => sizeVer(12),
          itemCount: 12,
        ),
      ),
    );
  }
}
