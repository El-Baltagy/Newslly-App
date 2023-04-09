import 'dart:async';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:newsly_app/shared/manager/color.dart';
import 'package:newsly_app/shared/widget/components.dart';

import '../../shared/network/cash_helper.dart';
import '../2-on_boarding/on_boarding.dart';
import '../3-layout/layout.dart';


class SplashSc extends StatefulWidget {
  const SplashSc({Key? key}) : super(key: key);

  @override
  State<SplashSc> createState() => _SplashScState();
}

class _SplashScState extends State<SplashSc> {
  Timer? _timer;

  _startDelay() {
    _timer = Timer(const Duration(seconds: 3,milliseconds: 500), _goNext);
  }
  _goNext() {
    bool? _onBoarding=CashHelper.getBoolean(key:'onBoarding');
    if (_onBoarding==null) {
      GoPage().navDelete(context, OnBoardingSC());
    }  else{
      GoPage().navDelete(context, LayOut());
    }

  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _startDelay();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  Theme.of(context).scaffoldBackgroundColor,
      body:  Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            height: 180,
            child:Lottie.asset('assets/images/8rp5eBhdPp.json',height: 130.h,width: 150.w,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            height: 60,
          ),
          Row(
            children:  [
              const SizedBox(
                width: 70,
              ),
             DefaultTextStyle(
               style:  const TextStyle(
               fontSize: 40.0,
               fontWeight: FontWeight.w900,
                 color:primaryColor,
             ),
      child: AnimatedTextKit(
        animatedTexts: [
          // TypewriterAnimatedText('Newssly '),
          TypewriterAnimatedText('Newssly App',
          speed: Duration(milliseconds: 300),),

        ],

      ),
    )
              // Text('Newssly App',
              //   style: TextStyle(
              //     fontSize: 40,fontWeight: FontWeight.w900,
              //     color:primaryColor,
              //   ),)
            ],
          )
          ,
        ],
      ),
    );
  }
  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}