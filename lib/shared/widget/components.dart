import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:jiffy/jiffy.dart';
import 'package:lottie/lottie.dart';
import 'package:newsly_app/modules/lang/lang.dart';
import 'package:newsly_app/screens/cubit/cubit.dart';
import 'package:newsly_app/screens/cubit/states.dart';
import 'package:newsly_app/shared/manager/theme/app_theme.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shimmer/shimmer.dart';
import '../../screens/8-web_view/web_view.dart';
import '../manager/color.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import '../network/cash_helper.dart';



showSnackBar(
    BuildContext context, String text,{
      int sec=1,
      Color colorText=Colors.white,
      Color backgroundColor=Colors.red
}) {
  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content:
      Text(text.translate(context: context),
        style: TextStyle(color: colorText,fontSize: 17.sp),),
      duration: Duration(seconds: sec),
      backgroundColor: backgroundColor,
    ),
  );
}

// //widgets

// class CustomButton extends StatelessWidget {
//   final String text;
//   final VoidCallback onPressed;
//   const CustomButton({
//     Key? key,
//     required this.text,
//     required this.onPressed,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(18.0),
//       child: ElevatedButton(
//         onPressed: onPressed,
//         child: Text(
//           text,
//           style: const TextStyle(
//             fontSize: 17,color: Colors.white
//           ),
//         ),
//         style: ElevatedButton.styleFrom(
//           backgroundColor: primaryColor,
//           minimumSize: const Size(
//             double.infinity,
//             50,
//           ),
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(30),
//             side: const BorderSide(color: primaryColor),
//           ),
//         ),
//       ),
//     );
//   }
// }

