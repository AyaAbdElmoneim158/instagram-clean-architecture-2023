import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:instagram_app/core/consts.dart';
import 'package:instagram_app/features/presentation/pages/profile/widgets/profile_field_widget.dart';
import 'package:instagram_app/features/presentation/widgets/profile_widget.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({Key? key}) : super(key: key);

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  TextEditingController? _nameController;
  TextEditingController? _usernameController;
  TextEditingController? _websiteController;
  TextEditingController? _bioController;

  @override
  void initState() {
    _nameController = TextEditingController(
      text: 'Name',
    );
    _usernameController = TextEditingController(
      text: 'Username',
    );
    _websiteController = TextEditingController(
      text: 'Website',
    );
    _bioController = TextEditingController(
      text: 'Bio',
    );
    super.initState();
  }

  final bool _isUpdating = false;

  File? _image;

  Future selectImage() async {
    try {
      final pickedFile =
          await ImagePicker.platform.getImage(source: ImageSource.gallery);

      setState(() {
        if (pickedFile != null) {
          _image = File(pickedFile.path);
        } else {
          debugPrint("no image has been selected");
        }
      });
    } catch (e) {
      toast("some error occured $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backGroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.backGroundColor,
        title: const Text("Edit Profile"),
        leading: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: const Icon(
              Icons.close,
              size: 32,
            )),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: GestureDetector(
              onTap: (){},
              child: const Icon(
                Icons.done,
                color: AppColors.blueColor,
                size: 32,
              ),
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              //|> Image ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
              Center(
                child: SizedBox(
                  width: 100,
                  height: 100,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: profileWidget(imageUrl: '', image: _image),
                  ),
                ),
              ),
              sizeVer(15),
              Center(
                child: GestureDetector(
                  onTap: selectImage,
                  child: const Text(
                    "Change profile photo",
                    style: TextStyle(
                      color: AppColors.blueColor,
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
              sizeVer(15),
              ProfileFieldWidget(title: "Name", controller: _nameController),
              sizeVer(15),
              //|> Fields ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
              ProfileFieldWidget(
                  title: "Username", controller: _usernameController),
              sizeVer(15),
              ProfileFieldWidget(
                  title: "Website", controller: _websiteController),
              sizeVer(15),
              ProfileFieldWidget(title: "Bio", controller: _bioController),
              sizeVer(10),
              //|> Upload-image ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
              _isUpdating == true
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Please wait...",
                          style: TextStyle(color: Colors.white),
                        ),
                        sizeHor(10),
                        const CircularProgressIndicator()
                      ],
                    )
                  : const SizedBox(
                      width: 0,
                      height: 0,
                    )
            ],
          ),
        ),
      ),
    );
  }


}
