import 'dart:async';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:newsly_app/screens/cubit/states.dart';
import 'package:newsly_app/shared/network/cash_helper.dart';
import 'package:sqflite/sqflite.dart';
import '../../shared/widget/components.dart';
import '../../main.dart';
import '../../modules/lang/lang.dart';
import '../../shared/manager/string.dart';
import '../../shared/network/dio_helper.dart';
import '../../modules/restart.dart';
import '../3-layout/layout.dart';
import '../4-home/content_sc/content_sc.dart';
import '../4-home/content_sc/crypto/view/screen_price_tracker.dart';
import '../4-home/home_screen.dart';
import '../6-setting/setting.dart';
import '../5-stream/stream.dart';
import '../7-search/search_sc.dart';
import '../9-archive/archive.dart';



class homeCubit extends Cubit<homeStates> {
  homeCubit():super(initialState());

  static homeCubit getInstance(context) => BlocProvider.of(context);
  // static homeCubit getInstance(context) => BlocProvider.of(context);
  // int i=0;
  Map<String, String> map = new Map();
   String countrry= CashHelper.getData(key: "country")?? "eg" ;
  int currentIndex=0;
  // String selectedItem='Egypt';
  bool connected=true;

  List<Widget> myTabs(context) {
    return List<Tab>.generate(
        tabs.length,
            (index) => Tab(text:tabs[index].translate(context: context),)
    );
  }

  List<Widget>screens=[
    AllScreen(),

    BusinessScreen(),
    ScienceScreen(),
    SportsScreen(),
    TechnologyScreen(),
    HealthScreen(),
    EntertainmentScreen(),
    ScreenTradingPrices(),
  ];
  List<Widget>pages=[
    const HomeScreen(),
    ArchiveScreen(),
    const Stream(),
      Setting(),
  ];

  void changeBottom(index){
    currentIndex=index;
    emit(changeBottomNav());
  }

  void changeBar(index){
    i=index;
    switch(index) {
      case 0 :
        // getall();
        break;
      case 1 :
        getBusiness();
        break;
      case 2 :
        getScience();
        break;
      case 3 :
        getSports();
        break;
      case 4 :
        getTechnology();
        break;
      case 5 :
        getHealth();
        break;
      case 6:
        getEntrtainment();
        break;

    }
    emit((NewsFeedTabChangeState()));


  }

  void  checkConnection() async {
    bool result = await InternetConnectionChecker().hasConnection;
    if (result == true) {
        connected = true;
        emit(checkConnectivityTrue());
    } else {
        connected = false;
        emit(checkConnectivityFalse());
    }

  }



  List<dynamic> all = [];
  void getall() {
    emit(NewsGetAllLoadingState());
    Timer(Duration(seconds: 1), () {

      DioHelper.getData(
        url: 'v2/top-headlines',
        query:
        {
          'country':countrry,
          'category':'general',
          'apiKey':'0e4dc3d093094a82847f8ec26ea6818c',
        },
      ).then((value)
      {
        all = value.data['articles'];
        print(all[0]['title']);

        emit(NewsGetAllSuccessState());
      }).catchError((error){
        print(error.toString());
        emit(NewsGetAllErrorState(error.toString()));
      });
    });
    emit(initialState());
  }

  List<dynamic> entertainment = [];
  void getEntrtainment() {
    emit(NewsGetEntertainmentLoadingState());

    Timer(Duration(seconds: 1), () {
      DioHelper.getData(
        url: 'v2/top-headlines',
        query:
        {
          'country':countrry,
          'category':'entertainment',
          'apiKey':'0e4dc3d093094a82847f8ec26ea6818c',
        },
      ).then((value)
      {
        //print(value.data['articles'][0]['title']);
        entertainment = value.data['articles'];
        print(entertainment[0]['title']);

        emit(NewsGetEntertainmentSuccessState());
      }).catchError((error){
        print(error.toString());
        emit(NewsGetEntertainmentErrorState(error.toString()));
      });
    });
    emit(initialState());

  }

