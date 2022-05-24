import 'package:devnology_test/config/theme.dart';
import 'package:devnology_test/main.dart';
import 'package:devnology_test/model/banner.dart';
import 'package:devnology_test/model/category.dart';
import 'package:devnology_test/model/product.dart';
import 'package:devnology_test/widgets/appbar.dart';
import 'package:devnology_test/widgets/banner_item.dart';
import 'package:devnology_test/widgets/bottom_navigator.dart';
import 'package:devnology_test/widgets/category_item.dart';
import 'package:devnology_test/widgets/list_wdgt.dart';
import 'package:devnology_test/widgets/product_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.bgGrey,
      appBar: myAppBar(
        context,
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SvgPicture.asset(
                  'assets/icons/chat.svg',
                  color: AppTheme.iconLight,
                ),
                const SizedBox(width: 20),
                SvgPicture.asset(
                  'assets/icons/notification.svg',
                  color: AppTheme.iconLight,
                ),
              ],
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: SizedBox(
          height: 600,
          child: Column(
            children: [
              SizedBox(
                height: 160,
                child: MyList.header(
                  "Categories",
                  MyList.body(
                    flex: 1,
                    itemCount: categoryList[0]['categories'].length,
                    itemBuilder: (context, index) {
                      Category category = Category.fromMap(
                          categoryList[0]['categories'][index]);

                      if (index == categoryList[0]['categories'].length - 1) {
                        return Row(
                          children: [
                            CategoryItem.content(category: category),
                            CategoryItem.seeMore(),
                          ],
                        );
                      } else {
                        return CategoryItem.content(category: category);
                      }
                    },
                  ),
                ),
              ),
              SizedBox(
                height: 250,
                child: MyList.header(
                  "Lastest",
                  MyList.body(
                    flex: 1,
                    itemCount: bannerList[0]['banners'].length,
                    itemBuilder: (context, index) {
                      MyBanner banner =
                          MyBanner.fromMap(bannerList[0]['banners'][index]);

                      return BannerItem(banner: banner);
                    },
                  ),
                ),
              ),
              MyList.body(
                flex: 1,
                itemCount: productList.length,
                itemBuilder: (context, index) {
                  Product product = Product.fromMap(productList[index]);

                  return ProductItem(product: product);
                },
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const MyBottomNav(),
    );
  }
}
