import 'package:flutter/material.dart';
import 'package:instagram_app/features/presentation/pages/search/widgets/search_field.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController searchController = TextEditingController();
    return SearchField(controller: searchController);
  }
}
