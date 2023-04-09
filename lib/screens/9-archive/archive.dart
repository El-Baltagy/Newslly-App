import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jiffy/jiffy.dart';
import 'package:newsly_app/modules/lang/lang.dart';
import 'package:newsly_app/screens/cubit/cubit.dart';
import 'package:newsly_app/screens/cubit/states.dart';
import 'package:newsly_app/shared/manager/theme/app_theme.dart';

import '../../shared/widget/components.dart';


class ArchiveScreen extends StatefulWidget {
  const ArchiveScreen({Key? key}) : super(key: key);

  @override
  State<ArchiveScreen> createState() => _ArchiveScreenState();
}

class _ArchiveScreenState extends State<ArchiveScreen> {
  late final cubit;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    cubit=homeCubit.getInstance(context);
  }
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<homeCubit,homeStates>(
      listener: (context,state){},
      builder: (context,state){
        // store data from database on variable data
        return Scaffold(
            body: Container(
              width: double.infinity,
              height: double.infinity,
              margin: EdgeInsets.all(10.0.h),
              child: cubit.archivedData.isEmpty ?
              emptyDataItem(context: context) :
              ListView.builder(
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) => buildArticleItem(article: cubit.archivedData[index],isArchived: true),
                itemCount: cubit.archivedData.length,),
            )
        );
      },
    );

  }

  Widget emptyDataItem({required BuildContext context}){
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 15.0.h),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children:
        [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children:
              [
                Image.asset('assets/images/Asset 1.png',height: 130.h,width: 150.w,),
                SizedBox(height: 15.h,),
                Center(
                  child: Text("noDataOnArchive".translate(context: context),style: Theme.of(context).textTheme.headlineSmall!.copyWith(fontSize: 18.5.sp,fontWeight: FontWeight.w500,
                      color:Theme.of(context).itemCo )),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }


}

