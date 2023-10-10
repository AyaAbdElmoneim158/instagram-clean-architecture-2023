import 'package:flutter/material.dart';
import 'package:instagram_app/features/presentation/pages/search/widgets/search_field.dart';
import 'package:instagram_app/core/consts.dart';
import 'package:instagram_app/features/presentation/widgets/profile_widget.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.backGroundColor,
        body: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              sizeVer(24),
              SearchField(controller: searchController),
              sizeVer(12),
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
          ),
        ),
      ),
    );
  }
}
