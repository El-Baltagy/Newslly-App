
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:newsly_app/modules/lang/lang.dart';
import 'package:newsly_app/screens/1-splach_screen/splach_sc.dart';
import 'package:newsly_app/screens/2-on_boarding/on_boarding.dart';
import 'package:newsly_app/screens/3-layout/layout.dart';
import 'package:newsly_app/screens/4-home/home_screen.dart';
import 'package:newsly_app/screens/6-setting/setting.dart';
import 'package:newsly_app/screens/7-search/search_sc.dart';
import 'package:newsly_app/screens/cubit/bloc_observe.dart';
import 'package:newsly_app/screens/cubit/cubit.dart';
import 'package:newsly_app/screens/cubit/states.dart';
import 'package:newsly_app/shared/manager/color.dart';
import 'package:newsly_app/shared/manager/language/lang.dart';
import 'package:newsly_app/shared/manager/theme/app_theme.dart';
import 'package:newsly_app/shared/manager/theme/cubit/theme_cubit.dart';
import 'package:newsly_app/shared/manager/theme/cubit/theme_state.dart';
import 'package:newsly_app/shared/network/cash_helper.dart';
import 'package:newsly_app/shared/network/dio_helper.dart';
import 'package:newsly_app/modules/restart.dart';


 main() async{
  WidgetsFlutterBinding.ensureInitialized();

  await CashHelper.init();
  currentLocaleApp = Locale(await CashHelper.getData(key: "current_locale_app")?? "en");
  await DioHelper.init();
  Bloc.observer = MyBlocObserver();

  runApp(RestartWidget(
    child:const ProviderScope(child: MyApp(),) ,
  )
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
   // late final cubit;
   @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        // BlocProvider(create: (context) => homeCubit()),
        BlocProvider(create: (context) => ThemeCubit()),
        BlocProvider(create: (context) => homeCubit()..checkConnection()..getall()..createDatabase()),

      ],
      child: BlocConsumer<ThemeCubit,ThemeState>(

        listener: (context, state) {},
        builder: (context, state) {
          final cubit=ThemeCubit.get(context);
          return ScreenUtilInit(
            designSize: const Size(360, 690),
            minTextAdapt: true,
            splitScreenMode: true,
            builder: (context, child) =>MaterialApp(
              locale: currentLocaleApp,    // Todo: actually App's language ( which will passed to my delegate to get json files )
              supportedLocales: const
              [
                Locale("ar"),
                Locale("en","US"),
                Locale("fr"),
              ],
              localizationsDelegates: [
                GlobalMaterialLocalizations.delegate,                                 // Todo: get the directions for names for specific widgets depending on Device language
                GlobalCupertinoLocalizations.delegate,                                // Todo: get the directions for names for specific widgets depending on Device language
                GlobalWidgetsLocalizations.delegate,                                  // Todo: get the directions for widgets depending on Device language
                MyLocalizations.delegate,                                             // Todo: Calling The Delegate which I created to load data from json files
              ],
              localeResolutionCallback : (deviceLocale,supportedLocales) {
                for( var locale in supportedLocales )
                {
                  if( locale.languageCode == deviceLocale!.languageCode ) return deviceLocale;
                }
                return supportedLocales.first;
              },

              title: 'Newwsly App',
              debugShowCheckedModeBanner: false,
              theme: lightTheme,
              darkTheme: darkTheme,
              themeMode: cubit.isDarkTheme?
              ThemeMode.dark: ThemeMode.light,
              initialRoute: '/',
              routes: {
                '/': (context) => const SplashSc(),
                '/LayOut': (context) => const LayOut(),
                '/home': (context) => const HomeScreen(),
                '/onBoarding_sc': (context) =>  OnBoardingSC(),
                '/search': (context) =>  Search(),
              },
            ) ,
          );
        } ,

      ),
    );
  }
}

// class EXP extends StatefulWidget {
//   const EXP({Key? key}) : super(key: key);
//
//
//
//   @override
//   State<EXP> createState() => _EXPState();
//  }
//
// late final cubit;
// class _EXPState extends State<EXP> {
//
//    @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//      cubit=homeCubit1.getInstance(context);
//   }
//
//    @override
//   Widget build(BuildContext context) {
//      print('00000000000000');
//     return Scaffold(
//       body: SafeArea(
//         child: Column(
//           children: [
//          BlocBuilder<homeCubit1,homeStates>(
//             buildWhen:(previous, current) =>previous is  initialState && current is loading1,
//             builder: (context, state) {
//               print('11111111111');
//               return TextButton(
//                   onPressed: (){
//                     cubit.EXP1();
//                   },
//                   child: Text('${cubit.k1}+1111111111111'));
//           },
//           ),
//             const SizedBox(
//               height: 40,
//             ),
//
//             BlocBuilder<homeCubit1,homeStates>(
//               buildWhen:(previous, current) =>previous is  initialState && current is loading2,
//               builder: (context, state) {
//                 print('222222222222');
//                 return TextButton(
//                     onPressed: (){
//                       cubit.EXP2();
//                     },
//                     child: Text('${cubit.k2}+2222222222'));
//               },
//             ),
//             const SizedBox(
//               height: 40,
//             ),
//
//             BlocBuilder<homeCubit1,homeStates>(
//               buildWhen:(previous, current) =>previous is  initialState && current is loading3,
//               builder: (context, state) {
//                 print('3333333333333');
//                 return TextButton(
//                     onPressed: (){
//                       cubit.EXP3();
//                     },
//                     child: Text('${cubit.k3}+3333333333333'));
//               },
//             ),
//             const SizedBox(
//               height: 40,
//             ),
//
//
//
//             // BlocConsumer<homeCubit,homeStates>(
//             //   listener:(context, state) {
//             //
//             //   },
//             //   builder: (context, state) {
//             //
//             //     print('44444');
//             //     return TextButton(
//             //         onPressed: (){
//             //           cubit.EXP();
//             //         },
//             //         child: Text('444444444'));
//             //   }, ),
//             // const SizedBox(
//             //   height: 40,
//             // ),
//
//           ],
//         ),
//       ),
//     );
//   }
// }
//
//
// class homeCubit1 extends Cubit<homeStates> {
//   homeCubit1():super(initialState());
//
//   static homeCubit1 getInstance(context) => BlocProvider.of(context);
//   // static homeCubit getInstance(context) => BlocProvider.of(context);
//
//
//
//   int k1=0;
//   void EXP1(){
//     emit(loading1());
//     k1++;
//     emit(state0());
//     print('object');
//     emit(state1());
//     emit(initialState());
//   }
//
//   int k2=0;
//   void EXP2(){
//     emit(loading2());
//     k2++;
//
//     emit(state2());
//     emit(initialState());
//   }
//
//   int k3=0;
//   void EXP3(){
//     emit(loading3());
//     k3++;
//
//     emit(state3());
//     emit(initialState());
//   }
//
//
//
// }
