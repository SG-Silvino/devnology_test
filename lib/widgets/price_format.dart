import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

Widget priceFormat(double price, {TextStyle? style}) {
  return Text(
    NumberFormat.simpleCurrency().format(price),
    style: style!,
  );
}
