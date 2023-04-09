import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsly_app/modules/lang/lang.dart';
import 'package:newsly_app/screens/6-setting/widget/setting_widget.dart';
import 'package:newsly_app/screens/cubit/cubit.dart';
import 'package:newsly_app/shared/manager/theme/app_theme.dart';

import '../../shared/manager/color.dart';
import '../../shared/manager/theme/cubit/theme_cubit.dart';
import '../../shared/manager/theme/cubit/theme_state.dart';
import '../../shared/network/cash_helper.dart';
import '../../shared/widget/components.dart';
import '../../shared/manager/language/lang.dart';
import '../../shared/manager/string.dart';
import '../cubit/states.dart';

class Setting extends StatefulWidget {
  Setting();

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  var formkey = GlobalKey<FormState>();
  late final cubit;
  late final themeCubit;
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    cubit=homeCubit.getInstance(context);
    themeCubit=ThemeCubit.get(context);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(elevation: 0,),
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 20),
        child:
        // SingleChildScrollView(
        //   child: Column(
        //     // alignment: AlignmentDirectional.center,
        //     children: [
        //       // Column(
        //       //   children: [
        //       //     Container(height: 200,),
        //       //     SizedBox(
        //       //       height: 30,
        //       //     ),
        //       //     SettingItem(
        //       //       title: 'wasd',leadingIcon: Icons.icecream_outlined,
        //       //     ),
        //       //     SizedBox(
        //       //       height: 30,
        //       //     ),
        //       //
        //       //
        //       //   ],
        //       // ),
        //       Column(
        //         children: [
        //           Container(height: 200,),
        //           SizedBox(
        //             height: 30,
        //           ),
        //
        //   Container(
        //     padding: const EdgeInsets.only(left: 15, right: 15),
        //     decoration: BoxDecoration(
        //       borderRadius: const BorderRadius.only(
        //           topRight: Radius.circular(15), bottomRight: Radius.circular(15)),
        //       color: Colors.red,
        //       boxShadow: [
        //         BoxShadow(
        //           color: Theme.of(context).shadowColor.withOpacity(0.2),
        //           spreadRadius: 1,
        //           blurRadius: 1,
        //           offset:  Offset(0, 1), // changes position of shadow
        //         ),
        //       ],
        //     ),
        //     child: Stack(
        //       children: [
        //         Positioned(
        //           top:14,
        //           child: Container(
        //             padding: const EdgeInsets.all(7),
        //             decoration: BoxDecoration(
        //               color: Colors.purple,
        //               shape: BoxShape.circle,
        //               boxShadow: [
        //                 BoxShadow(
        //                   color: Theme.of(context).shadowColor.withOpacity(0.2),
        //                   spreadRadius: 1,
        //                   blurRadius: 1,
        //                   offset:  Offset(0, 1), // changes position of shadow
        //                 ),
        //               ],
        //             ),
        //             child: Icon(
        //               Icons.cabin,
        //               size: 24,
        //               color: Colors.blue,
        //             ),
        //           ),
        //         ),
        //         Container(
        //             margin:EdgeInsets.only(left: 70),
        //             child:
        //             DropdownSearch<String>(
        //               popupProps: PopupProps.menu(
        //                 showSelectedItems: true,
        //                 // disabledItemFn: (String s) => s.startsWith('I'),
        //               ),
        //               validator: (String? value) {
        //                 if (value!.isEmpty) {
        //                   return 'Country should be choosed';
        //                 }
        //                 return null;
        //               },
        //               items: country,
        //               dropdownDecoratorProps:  DropDownDecoratorProps(
        //                 dropdownSearchDecoration: InputDecoration(
        //                   border: InputBorder.none,
        //                   labelText: "Country:${cubit.selectedItem}",
        //                   // hintText: "country",
        //                 ),
        //               ),
        //               onChanged: (e) {
        //                 print(e.toString());
        //                 cubit.changeListTile(e.toString());
        //                 cubit.changeCountry();
        //
        //               },
        //               selectedItem: cubit.selectedItem,
        //             )),
        //       ],
        //     ),
        //   ),
        //
        //           SizedBox(
        //             height: 30,
        //           ),
        //         ],
        //       ),
        //     ],
        //   ),
        // )
        Column(
          children: [
            // PopupMenuButton(
            //   itemBuilder: (context){
            //     return menu.map((item) {
            //       return PopupMenuItem(
            //         value: item,
            //         child: Text(item,style: TextStyle(color: Colors.black)),
            //       );
            //     }).toList();},
            //   onSelected: (selectedItem){
            //     if(selectedItem == 'country'.translate(context: context)) {
            //       showMenu(
            //         context: context,
            //         position: currentLocaleApp.languageCode == "en" || currentLocaleApp.languageCode == "fr" ? const RelativeRect.fromLTRB(25.0, 25.0, 0.0, 0.0) : const RelativeRect.fromLTRB(0.0, 0.0, 25.0, 25.0),
            //         items: [
            //           PopupMenuItem<String>(
            //               value: '1',
            //               child: Text('egypt'.translate(context: context),style: TextStyle(color: Colors.black),)),
            //           PopupMenuItem<String>(
            //               value: '2',
            //               child: Text('united_states'.translate(context: context),style: TextStyle(color: Colors.black))),
            //           // PopupMenuItem<String>(
            //           //     value: '3',
            //           //     child: Text('germany'.translate(context: context),style: TextStyle(color: Colors.black))),
            //           // PopupMenuItem<String>(
            //           //     value: '4',
            //           //     child: Text('france'.translate(context: context),style: TextStyle(color: Colors.black))),
            //         ],
            //         elevation: 0,
            //       ).then((value) {
            //         if(value == '1')
            //         {
            //           arabicDirection = TextDirection.rtl;
            //           cubit.selectCountry('eg');
            //
            //
            //         } else if(value == '2')
            //         {
            //           arabicDirection = TextDirection.ltr;
            //           cubit.selectCountry('us');
            //
            //         }
            //         // else if(value == '3')
            //         // {
            //         //   cubit.selectCountry('de');
            //         //   arabicDirection = TextDirection.ltr;
            //         //
            //         //   cubit.getall();
            //         // }
            //         // else if(value == '4')
            //         // {
            //         //   cubit.selectCountry('fr');
            //         //   arabicDirection = TextDirection.ltr;
            //         //
            //         //   cubit.getall();
            //         // }
            //       });
            //     }
            //     // else if(selectedItem == 'category'.translate(context: context))
            //     // {
            //     //   showMenu(
            //     //     context: context,
            //     //     position: currentLocaleApp.languageCode == "en" || currentLocaleApp.languageCode == "fr" ? const RelativeRect.fromLTRB(25.0, 25.0, 0.0, 0.0) : const RelativeRect.fromLTRB(0.0, 0.0, 25.0, 25.0),
            //     //     items: [
            //     //       PopupMenuItem<String>(
            //     //           value: '1',
            //     //           child: Text('general'.translate(context: context),style: TextStyle(color: Colors.black))),
            //     //       PopupMenuItem<String>(
            //     //           value: '2',
            //     //           child: Text('sports'.translate(context: context),style: TextStyle(color: Colors.black))),
            //     //       PopupMenuItem<String>(
            //     //           value: '3',
            //     //           child: Text('science'.translate(context: context),style: TextStyle(color: Colors.black))),
            //     //       PopupMenuItem<String>(
            //     //           value: '4',
            //     //           child: Text('health'.translate(context: context),style: TextStyle(color: Colors.black))),
            //     //     ],
            //     //     elevation: 0,
            //     //   ).then((value) {
            //     //     if(value == '1')
            //     //     {
            //     //       cubit.selectCategory('general');
            //     //       cubit.getall(country: cubit.country, category: 'general');
            //     //     } else if(value == '2')
            //     //     {
            //     //       cubit.selectCategory('sports');
            //     //       cubit.getall(country: cubit.country, category: 'sports');
            //     //     } else if(value == '3')
            //     //     {
            //     //       cubit.selectCategory('science');
            //     //       cubit.getall(country: cubit.country, category: 'science');
            //     //     }
            //     //     else if(value == '4')
            //     //     {
            //     //       cubit.selectCategory('health');
            //     //       cubit.getall(country: cubit.country, category: 'health');
            //     //     }
            //     //   });
            //     // }
            //   },
            // ),
            SizedBox(height: 150.h,),
            BlocBuilder<ThemeCubit,ThemeState>(
              builder: (context, state) => SettingItem(
                title:Theme.of(context).textTh
                    .translate(context: context),
                leadingIcon:Theme.of(context).iconTh,
                suffix: Switch(
                  value: themeCubit.isDarkTheme,
                  activeColor: Colors.black,
                  inactiveTrackColor: Colors.grey,
                  onChanged: (newValue) {
                    themeCubit.updateTheme(context);
                  },
                ),
              ),
            ),
            BlocBuilder< homeCubit,homeStates>(
              builder: (context, state) =>SettingItem(
                title: '${CashHelper.getData(key: 'co')??'Egypt'}',leadingIcon: Icons.sign_language_outlined,
                suffix:PopupMenuButton(
                    itemBuilder: (context){
                      return country.map((item) {
                        return PopupMenuItem(
                          value: item,
                          child: Text(item,style: TextStyle(color: Colors.black)),
                        );
                      }).toList();},
                    color: primaryColor,
                    icon: Icon(Icons.arrow_drop_down,
                        color:Theme.of(context).scaffoldBackgroundColor,size: 30),
                    onSelected: (selectedItem) {
                      print(selectedItem.toString());
                      CashHelper.saveData(key: 'co', value: selectedItem.toString());
                      cubit.selectCountry(selectedItem.toString(),context);

                    } ) ,
              ) ,

            ),
            SettingItem2(
              title: 'Language',leadingIcon: Icons.language,
            ),

          ],
        ),

      ),
    );
  }
}

