import 'package:devnology_test/config/theme.dart';
import 'package:flutter/material.dart';

Widget customProgress({double? value}) {
  return Center(
    child: CircularProgressIndicator(
        value: value,
        valueColor: AlwaysStoppedAnimation<Color>(AppTheme.secondaryColor)),
  );
}
