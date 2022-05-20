import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CategoryItem extends StatelessWidget {
  int? index;

  CategoryItem({this.index, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        margin: const EdgeInsets.only(right: 12),
        child: Column(
          children: [
            CircleAvatar(
              radius: 45,
              child: Text(index.toString()),
            ),
            const SizedBox(height: 8),
            Text(index.toString()),
          ],
        ),
      ),
    );
  }
}
