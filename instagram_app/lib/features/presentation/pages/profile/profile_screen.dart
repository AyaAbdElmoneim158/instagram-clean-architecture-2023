import 'package:flutter/material.dart';
import 'package:instagram_app/core/consts.dart';
import 'package:instagram_app/features/presentation/pages/profile/edit_profile_page.dart';
import 'package:instagram_app/features/presentation/widgets/profile_widget.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backGroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.backGroundColor,
        title: const Text(
          "username",
          style: TextStyle(color: AppColors.primaryColor),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: InkWell(
                onTap: () {
                  _openBottomModalSheet(context);
                },
                child: const Icon(
                  Icons.menu,
                  color: AppColors.primaryColor,
                )),
          )
        ],
      ),
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //|> Numbers
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 80,
                    height: 80,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(40),
                      child: profileWidget(imageUrl: ''),
                    ),
                  ),
                  Row(
                    children: [
                      Column(
                        children: [
                          const Text(
                            "2",
                            style: TextStyle(
                              color: AppColors.primaryColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          sizeVer(8),
                          const Text(
                            "Posts",
                            style: TextStyle(
                              color: AppColors.primaryColor,
                            ),
                          )
                        ],
                      ),
                      sizeHor(25),
                      GestureDetector(
                        onTap: () {},
                        child: Column(
                          children: [
                            const Text(
                              "0",
                              style: TextStyle(
                                color: AppColors.primaryColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            sizeVer(8),
                            const Text(
                              "Followers",
                              style: TextStyle(
                                color: AppColors.primaryColor,
                              ),
                            )
                          ],
                        ),
                      ),
                      sizeHor(25),
                      GestureDetector(
                        onTap: () {},
                        child: Column(
                          children: [
                            const Text(
                              "0",
                              style: TextStyle(
                                color: AppColors.primaryColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            sizeVer(8),
                            const Text(
                              "Following",
                              style: TextStyle(
                                color: AppColors.primaryColor,
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),
              sizeVer(10),
              //|> name, bio
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "username ",
                    style: TextStyle(
                      color: AppColors.primaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  sizeVer(10),
                  const Text(
                    "bio",
                    style: TextStyle(
                      color: AppColors.primaryColor,
                    ),
                  ),
                ],
              ),
              sizeVer(10),
              // |> Your posts
              Expanded(
                child: GridView.builder(
                    itemCount: 33,
                    physics: const ScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 5,
                      mainAxisSpacing: 5,
                    ),
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {},
                        child: SizedBox(
                          width: 100,
                          height: 100,
                          child: profileWidget(imageUrl: ""),
                        ),
                      );
                    }),
              ),
            ],
          )),
    );
  }

//|> _openBottomModalSheet
  _openBottomModalSheet(BuildContext context) {
    return showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            height: 150,
            decoration: BoxDecoration(
              color: AppColors.backGroundColor.withOpacity(.8),
            ),
            child: SingleChildScrollView(
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //|> More Options-------------------------------------------
                    const Padding(
                      padding: EdgeInsets.only(left: 10.0),
                      child: Text(
                        "More Options",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: AppColors.primaryColor,
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Divider(
                      thickness: 1,
                      color: AppColors.secondaryColor,
                    ),
                    const SizedBox(height: 8),
                    //|> Edit Profile-------------------------------------------
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: GestureDetector(
                        onTap: () {
                          //ToDo|> Navigator.pushNamed(context, PageConst.editProfilePage,arguments: widget.currentUser);
                          Navigator.push(context, MaterialPageRoute(builder: (context) =>const EditProfilePage()));
                        },
                        child: const Text(
                          "Edit Profile",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                            color: AppColors.primaryColor,
                          ),
                        ),
                      ),
                    ),
                    sizeVer(7),
                    const Divider(
                      thickness: 1,
                      color: AppColors.secondaryColor,
                    ),
                    sizeVer(7),
                    //|> Logout-------------------------------------------------
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: InkWell(
                        onTap: () {
                          // BlocProvider.of<AuthCubit>(context).loggedOut();
                          // Navigator.pushNamedAndRemoveUntil(context, PageConst.signInPage, (route) => false);
                        },
                        child: const Text(
                          "Logout",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                            color: AppColors.primaryColor,
                          ),
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
}
