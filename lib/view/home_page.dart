import 'package:devnology_test/config/theme.dart';
import 'package:devnology_test/main.dart';
import 'package:devnology_test/model/banner.dart';
import 'package:devnology_test/model/cart.dart';
import 'package:devnology_test/model/category.dart';
import 'package:devnology_test/model/product.dart';
import 'package:devnology_test/widgets/appbar.dart';
import 'package:devnology_test/widgets/banner_item.dart';
import 'package:devnology_test/widgets/bottom_navigator.dart';
import 'package:devnology_test/widgets/category_item.dart';
import 'package:devnology_test/widgets/list_wdgt.dart';
import 'package:devnology_test/widgets/my_dialog.dart';
import 'package:devnology_test/widgets/my_progress_indicator.dart';
import 'package:devnology_test/widgets/product_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  MyBanner myBanner = MyBanner();
  Category category = Category();
  Product product = Product();
  MyCart myCart = MyCart();

  fetchData() {
    setState(() => loading = true);

    Future.wait([
      myBanner.getBanners(),
      category.getCategories(),
      product.getProducts(),
      myCart.getCarts(),
    ]).whenComplete(() => setState(() => loading = false));
  }

  bool loading = false;

  @override
  void initState() {
    super.initState();

    //Comparare datetime if should fetch new data
    if (lastFetchHomeData == null) {
      lastFetchHomeData = DateTime.now();
    } else {
      newFetchHomeData = DateTime.now();

      Duration diff = newFetchHomeData!.difference(lastFetchHomeData!);

      if (diff.inSeconds > 10) {
        lastFetchHomeData = DateTime.now();
        fetchData();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => MyDialog.showExitToApp(),
      child: Scaffold(
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
        body: loading
            ? customProgress()
            : SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: SizedBox(
                  height: 600,
                  child: Column(
                    children: [
                      if (categoryList.isNotEmpty)
                        MyList.horizontal(
                          height: 160,
                          flex: 1,
                          label: "Categories",
                          itemCount: categoryList.length,
                          itemBuilder: (context, index) {
                            Category category =
                                Category.fromMap(categoryList[index]);

                            if (index == categoryList.length - 1) {
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
                      if (bannerList.isNotEmpty)
                        MyList.horizontal(
                          height: 250,
                          label: "Lastest",
                          flex: 1,
                          itemCount: bannerList.length,
                          itemBuilder: (context, index) {
                            MyBanner banner =
                                MyBanner.fromMap(bannerList[index]);

                            return BannerItem(banner: banner);
                          },
                        ),
                      if (productList.isNotEmpty)
                        MyList.horizontal(
                          height: 190,
                          flex: 1,
                          itemCount: productList.length,
                          itemBuilder: (context, index) {
                            Product product =
                                Product.fromMap(productList[index]);

                            return ProductItem(product: product);
                          },
                        ),
                    ],
                  ),
                ),
              ),
        bottomNavigationBar: MyBottomNav(),
      ),
    );
  }
}
