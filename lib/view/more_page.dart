import 'package:devnology_test/config/theme.dart';
import 'package:devnology_test/widgets/appbar.dart';
import 'package:devnology_test/widgets/bottom_navigator.dart';
import 'package:flutter/material.dart';

class MorePage extends StatefulWidget {
  const MorePage({Key? key}) : super(key: key);

  @override
  State<MorePage> createState() => _MorePageState();
}

class _MorePageState extends State<MorePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(context),
      body: Center(
        child: Text(
          "More",
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
