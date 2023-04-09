import 'package:flutter/material.dart';

import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../shared/manager/color.dart';
import '../../shared/network/cash_helper.dart';

class BoardingMoadel {
  final String image;
  final String title;
  final String body;

  BoardingMoadel({required this.image,required this.title,required this.body});
}

class OnBoardingSC extends StatefulWidget {
  @override
  State<OnBoardingSC> createState() => _OnBoardingSCState();
}

class _OnBoardingSCState extends State<OnBoardingSC> {
  bool isLast=false;
  bool isfirst=false;
  var boardController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          actions: [
            TextButton(
                onPressed: (){
                  pushReplacementNamed('/LayOut');
                },
                child: const Text('SKIP',style: TextStyle(color: primaryColor),)
            )
          ],
        ),
        body:Column(
          children: [
            const Padding(padding: EdgeInsets.all(30)),
            Expanded(
              child: PageView.builder(
                controller: boardController,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) =>BoardingItem(list[index]) ,
                itemCount: list.length,
                onPageChanged: ( int value) {
                  setState(() {
                    if (value==list.length-1){
                      isLast=true;
                    }
                    else{isLast=false;}
                    if (value==0){
                      isfirst=true;}
                    else{isfirst=false;}
                  });

                },
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      child:  Text(!isfirst?'PREVIOUS':'',style: TextStyle(color: primaryColor),),
                      onPressed: (){
                        if (isfirst!=true) {
                          boardController.previousPage(duration: const Duration(milliseconds: 700),
                              curve: Curves.fastLinearToSlowEaseIn);
                        }
                      },
                    ),
                    SmoothPageIndicator(
                      controller: boardController,
                      effect: const ExpandingDotsEffect(
                        dotColor: Colors.grey,
                        activeDotColor: primaryColor,
                        dotHeight: 10,
                        expansionFactor: 4,
                        dotWidth: 10,
                        spacing: 5.0,
                      ),
                      count: list.length,
                    ),
                    TextButton(
                      child:  Text(
                        !isLast?'NEXT':'SKIP',style: TextStyle(color: primaryColor),),
                      onPressed: (){
                        if(isLast){
                          submit();
                        }else {
                          boardController.nextPage(duration: const Duration(milliseconds: 700),
                              curve: Curves.fastLinearToSlowEaseIn);
                        }
                      },
                    ),
                  ]),
            ),
          ],
        )
    );
  }

  Future<Object?> pushReplacementNamed( String routeName) => Navigator.of(context).
  pushReplacementNamed(routeName);

  List<BoardingMoadel> list=[
    BoardingMoadel(
      image: 'assets/images/19385.jpg',
      title: 'Welcome To Newssly App',
      body: 'All You need to Know Hotest News With Our App ' ,
    ),
    BoardingMoadel(
      image: 'assets/images/00.png',
      title: 'Discover Amazing News',
      body: 'Discover and Search news for more than 50 countries' ,
    ),
    BoardingMoadel(
      image: 'assets/images/25431.jpg',
      title: 'Enjoy The moment',
      body: '' ,
    ),
  ];

  void submit() {
    CashHelper.saveData(
      key: 'onBoarding',
      value: true,
    ).then((value)
    {
      if (value) {
        pushReplacementNamed('/LayOut');
      }
    });
  }

  Widget BoardingItem(BoardingMoadel moadel)=> Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Expanded(
        child: Image(
          image: AssetImage(moadel.image),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(10.0),
        child: Text(moadel.title,
          style: const TextStyle(
              fontWeight: FontWeight.bold,fontSize: 24,color: primaryColor
          ),
        ),
      ),
      const SizedBox(
        height: 15,
      ),
      Padding(
        padding: const EdgeInsets.all(10.0),
        child: Text(moadel.body,
          style: const TextStyle(
              fontWeight: FontWeight.bold,fontSize: 14,color: Colors.grey
          ),
        ),
      ),
      const SizedBox(
        height: 15,
      ),
    ],
  );
}
