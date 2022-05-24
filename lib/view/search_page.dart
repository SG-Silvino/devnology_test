import 'package:devnology_test/config/theme.dart';
import 'package:devnology_test/widgets/appbar.dart';
import 'package:devnology_test/widgets/bottom_navigator.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(context),
      body: Center(
        child: Text(
          "Search",
          style: AppTheme.textStyleParagraph(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Colors.black,
          ),
        ),
      ),
      bottomNavigationBar: MyBottomNav(),
    );
  }
}
