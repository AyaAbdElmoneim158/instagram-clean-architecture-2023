// ignore_for_file: unused_element

import 'package:flutter/material.dart';
import 'package:instagram_app/core/consts.dart';
import 'package:instagram_app/features/presentation/pages/favorite/favorite_screen.dart';
import 'package:instagram_app/features/presentation/pages/home/home_screen.dart';
import 'package:instagram_app/features/presentation/pages/post/post_screen.dart';
import 'package:instagram_app/features/presentation/pages/profile/profile_screen.dart';
import 'package:instagram_app/features/presentation/pages/search/search_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;
  late PageController pageController = PageController();

  @override
  void initState() {
    pageController = PageController();
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  void navigationTapped(int index) {
    pageController.jumpToPage(index);
  }

  void onPageChanged(int index) {
    setState(() {
      _currentIndex = index;
      debugPrint('$_currentIndex');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backGroundColor,
      bottomNavigationBar: BottomNavigationBar(
          // fixedColor: AppColors.backGroundColor,
          selectedItemColor: AppColors.primaryColor,
          unselectedItemColor: AppColors.darkGreyColor,
          backgroundColor: AppColors.backGroundColor,
          type: BottomNavigationBarType.fixed,
          // currentIndex: currentIndex,
          onTap: navigationTapped,
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                color: _currentIndex == 0
                    ? AppColors.primaryColor
                    : AppColors.darkGreyColor,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.search,
                color: _currentIndex == 1
                    ? AppColors.primaryColor
                    : AppColors.darkGreyColor,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.add_circle_outline_rounded,
                color: _currentIndex == 2
                    ? AppColors.primaryColor
                    : AppColors.darkGreyColor,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.favorite,
                color: _currentIndex == 3
                    ? AppColors.primaryColor
                    : AppColors.darkGreyColor,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.person_pin_circle,
                color: _currentIndex == 4
                    ? AppColors.primaryColor
                    : AppColors.darkGreyColor,
              ),
              label: '',
            ),
          ]),
      body: PageView(
        controller: pageController,
        onPageChanged: onPageChanged,
        children: const [
          HomeScreen(),
          SearchScreen(),
          PostScreen(),
          FavoriteScreen(),
          ProfileScreen()
        ],
      ),
    );
  }
}
