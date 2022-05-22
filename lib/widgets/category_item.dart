import 'package:devnology_test/config/theme.dart';
import 'package:devnology_test/model/category.dart';
import 'package:flutter/material.dart';

class CategoryItem {
  static content({required Category? category}) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        margin: const EdgeInsets.only(right: 12),
        child: Column(
          children: [
            Flexible(
              child: CircleAvatar(
                radius: 40,
                backgroundImage: NetworkImage(category!.cover!),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              "${category.label}",
              style: AppTheme.textStyleParagraph(fontSize: 15),
            ),
          ],
        ),
      ),
    );
  }

  static seeMore() {
    return GestureDetector(
      onTap: () {},
      child: Column(
        children: [
          Flexible(
            child: CircleAvatar(
              backgroundColor: Colors.white,
              radius: 40,
              child: Icon(
                Icons.arrow_forward_ios_outlined,
                color: AppTheme.secondaryColor,
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            "See All",
            style: AppTheme.textStyleParagraph(fontSize: 15),
          ),
        ],
      ),
    );
  }
}