// class HomeMeetingButton extends StatelessWidget {
//   final VoidCallback onPressed;
//   final IconData icon;
//   final String text;
//   const HomeMeetingButton({
//     Key? key,
//     required this.onPressed,
//     required this.icon,
//     required this.text,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: onPressed,
//       child: Column(
//         children: [
//           Container(
//             decoration: BoxDecoration(
//               color: buttonColor,
//               borderRadius: BorderRadius.circular(16),
//               boxShadow: [
//                 BoxShadow(
//                   blurRadius: 10,
//                   color: Colors.black.withOpacity(0.06),
//                   offset: Offset(0, 4),
//                 ),
//               ],
//             ),
//             width: 60,
//             height: 60,
//             child: Icon(
//               icon,
//               color: Colors.white,
//               size: 30,
//             ),
//           ),
//           const SizedBox(height: 10),
//           Text(
//             text,
//             style: const TextStyle(
//               color: Colors.grey,
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
//
// class MeetingOption extends StatelessWidget {
//   final String text;
//   final bool isMute;
//   final Function(bool) onChange;
//   const MeetingOption({
//     Key? key,
//     required this.text,
//     required this.isMute,
//     required this.onChange,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 60,
//       color: secondaryBackgroundColor,
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Text(
//               text,
//               style: const TextStyle(fontSize: 16),
//             ),
//           ),
//           Switch.adaptive(
//             value: isMute,
//             onChanged: onChange,
//           ),
//         ],
//       ),
//     );
//   }
// }

// classes

class buildArticleItem extends StatefulWidget {
  buildArticleItem({required this.article,required this.isArchived});
final dynamic article;
  final bool isArchived;


  @override
  State<buildArticleItem> createState() => _buildArticleItemState();
}
class _buildArticleItemState extends State<buildArticleItem> {
  bool isSaved=CashHelper.getBoolean(key: 'isSaved')??false;
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
      listener: (context, state) {},
      builder: (context, state) {
        return Slidable(
          endActionPane: ActionPane(
            motion: const StretchMotion(),
            children: [
              if (!widget.isArchived)SlidableAction(
                onPressed:  (context){
                  if (!isSaved) {
                    CashHelper.saveData(key: 'isSaved', value: true);
                    cubit.InsertTODatabase(title: widget.article['title'],
                        urlToImage: widget.article['urlToImage'],
                        publishedAt: widget.article['publishedAt'],
                        url:widget.article['url']).then((value){
                      showSnackBar(
                        context,"Item added to Archive successfully".translate(context: context),
                        backgroundColor: Colors.green
                      );
                    });
                  }else{
                    CashHelper.saveData(key: 'isSaved', value: false);
                    cubit.DeleteDatebase(id:cubit.archivedData[0]['id']);
                    showSnackBar(
                      context,"item Deleted Succeffully".translate(context: context),
                    );
                  }
                  setState(() {
                    isSaved=!isSaved;
                  });
                },
                autoClose: true,
                icon: isSaved?Icons.check_box:Icons.archive_outlined,
                backgroundColor: isSaved?Colors.green:Colors.red,
                borderRadius: BorderRadius.circular(12),
              ),
                if (widget.isArchived) SlidableAction(
                onPressed: (context){
                  CashHelper.saveData(key: 'isSaved', value: false);
                 cubit.DeleteDatebase(id:cubit.archivedData[0]['id']);
                 showSnackBar(
                   context,"item Deleted Succeffully".translate(context: context),
                 );
                },
                autoClose: true,
                icon: Icons.delete,
                backgroundColor: Colors.red,
                borderRadius: BorderRadius.circular(12),
              ),
            ],
          ),
          child: InkWell(
            onTap: (){
              GoPage().pushNavigation(context, path:Web(widget.article['url']));
              // navigateTo(context,Web(article['url']),);
            },
            child: Card(
              elevation: 8,
              color: Theme.of(context).cardCo,
              child:   Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children:
                  [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: CachedNetworkImage(
                        imageUrl: '${widget.article['urlToImage']}',
                        placeholder: (context, url) => Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: SizedBox(
                            height: 25.0,
                            width: 25.0,
                            child: CircularProgressIndicator(
                              valueColor:
                              new AlwaysStoppedAnimation<Color>(primaryColor),
                              strokeWidth: 2,
                            ),
                          ),
                        ),
                        errorWidget: (context, url, error) => Image.asset(
                            'assets/images/Asset 2.png'),
                        width: 120.0,
                        height: 120.0,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(
                      width: 20.0,
                    ),
                    Expanded(
                      child: Container(
                        height: 120.0,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children:
                          [
                            Expanded(
                              child: Text(
                                '${widget.article['title']}',
                                style: Theme.of(context).textTheme.bodyText1,
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                                // textAlign: TextAlign.start,
                              ),
                            ),

                            Text(
                              Jiffy('${widget.article['publishedAt']}').yMMMEd,
                              style:  TextStyle(
                                color: Colors.grey,

                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    // const SizedBox(
                    //   width: 8.0,
                    // ),
                  ],
                ),

              ),
            ),
          ),
        );
      },

    );
  }
}

class BuildLoadingSkelton extends StatelessWidget {
  const BuildLoadingSkelton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child:  Card(
        elevation: 8,
        child:   Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            children:
            [
              Shimmer.fromColors(
                highlightColor:Theme.of(context).highlightColor ,
                baseColor: Theme.of(context).baseColor,
                child: Container(
                  width: 120.0,
                  height: 120.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0,),
                    color: Theme.of(context).baseColor
                  ),
                ),
              ),
              const SizedBox(
                width: 20.0,
              ),
              Expanded(
                child: Container(
                  height: 120.0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children:
                    [
                      Shimmer.fromColors(
                          highlightColor:Theme.of(context).highlightColor ,
                          baseColor: Theme.of(context).baseColor,
                          child: myDivider(color: Theme.of(context).baseColor,height: 60)),
                      const SizedBox(
                        height: 20.0,
                      ),
                      Shimmer.fromColors(
                          highlightColor:Theme.of(context).highlightColor ,
                          baseColor: Theme.of(context).baseColor,
                          child: myDivider(color: Theme.of(context).baseColor,height: 20))
                    ],
                  ),
                ),
              ),
              // const SizedBox(
              //   width: 8.0,
              // ),
            ],
          ),

        ),
      ),
    );
  }
}


