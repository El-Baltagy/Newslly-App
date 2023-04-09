
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsly_app/screens/cubit/cubit.dart';
import 'package:newsly_app/screens/cubit/states.dart';
import 'package:newsly_app/shared/manager/color.dart';

import '../../../modules/lang/lang.dart';


class SettingItem extends StatelessWidget {
  final IconData? leadingIcon;
  final Color? leadingIconColor;
  final String title;
  final Widget suffix;
  final GestureTapCallback? onTap;
  const SettingItem(
      {Key? key,
        required this.title,
        required this.suffix,
        this.onTap,
        this.leadingIcon,
        this.leadingIconColor })
      : super(key: key);

  @override
  Widget build(BuildContext context) {


    return Column(
      children: [
        InkWell(
          onTap: onTap,
          child: Container(
            padding: const EdgeInsets.only(left: 15, right: 15),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(15), bottomRight: Radius.circular(15)),
              color: primaryColor,
              boxShadow: [
                BoxShadow(
                  color: Theme.of(context).shadowColor.withOpacity(0.2),
                  spreadRadius: 1,
                  blurRadius: 1,
                  offset:  Offset(0, 1), // changes position of shadow
                ),
              ],
            ),
            child: Container(
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children:
                    [
                  Container(
                    padding: const EdgeInsets.all(7),
                    decoration: BoxDecoration(
                      color: Theme.of(context).scaffoldBackgroundColor.withOpacity(0.7),
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Theme.of(context).shadowColor.withOpacity(0.2),
                          spreadRadius: 1,
                          blurRadius: 1,
                          offset:  Offset(0, 1), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Icon(
                      leadingIcon,
                      size: 24,
                      color: primaryColor,
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: Text(
                      title,
                      style:  TextStyle(fontSize: 16,
                          color:Theme.of(context).scaffoldBackgroundColor ),
                    ),
                  ), suffix
                ]
              ),
            ),
          ),
        ),
        SizedBox(height: 15),
      ],
    );
  }
}

class SettingItem2 extends StatefulWidget {
  final IconData? leadingIcon;
  final Color? leadingIconColor;
  final String title;
  // final Widget suffix;
  final GestureTapCallback? onTap;
  const SettingItem2(
      {Key? key,
        required this.title,
        // required this.suffix,
        this.onTap,
        this.leadingIcon,
        this.leadingIconColor })
      : super(key: key);

  @override
  State<SettingItem2> createState() => _SettingItem2State();
}

class _SettingItem2State extends State<SettingItem2> {
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
        return Column(
          children: [
            InkWell(
              onTap: widget.onTap,
              child: Container(
                padding: const EdgeInsets.only(left: 15, right: 15,top: 10, bottom: 10),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(15), bottomRight: Radius.circular(15)),
                  color: primaryColor,
                  boxShadow: [
                    BoxShadow(
                      color: Theme.of(context).shadowColor.withOpacity(0.2),
                      spreadRadius: 1,
                      blurRadius: 1,
                      offset:  Offset(0, 1), // changes position of shadow
                    ),
                  ],
                ),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children:
                    [
                      Container(
                        padding: const EdgeInsets.all(7),
                        decoration: BoxDecoration(
                          color: Theme.of(context).scaffoldBackgroundColor.withOpacity(0.7),
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Theme.of(context).shadowColor.withOpacity(0.2),
                              spreadRadius: 1,
                              blurRadius: 1,
                              offset:  Offset(0, 1), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Icon(
                          widget.leadingIcon,
                          size: 24,
                          color: primaryColor,
                        ),
                      ),
                       SizedBox(
                        width: 20.w,
                      ),
                      Container(
                        width: 230.w,
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton(
                            isExpanded: true,
                            menuMaxHeight: 120.h,
                            iconDisabledColor: Theme.of(context).scaffoldBackgroundColor,
                            dropdownColor:primaryColor,
                            value: currentLocaleApp.languageCode,
                            alignment: AlignmentDirectional.centerEnd,
                            elevation: 0,
                            icon: Icon(Icons.arrow_drop_down,size: 30,
                                color:  Theme.of(context).scaffoldBackgroundColor ),
                            onChanged: (newValue)
                            {
                              cubit.changeAppLanguage(locale: Locale(newValue.toString()),context: context);
                            },
                            // Todo: made translate to language.langName to keep with the current locale
                            items: languageOptions.map((language) => DropdownMenuItem(
                              value: language.langIsoCode,
                              child: Text(language.langName.translate(context: context),style: TextStyle(color:  Theme.of(context).scaffoldBackgroundColor ),),
                            )
                            ).toList(),
                          ),
                        ),
                      )
                    ]
                ),
              ),
            ),
            SizedBox(height: 15),
          ],
        );
      },

    );
  }
}

// class buildDropSearch extends StatelessWidget {
//   const buildDropSearch({
//     super.key,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//
//     return ;
//   }
// }










// class SettingItem extends StatelessWidget {
//   final IconData? leadingIcon;
//   final Color? leadingIconColor;
//   final String title;
//   final GestureTapCallback? onTap;
//   const SettingItem(
//       {Key? key,
//         required this.title,
//         this.onTap,
//         this.leadingIcon,
//         this.leadingIconColor })
//       : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//
//
//     return Column(
//       children: [
//         InkWell(
//           onTap: onTap,
//           child: Container(
//             padding: const EdgeInsets.only(left: 15, right: 15),
//             decoration: BoxDecoration(
//               borderRadius: const BorderRadius.only(
//                   topRight: Radius.circular(15), bottomRight: Radius.circular(15)),
//               color: Colors.red,
//               boxShadow: [
//                 BoxShadow(
//                   color: Theme.of(context).shadowColor.withOpacity(0.2),
//                   spreadRadius: 1,
//                   blurRadius: 1,
//                   offset:  Offset(0, 1), // changes position of shadow
//                 ),
//               ],
//             ),
//             child: Container(
//               padding: const EdgeInsets.only(top: 10, bottom: 10),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: leadingIcon != null
//                     ? [
//                   Container(
//                     padding: const EdgeInsets.all(7),
//                     decoration: BoxDecoration(
//                       color: Colors.purple,
//                       shape: BoxShape.circle,
//                       boxShadow: [
//                         BoxShadow(
//                           color: Theme.of(context).shadowColor.withOpacity(0.2),
//                           spreadRadius: 1,
//                           blurRadius: 1,
//                           offset:  Offset(0, 1), // changes position of shadow
//                         ),
//                       ],
//                     ),
//                     child: Icon(
//                       leadingIcon,
//                       size: 24,
//                       color: Colors.blue,
//                     ),
//                   ),
//                   const SizedBox(
//                     width: 20,
//                   ),
//                   Expanded(
//                     child: Text(
//                       title,
//                       style: const TextStyle(fontSize: 16),
//                     ),
//                   ),
//                   Icon(
//                     Icons.arrow_forward_ios,
//                     color: Colors.purple,
//                     size: 14,
//                   )
//                 ]
//                     : [
//                   Expanded(
//                     child: Text(
//                       title,
//                       style: const TextStyle(fontSize: 16),
//                     ),
//                   ),
//                   Icon(
//                     Icons.arrow_forward_ios,
//                     color: Colors.red,
//                     size: 14,
//                   )
//                 ],
//               ),
//             ),
//           ),
//         ),
//         SizedBox(height: 15),
//       ],
//     );
//   }
// }