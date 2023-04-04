import 'package:flutter/material.dart';
import 'package:ipoanki/app/modules/search/presentation/pages/search_controller.dart';

import '../../../../common/widgets/state_controller.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends StateController<SearchPage, SearchController> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text('SearchBar')),
    );
  }
}
