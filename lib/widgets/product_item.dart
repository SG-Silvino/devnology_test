import 'package:devnology_test/config/navigation.dart';
import 'package:flutter/material.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Nav.gotoPageNamed(context, 'product'),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        margin: const EdgeInsets.only(right: 11, top: 24, bottom: 24),
        width: 101,
        height: 135,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Text("Image"),
            Text("Product name"),
            Text("Price"),
          ],
        ),
      ),
    );
  }
}
