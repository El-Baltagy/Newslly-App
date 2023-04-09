import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:lottie/lottie.dart';
import 'package:newsly_app/modules/lang/lang.dart';
import 'package:newsly_app/shared/constants.dart';
import 'package:newsly_app/shared/manager/theme/app_theme.dart';


import '../../modules/cubit/states.dart';
import '../../shared/widget/components.dart';
import '../../shared/manager/string.dart';
import '../7-search/search_sc.dart';
import '../cubit/cubit.dart';
import '../cubit/states.dart';


class LayOut extends StatefulWidget {
  const LayOut({Key? key}) : super(key: key);

  @override
  State<LayOut> createState() => _LayOutState();
}

class _LayOutState extends State<LayOut> {
  late final cubit;

  @override
  void initState() {
    // TODO: implement initState
    cubit=homeCubit.getInstance(context);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    return BlocConsumer<homeCubit,homeStates>(
      listener: (context, state) {
        if (state is checkConnectivityTrue) {
          homeCubit.getInstance(context).getall();
        }
      },
      builder: (context, state) {
        final h=MediaQuery.of(context).size.height;
        final w=MediaQuery.of(context).size.width;

        return Scaffold(

          body:!cubit.connected ?
          networkCheck(h: h, w: w, function: () {
            cubit.checkConnection();
          },)

         : cubit.pages[cubit.currentIndex] ,
          bottomNavigationBar: cubit.connected?Container(
            width: double.infinity,
            height:h*0.06 ,
            child: GNav(
              // tab button icon size
              // tabBackgroundColor: Colors.purple.withOpacity(0.1), // selected tab background color
              // tabMargin:EdgeInsets.symmetric(horizontal: 10) ,
              // rippleColor: Colors.red, // tab button ripple color when pressed
              // hoverColor: Colors.yellow, // tab button hover color
              // tab button border
              // tabBorder: Border.all(color: Colors.black, width: 1), // tab button border
              // tabShadow: [BoxShadow(color: Colors.grey.withOpacity(0.5), blurRadius: 8)], // tab button shadow
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                haptic: true, // haptic feedback
                tabBorderRadius: 15,
                tabActiveBorder: Border.all(color: Colors.purple, width: 2),
                curve: Curves.easeOutExpo, // tab animation curves
                duration: const Duration(milliseconds: 500), // tab animation duration
                gap: 20, // the tab button gap between icon and text
                color: Theme.of(context).itemCo, // unselected icon color
                activeColor: Colors.purple, // selected icon and text color
                iconSize: 24,
                padding:  EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                hoverColor: Colors.transparent, // navigation bar padding
                selectedIndex:cubit.currentIndex ,
                onTabChange:(index){
                  cubit.changeBottom(index);
                  },
                tabs: buildList(context)
                // [
                //   NewWidget(),
                //   GButton(icon: Icons.stream,text: 'Home'.translate(context: context),),
                //   GButton(icon: Icons.settings,text: 'Home'.translate(context: context),),
                // ]
            ),
          ):
          null
          ,
        );
      },
    );
  }

  List<GButton> buildList(context) {
    return List<GButton>.generate(
        NavBarUtils.names.length,
            (index) => GButton(icon:NavBarUtils.icons[index] ,text:NavBarUtils.names[index].translate(context: context),)
    );
  }
}

// class NewWidget extends StatelessWidget {
//   const NewWidget({
//     super.key,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return GButton(icon: Icons.home,text: 'Home'.translate(context: context),);
//   }
// }