Widget articleBuilder(list, context,isArchived ) => ConditionalBuilder(
  condition: list.length > 0,
  builder: (context) =>
      ListView.builder(
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (context, index) => buildArticleItem(article: list[index],isArchived:isArchived ),
        itemCount: list.length,),
  fallback: (context) =>
      ListView.builder(
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (context, index) => BuildLoadingSkelton(),
        itemCount: 10,)
);

Widget myDivider({
   double height=2.0,
  Color color =Colors.purple
}) => Padding(
  padding: const EdgeInsetsDirectional.only(
    end:30.0,start: 10
  ),
  child: Container(
    width: double.infinity,
    height: height,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(4.0,),
      color: color,
    ),

  ),
);


class networkCheck extends StatelessWidget {
  const networkCheck({
    super.key,
    required this.h,
    required this.w,
    required this.function,
  });

  final double h;
  final double w;
  final VoidCallback function;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: h,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
              child: Lottie.asset(
                "assets/images/Not Done.json",
                width: w * 0.70,
              )),
          ElevatedButton(
              onPressed: function,
              child: const Text("Try again"))
        ],
      ),
    );
  }
}

class DropDownList extends StatelessWidget {
  const DropDownList({super.key, required this.name, required this.call});
  final String name;
  final Function call;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: ListTile(title: Text(name)),
      onTap: () => call(),
    );
  }
}


TextFormField buildTextFormField({
  required String labelTitle,
  Function(String)? onChange,
  String? Function(String?)? validator,
  TextEditingController? controller,
  FocusNode? focusNode,
  bool isPassword=false,
  IconData? suffix,
  IconData? prefix,
  Function(String)? onSubmit,
  Function()? suffixPressed,
  TextInputType Type=TextInputType.emailAddress,
  EdgeInsetsGeometry? padding=const EdgeInsets.symmetric(vertical: 10,horizontal: 20),
  InputBorder? border= const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(10))
  )
}) {
  return TextFormField(
    // textAlign: TextAlign.center,
    onFieldSubmitted: onSubmit,
    validator: validator ,
    obscureText: isPassword,
    keyboardType:Type,
    controller:controller ,
    focusNode: focusNode,
    cursorColor: primaryColor,
    onChanged: onChange,
    decoration: InputDecoration(
        suffixIcon: IconButton(onPressed: suffixPressed, icon: Icon(suffix,color: primaryColor,)),
        prefixIcon: Icon(prefix,color: primaryColor) ,
        labelText: labelTitle,
        contentPadding:  padding,
        border: border,

        labelStyle: TextStyle(
            color: primaryColor
        ),
        enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(
                color: Colors.grey,width: 1
            ),
            borderRadius: BorderRadius.all(Radius.circular(10))
        ),
        focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(
                color: primaryColor,width: 2
            ),
            borderRadius: BorderRadius.all(Radius.circular(10))
        )
    ),
  );
}

class GoPage {
  GoPage();

  void navDelete(
      context,
      widget,
      {bool Rt = false}
      ) =>
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => widget,
        ),
      );

  void navigateAndFinish(
      context,
      widget,
      {bool Rt = false}
      ) =>
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => widget,
        ), (route) =>Rt,
      );
  void pushNavigation(context, {
    required Widget path,
    var curve = Curves.ease,
    double x=0.2,
    double y=0,
  }) {
    Navigator.of(context).
    push(_createRoute(Sc: path,curve:curve,X:x ,Y:y ));
  }
  void popNavigation(context, {
    required Widget path,
    var curve = Curves.ease,
    double x=0.0,
    double y=0.2,
  }) {
    Navigator.of(context).pop(_createRoute(Sc: path,curve:curve,X:x ,Y:y ));
  }
  _createRoute({
    required Widget Sc,
    required var curve,
    required double X,Y,
  }) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => Sc,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = Offset(X,Y);
        const end = Offset.zero;

        var tween = Tween(begin: begin, end: end).chain(
            CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }

  // void getNavigation({required Widget path, Transition transition=Transition.zoom,}){
  //   Get.to((context)=>path,transition:transition,);
  // }
}

