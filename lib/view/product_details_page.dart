import 'package:devnology_test/widgets/appbar.dart';
import 'package:devnology_test/widgets/cart_badge_wdgt.dart';
import 'package:flutter/material.dart';

class ProductDetailsPage extends StatefulWidget {
  const ProductDetailsPage({Key? key}) : super(key: key);

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(context, actions: [
        Container(
          margin: const EdgeInsets.only(right: 20),
          child: CartIconBadge(8),
        ),
      ]),
      body: const Center(child: Text("Detalhes")),
    );
  }
}
