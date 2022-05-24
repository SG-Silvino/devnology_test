import 'package:devnology_test/main.dart';
import 'package:devnology_test/widgets/appbar.dart';
import 'package:devnology_test/widgets/bottom_navigator.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(context),
      body: Center(
        child: Text("UserID: $userID"),
      ),
      bottomNavigationBar: MyBottomNav(),
    );
  }
}
