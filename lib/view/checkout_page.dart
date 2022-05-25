import 'package:devnology_test/config/theme.dart';
import 'package:devnology_test/widgets/appbar.dart';
import 'package:devnology_test/widgets/my_btn.dart';
import 'package:flutter/material.dart';

class CheckoutPage extends StatefulWidget {
  const CheckoutPage({Key? key}) : super(key: key);

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(
        context,
        centerTitle: true,
      ),
      backgroundColor: AppTheme.bgLight,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundColor: AppTheme.primaryColor,
                  child: Icon(
                    Icons.check,
                    color: AppTheme.secondaryColor,
                    size: 50,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 30, bottom: 23),
                  child: Text(
                    "Order Placed!",
                    style: AppTheme.textStyleH1,
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * .15,
                  ),
                  child: Text(
                    "Your order was placed successfully. For more details, check All My Orders page under Profile tab",
                    textAlign: TextAlign.center,
                    style: AppTheme.textStyleParagraph(),
                  ),
                ),
              ],
            ),
            MyBtn.roundedBtnWithIcon(
              label: "My orders",
              iconData: Icons.arrow_forward_ios_outlined,
              backgroundColor: AppTheme.primaryColor,
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
