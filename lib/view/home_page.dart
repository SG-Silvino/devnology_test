import 'package:devnology_test/config/theme.dart';
import 'package:devnology_test/model/product.dart';
import 'package:devnology_test/widgets/appbar.dart';
import 'package:devnology_test/widgets/banner_item.dart';
import 'package:devnology_test/widgets/bottom_navigator.dart';
import 'package:devnology_test/widgets/category_item.dart';
import 'package:devnology_test/widgets/product_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Product product = Product();

  @override
  void initState() {
    product.getdata();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff0f0f0),
      appBar: myAppBar(context, actions: [
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
        )
      ]),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 12),
            child: Column(
              children: [
                Container(
                  alignment: AlignmentDirectional.topStart,
                  margin: const EdgeInsets.only(top: 30, left: 25, bottom: 12),
                  child: const Text(
                    "Categories",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                SizedBox(
                  height: 120,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    physics: const BouncingScrollPhysics(),
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      if (index == 2) {
                        return Row(
                          children: [
                            CategoryItem(
                              index: index,
                            ),
                            Container(
                              margin: const EdgeInsets.only(right: 12),
                              child: Column(
                                children: [
                                  CircleAvatar(
                                    backgroundColor: Colors.white,
                                    radius: 40,
                                    child: Icon(
                                      Icons.arrow_forward_ios_outlined,
                                      color: AppTheme.secondaryColor,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  const Text("See All"),
                                ],
                              ),
                            ),
                          ],
                        );
                      } else {
                        return CategoryItem(
                          index: index,
                        );
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
          Column(
            children: [
              Container(
                alignment: AlignmentDirectional.topStart,
                margin: const EdgeInsets.only(left: 25, bottom: 12),
                child: const Text(
                  "Lastest",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              SizedBox(
                height: 180,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return const BannerItem();
                  },
                ),
              ),
            ],
          ),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 25),
              itemCount: 3,
              itemBuilder: (context, index) {
                return const ProductItem();
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: MyBottomNav(),
    );
  }
}
