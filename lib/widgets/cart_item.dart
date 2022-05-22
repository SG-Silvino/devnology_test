import 'package:devnology_test/config/theme.dart';
import 'package:devnology_test/model/product.dart';
import 'package:devnology_test/widgets/price_format.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CartItem extends StatelessWidget {
  Product? product;

  CartItem({required this.product, Key? key}) : super(key: key);

  cartBtn({
    required String? label,
    required double? size,
    void Function()? onPressed,
  }) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
            color: AppTheme.primaryColor,
            borderRadius: BorderRadius.circular(size!)),
        width: size,
        height: size,
        alignment: Alignment.center,
        child: Text(
          "$label",
          style: AppTheme.textStyleParagraph(
            fontSize: 12,
            color: AppTheme.letterWhite,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        margin: const EdgeInsets.only(left: 25, top: 24, bottom: 20),
        height: 100,
        child: Row(
          children: [
            Container(
              width: 100,
              height: 100,
              margin: const EdgeInsets.only(right: 22),
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(product!.imgUrl![0]))),
            ),
            SizedBox(
              width: 204,
              child: Column(
                children: [
                  SizedBox(
                    height: 41,
                    width: double.infinity,
                    child: Text(
                      "${product!.name}",
                      softWrap: true,
                      maxLines: 3,
                      overflow: TextOverflow.visible,
                      style: AppTheme.textStyleParagraph(
                        fontSize: 11,
                        color: AppTheme.letterblack,
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    width: double.infinity,
                    child: priceFormat(
                      product!.price!,
                      style: AppTheme.textStyleParagraph(
                        fontWeight: FontWeight.w700,
                        color: AppTheme.letterblack,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: SizedBox(
                      width: 48,
                      height: 16,
                      child: Row(
                        children: [
                          cartBtn(label: "-", size: 13, onPressed: () {}),
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 7),
                            child: Text(
                              "1",
                              style: AppTheme.textStyleParagraph(
                                fontWeight: FontWeight.w700,
                                color: AppTheme.letterblack,
                              ),
                            ),
                          ),
                          cartBtn(label: "+", size: 14, onPressed: () {}),
                        ],
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