  List<dynamic> business = [];
  void getBusiness() {
    emit(NewsGetBusinessLoadingState());
    Timer(Duration(seconds: 1), () {
      DioHelper.getData(
        url: 'v2/top-headlines',
        query:
        {
          'country':countrry,
          'category':'business',
          'apiKey':'0e4dc3d093094a82847f8ec26ea6818c',
        },
      ).then((value)
      {
        //print(value.data['articles'][0]['title']);
        business = value.data['articles'];
        print(business[0]['title']);

        emit(NewsGetBusinessSuccessState());
      }).catchError((error){
        print(error.toString());
        emit(NewsGetBusinessErrorState(error.toString()));
      });
    });
    emit(initialState());

  }

  List<dynamic> science = [];
  void getScience() {
    emit(NewsGetScienceLoadingState());
    Timer(Duration(seconds: 1), () {
      DioHelper.getData(
        url: 'v2/top-headlines',
        query:
        {
          'country':countrry,
          'category':'science',
          'apiKey':'0e4dc3d093094a82847f8ec26ea6818c',
        },
      ).then((value)
      {
        //print(value.data['articles'][0]['title']);
        science = value.data['articles'];
        print(science[0]['title']);

        emit(NewsGetScienceSuccessState());
      }).catchError((error){
        print(error.toString());
        emit(NewsGetScienceErrorState(error.toString()));
      });
    });
    emit(initialState());

  }

  List<dynamic> sports = [];
  void getSports() {
    emit(NewsGetSportsLoadingState());
    Timer(Duration(seconds: 1), () {
      DioHelper.getData(
        url: 'v2/top-headlines',
        query:
        {
          'country':countrry,
          'category':'sports',
          'apiKey':'0e4dc3d093094a82847f8ec26ea6818c',
        },
      ).then((value)
      {
        //print(value.data['articles'][0]['title']);
        sports = value.data['articles'];
        print(sports[0]['title']);

        emit(NewsGetSportsSuccessState());
      }).catchError((error){
        print(error.toString());
        emit(NewsGetSportsErrorState(error.toString()));
      });
    });
    emit(initialState());

  }

  List<dynamic> technology = [];
  void getTechnology() {
    emit(NewsGetTechnologyLoadingState());
    Timer(Duration(seconds: 1), () {
      DioHelper.getData(
        url: 'v2/top-headlines',
        query:
        {
          'country':countrry,
          'category':'technology',
          'apiKey':'0e4dc3d093094a82847f8ec26ea6818c',
        },
      ).then((value)
      {
        //print(value.data['articles'][0]['title']);
        technology = value.data['articles'];
        print(technology[0]['title']);

        emit(NewsGetTechnologySuccessState());
      }).catchError((error){
        print(error.toString());
        emit(NewsGetTechnologyErrorState(error.toString()));
      });
    });
    emit(initialState());

  }

  List<dynamic> health = [];
  void getHealth() {

    emit(NewsGetHealthLoadingState());
    Timer(Duration(seconds: 1), () {
      DioHelper.getData(
        url: 'v2/top-headlines',
        query:
        {
          'country':countrry,
          'category':'health',
          'apiKey':'0e4dc3d093094a82847f8ec26ea6818c',
        },
      ).then((value)
      {
        //print(value.data['articles'][0]['title']);
        health = value.data['articles'];
        print(health[0]['title']);

        emit(NewsGetHealthSuccessState());
      }).catchError((error){
        print(error.toString());
        emit(NewsGetHealthErrorState(error.toString()));
      });
    });
    emit(initialState());

  }


  List<dynamic> search = [];