// Container(
//   height: 58,
//   width: 150,
//   color:  Colors.grey.withOpacity(0.5) ,
//   padding: EdgeInsets.symmetric(horizontal: 10),
//   child: DropdownButton(
//     isExpanded: true,
//     menuMaxHeight: 120,
//     value: currentLocaleApp.languageCode,
//     alignment: AlignmentDirectional.centerEnd,
//     dropdownColor: Colors.grey ,
//     elevation: 0,
//     icon: Icon(Icons.arrow_drop_down,color: Colors.white ,size: 30,),
//     onChanged: (newValue)
//     {
//       cubit.changeAppLanguage(locale: Locale(newValue.toString()),context: context);
//     },
//     // Todo: made translate to language.langName to keep with the current locale
//     items: languageOptions.map((language) => DropdownMenuItem(
//       value: language.langIsoCode,
//       child: Text(language.langName.translate(context: context),style: TextStyle(color:  Colors.white ),),
//     )
//     ).toList(),
//   ),
// ),













// ExpansionTile(
//   title:  Text('Country:${ value[cubit.k].toUpperCase()} '),
//   children: <Widget>[
//     for (int i = 0; i < country.length; i++)
//       DropDownList(
//         call: () async{
//           cubit.changeListTile(i);
//          await cubit.changeCountry();
//           // Navigator.of(context).push(MaterialPageRoute(builder: (context) => Setting(),));
//           // cubit.getall();
//         },
//         name: country[i].toUpperCase(),
//       ),
//
//   ],
// ),