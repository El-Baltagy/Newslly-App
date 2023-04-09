import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:newsly_app/modules/lang/lang.dart';
import 'package:newsly_app/screens/7-search/search_sc.dart';

import 'package:newsly_app/shared/constants.dart';
import 'package:newsly_app/shared/manager/theme/app_theme.dart';


import '../../modules/cubit/states.dart';
import '../../shared/widget/components.dart';
import '../../shared/manager/color.dart';
import '../../shared/manager/string.dart';
import '../6-setting/setting.dart';
import '../cubit/cubit.dart';
import '../cubit/states.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final cubit;
  TextEditingController searchController = TextEditingController();

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

      },
      builder: (context, state) {
        final h=MediaQuery.of(context).size.height;
        final w=MediaQuery.of(context).size.width;

        return Scaffold(

          appBar: PreferredSize( preferredSize: Size(double.infinity, h*0.06),
              child: AppBar(
                elevation: 0,
                leadingWidth: 200,
                backgroundColor: Colors.transparent,
                leading: Padding(
                  padding: const EdgeInsets.only(top: 8.0,left: 12,right: 14),
                  child: Text(
                      'Newssly App'.translate(context: context),
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(fontSize: 22,color: primaryColor)),
                ) ,
                actions: [
                  Padding(
                    padding: const EdgeInsets.only(right: 20,left: 15),
                    child:
                    IconButton(
                        onPressed: (){

                      GoPage().navDelete(context, Search());
                    }, icon: const Icon(Icons.search,color: primaryColor,)),
                  ),
                ],
              )
          ),
         
          body:
          NestedScrollView(
              scrollDirection: Axis.vertical,
              floatHeaderSlivers: true,
              headerSliverBuilder: (context, innerBoxIsScrolled) => [
                SliverAppBar(
                  bottom: PreferredSize( preferredSize: Size(double.infinity, h*0.02*0.4),
                    child:  Column(
                      children: [
                        const SizedBox(
                          height: 5,
                        ),
                        // myDivider(),
                        DefaultTabController(
                            length:tabs.length,

                            initialIndex: 0,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                TabBar(
                                  indicatorColor: Colors.purple,
                                  labelColor:primaryColor ,
                                  indicatorWeight: 2,
                                  unselectedLabelColor: Theme.of(context).itemCo,
                                  physics: const BouncingScrollPhysics(),
                                  isScrollable: true,
                                  tabs:cubit.myTabs(context),
                                  onTap: (index){
                                    cubit.changeBar(index);
                                  },
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                              ],
                            )),
                      ],
                    ),
                  ),
                ),
              ],
              body:LiquidPullToRefresh(
                onRefresh:cubit.handleRefresh,
                color: primaryColor,
                height:70 ,
                backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                showChildOpacityTransition: false,
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: cubit.screens[cubit.i],
                      ),
                    ],
                  ),
                ),
              ) ),
        
        );

      },

    );
  }


}
