import 'package:devnology_test/config/navigation.dart';
import 'package:devnology_test/config/theme.dart';
import 'package:flutter/material.dart';

myAppBar(BuildContext context,
    {List<Widget>? actions, bool? centerTitle = false}) {
  return AppBar(
    backgroundColor: AppTheme.primaryColor,
    title: Image.asset(
      'assets/images/Logo.png',
      width: 170,
      height: 28,
    ),
    centerTitle: centerTitle!,
    leading: centerTitle
        ? IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () => Nav.goBack(),
          )
        : null,
    actions: actions,
  );
}
