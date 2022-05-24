import 'package:devnology_test/config/navigation.dart';
import 'package:devnology_test/config/theme.dart';
import 'package:devnology_test/model/product.dart';
import 'package:devnology_test/view/product_details_page.dart';
import 'package:devnology_test/widgets/price_format.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ProductItem extends StatelessWidget {
  Product? product;

  ProductItem({required this.product, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Nav.gotoPage(ProductDetailsPage(product: product)),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        margin: const EdgeInsets.only(right: 11, top: 24, bottom: 24),
        width: 101,
        height: 135,
        child: Column(
          children: [
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                  image: DecorationImage(
                image: NetworkImage(product!.imgUrl![0]),
              )),
            ),
            Container(
              margin: const EdgeInsets.only(left: 8, right: 8),
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 4, bottom: 6),
                    child: Text(
                      "${product!.name}",
                      maxLines: 2,
                      softWrap: true,
                      overflow: TextOverflow.visible,
                      style: AppTheme.textStyleParagraph(
                        fontSize: 11,
                        fontWeight: FontWeight.w300,
                        color: AppTheme.letterblack,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: priceFormat(
                      product!.price!,
                      style: AppTheme.textStyleParagraph(
                        color: AppTheme.letterblack,
                        fontWeight: FontWeight.w700,
                        fontSize: 13,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