  void getSearch(String value)
  {
    emit(NewsGetSearchLoadingState());
    Timer(Duration(seconds: 1), () {
      DioHelper.getData(
        url: 'v2/top-headlines',
        query:
        {
          'q':value,
          'apiKey':'0e4dc3d093094a82847f8ec26ea6818c',
        },
      ).then((value)
      {
        //print(value.data['articles'][0]['title']);
        search = value.data['articles'];
        print(search[0]['title']);

        emit(NewsGetSearchSuccessState());
      }).catchError((error){
        print(error.toString());
        emit(NewsGetSearchErrorState(error.toString()));
      });
    });
    emit(initialState());

  }



  // Todo: related to App language
  void changeAppLanguage({required Locale locale,context})  {
     CashHelper.saveData(key: "current_locale_app",value: locale.languageCode).then((value){
      if( value == true )
      {
        currentLocaleApp = Locale(locale.languageCode);
        emit(ChangeAppLanguageSuccessState());
        RestartWidget.restartApp(context);
      }
      else
      {
        emit(ChangeAppLanguageErrorState());
      }
    });
    emit(loasding());
    // emit(loasding());
  }

// Todo: this related to newsScreen about changeDropDownItem

  void selectCountry(String val,context) {
    for (int i = 0; i < country.length; i++) {
      map[country[i]] = value[i];
    emit(chCountry2());
  }
    countrry = map[val]!;
      CashHelper.saveData(key: "country", value: countrry) .then((value) {
        if (value) {
          emit(chCountry3());
          RestartWidget.restartApp(context);
        }  else{
          emit(chCountryError());
        }
      });
  }

//refresh

  Future<void>handleRefresh() {
    final Completer<void> completer = Completer<void>();
    Timer(const Duration(seconds: 2), () {
      completer.complete();
    });
    // setState(() {
    //   refreshNum = Random().nextInt(100);
    // });
    return completer.future.then<void>((_) {

      switch(i) {
        case 0 :
          all.clear();
          getall();
          break;
        case 1 :
          business.clear();
          getBusiness();
          break;
        case 2 :
          science.clear();
          getScience();
          break;
        case 3 :
          sports.clear();
          getSports();
          break;
        case 4 :
          technology.clear();
          getTechnology();
          break;
        case 5 :
          health.clear();
          getHealth();
          break;
        case 6:
          entertainment.clear();
          getEntrtainment();
          break;

      }
    });
  }

  Database? db ;
  List<Map> archivedData = [];

  void createDatabase() async {
    db = await openDatabase(
        'news.db',
        version: 1,
        onCreate: (database,version)
        {
          database.execute("CREATE TABLE news (id INTEGER PRIMARY KEY, title TEXT, urlImage TEXT, publishedAt TEXT,url TEXT)").then((value)
          {
            emit(CreateDatabaseState());
            print("News Table created successfully");
          }).catchError((e)=>print("error during create table"));
        },
        onOpen: (database)
        {
          // get Data from Database Method & emit()
          getDatabase(database);
          print("News.db opened successfully");
        }
    );
  }
  // 2. Insert Data to news table
  Future<void> InsertTODatabase({
    required String title,urlToImage,publishedAt,url
  })
  async {
    await db?.transaction((txn) async {
      txn.rawInsert('INSERT INTO news(title,urlImage,publishedAt,url) VALUES ("$title","$urlToImage","$publishedAt","$url")');
    }).then((val)
    {
      emit(InsertToDatabaseState());
      print("Data was inserted to Database are => $val");
      getDatabase(db!);
    }).catchError((e) {
      debugPrint("Error during insert to Database, reason is $e");
    });
  }

  // 3. get Data form Database
  Future getDatabase(Database database)
  {
    return database.rawQuery("SELECT * FROM news").then((value)
    {
      archivedData = value;
      emit(GetDataFromDatabaseState());
    }).catchError((e)=>debugPrint("error during get data from database"));
  }
  // 4. delete item from database
  void DeleteDatebase({required int id}) {
    db?.rawUpdate(
        'DELETE FROM news WHERE id = ?',
        [id]
    ).then((value)
    {
      emit(DeletedItemFromDatabaseState());
      getDatabase(db!);
    }).catchError((e)=>print(e.toString()));
  }






}
