import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsly_app/modules/lang/lang.dart';
import 'package:newsly_app/screens/cubit/cubit.dart';
import 'package:newsly_app/screens/cubit/states.dart';
import 'package:newsly_app/shared/manager/color.dart';

import '../../shared/widget/components.dart';
import '../3-layout/layout.dart';
import '../4-home/home_screen.dart';

class Search extends StatefulWidget {
   Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  var searchController = TextEditingController();
  late final cubit;
@override
  void initState() {
    // TODO: implement initState
   cubit=homeCubit.getInstance(context);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final h=MediaQuery.of(context).size.height;
    final w=MediaQuery.of(context).size.width;

    return  BlocConsumer<homeCubit,homeStates>(
      listener: (context, state) {

      },
      builder: (context, state) {

        return  Scaffold(
          appBar: PreferredSize( preferredSize: Size(double.infinity, h*0.06),
              child: AppBar(
                elevation: 0,
                leadingWidth: 200,toolbarHeight: h*0.06,
                backgroundColor: Colors.transparent,
                leading: Row(
                  children: [
                    IconButton(onPressed: (){
                     GoPage().navDelete(context,LayOut());
                     cubit.search.clear();
                    }, icon:Icon(Icons.arrow_back,
                    color: primaryColor,) ),

                  ],
                ) ,
              )
          ) ,
          body:Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: buildTextFormField(
                  padding: EdgeInsets.all(0),
                  controller: searchController,
                  Type: TextInputType.text,
                  suffix: searchController.text !=''?Icons.clear:null,
                  suffixPressed: (){
                    searchController.text='';
                  },
                  onChange: (value) {
                    cubit.search.clear();
                    if (searchController.text!='') {
                      cubit.getSearch(value);
                    }
                    },
                  // validator: ( value) {
                  //   if (value!.isEmpty) {
                  //     return 'search must not be empty';
                  //   }
                  //   return null;
                  // },
                  prefix: Icons.search, labelTitle: 'Search',
                ),
              ),
              Expanded(
                child: articleBuilder(
                  cubit.search,
                  context,false
                ),
              ),
            ],
          ) ,
        );
      },
    );
  }
}


// class SearchScreen extends StatelessWidget {
//   var searchController = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocConsumer<NewsCubit, AppStates>(
//       listener: (context, state) {},
//       builder: (context, state) {
//         var list = NewsCubit.get(context).search;
//
//         return Scaffold(
//           appBar: AppBar(),
//           body: Column(
//             children: [
//               Padding(
//                 padding: const EdgeInsets.all(20.0),
//                 child: defaultFormField(
//                   controller: searchController,
//                   type: TextInputType.text,
//                   onChange: (value) {
//                     NewsCubit.get(context).getSearch(value!);
//                   },
//                   validate: ( value) {
//                     if (value!.isEmpty) {
//                       return 'search must not be empty';
//                     }
//                     return null;
//                   },
//                   label: 'Search',
//                   prefix: Icons.search,
//                 ),
//               ),
//               Expanded(
//                 child: articleBuilder(
//                   list,
//                   context,
//                   isSearch: true,
//                 ),
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }
// }
