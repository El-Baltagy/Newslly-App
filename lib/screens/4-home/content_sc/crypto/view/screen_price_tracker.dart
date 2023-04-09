import 'package:flutter/material.dart';
import 'package:newsly_app/screens/4-home/content_sc/crypto/view/widget/dropdrown.dart';
import 'package:newsly_app/screens/4-home/content_sc/crypto/view/widget/market_price.dart';
import '../models/model_active_symbol.dart';

class ScreenTradingPrices extends StatelessWidget {
  const ScreenTradingPrices({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 15),
        child: Column(
          children:  const [

            SizedBox(height: 20,),

            ///Market places
            DropDown<String>(),

            SizedBox(height: 20,),

            ///Active symbols according to market
            DropDown<ActiveSymbols>(),

            SizedBox(height: 55,),

            /// Live Price of symbols
            MarketPriceText()
          ],
        ),
      ),
    );
  }
}

