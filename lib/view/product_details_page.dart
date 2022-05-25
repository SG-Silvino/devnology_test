import 'package:card_swiper/card_swiper.dart';
import 'package:devnology_test/config/navigation.dart';
import 'package:devnology_test/config/theme.dart';
import 'package:devnology_test/model/cart.dart';
import 'package:devnology_test/model/product.dart';
import 'package:devnology_test/widgets/appbar.dart';
import 'package:devnology_test/widgets/cart_badge_wdgt.dart';
import 'package:devnology_test/widgets/my_btn.dart';
import 'package:devnology_test/widgets/price_format.dart';
import 'package:devnology_test/widgets/my_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:full_screen_image_null_safe/full_screen_image_null_safe.dart';

// ignore: must_be_immutable
class ProductDetailsPage extends StatefulWidget {
  Product? product;

  ProductDetailsPage({required this.product, Key? key}) : super(key: key);

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(context, actions: [
        GestureDetector(
          onTap: () => Nav.gotoPageNamed('cart'),
          child: Container(
            margin: const EdgeInsets.only(right: 20),
            child: CartIconBadge(8),
          ),
        ),
      ]),
      backgroundColor: AppTheme.bgLight,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Container(
          margin: const EdgeInsets.only(bottom: 100),
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(
                  left: 25,
                  right: 25,
                  top: 20,
                  bottom: 10,
                ),
                child: SizedBox(
                  width: double.infinity,
                  child: Text(
                    "${widget.product!.name}",
                    style: AppTheme.textStyleParagraph(
                      fontWeight: FontWeight.w700,
                      fontSize: 15,
                      color: AppTheme.letterblack,
                    ),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 8),
                height: 200,
                child: Swiper(
                  itemCount: widget.product!.imgUrl!.length,
                  itemBuilder: (BuildContext context, int index) {
                    return FullScreenWidget(
                      child: Container(
                        margin: const EdgeInsets.only(bottom: 10),
                        child: Image.network(
                          "${widget.product!.imgUrl![index]}",
                        ),
                      ),
                    );
                  },
                  pagination: SwiperPagination(
                    builder: DotSwiperPaginationBuilder(
                        activeColor: AppTheme.primaryColor,
                        color: const Color(0xffc4c4c4)),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 20),
                child: Column(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: Text(
                        "Price:",
                        style: AppTheme.textStyleParagraph(
                          fontWeight: FontWeight.w700,
                          color: AppTheme.letterblack,
                          fontSize: 15,
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(bottom: 15),
                      width: double.infinity,
                      child: priceFormat(
                        widget.product!.price!,
                        style: AppTheme.textStyleParagraph(
                          fontSize: 26,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      margin: const EdgeInsets.only(bottom: 10),
                      child: Text(
                        "About this item:",
                        style: AppTheme.textStyleParagraph(
                          fontWeight: FontWeight.w700,
                          color: AppTheme.letterblack,
                          fontSize: 15,
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(right: 22, bottom: 6),
                      width: double.infinity,
                      child: Text(
                        "${widget.product!.details}",
                        style: AppTheme.textStyleParagraph(
                          color: AppTheme.letterblack,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        width: double.infinity,
        height: 86,
        color: AppTheme.thirdColor,
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MyBtn.roundedBtnWithIcon(
                label: "Share This",
                customIcon: Container(
                  margin: const EdgeInsets.only(right: 8),
                  child: SvgPicture.asset(
                    'assets/icons/arrow_up.svg',
                    color: AppTheme.primaryColor,
                  ),
                ),
                backgroundColor: AppTheme.letterWhite,
                foregroundColor: AppTheme.primaryColor,
                onPressed: () {},
              ),
              MyBtn.roundedBtnWithIcon(
                label: "Add to cart",
                iconData: Icons.arrow_forward_ios_outlined,
                backgroundColor: AppTheme.primaryColor,
                onPressed: () async {
                  MyCart cart = MyCart();

                  cart.addToCart(context, widget.product!).then((value) {
                    MyDialog.showSnackBarText(
                        title: "Cart", msg: "Item added to cart");
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
