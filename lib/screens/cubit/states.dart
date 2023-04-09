abstract class homeStates{}
class initialState extends homeStates{}
class NewsFeedTabChangeState extends homeStates{}
class changeBottomNav extends homeStates{}
class chSearch extends homeStates{}
class checkConnectivityTrue extends homeStates{}
class checkConnectivityFalse extends homeStates{}
class ChangeAppLanguageSuccessState extends homeStates{}
class ChangeAppLanguageErrorState extends homeStates{}
class loasding extends homeStates{}
class chCountry1 extends homeStates{}
class chCountry2 extends homeStates{}
class chCountry3 extends homeStates{}
class chCountryError extends homeStates{}
class changecountState extends homeStates{}

class NewsGetAllLoadingState extends homeStates{}
class NewsGetAllSuccessState extends homeStates{}
class NewsGetAllErrorState extends homeStates{
 final String error;

 NewsGetAllErrorState(this.error);
}

class NewsGetEntertainmentLoadingState extends homeStates{}
class NewsGetEntertainmentSuccessState extends homeStates{}
class NewsGetEntertainmentErrorState extends homeStates{
 final String error;

 NewsGetEntertainmentErrorState(this.error);
}

class NewsGetScienceLoadingState extends homeStates{}
class NewsGetScienceSuccessState extends homeStates{}
class NewsGetScienceErrorState extends homeStates{
 final String error;

 NewsGetScienceErrorState(this.error);
}

class NewsGetSportsLoadingState extends homeStates{}
class NewsGetSportsSuccessState extends homeStates{}
class NewsGetSportsErrorState extends homeStates{
 final String error;

 NewsGetSportsErrorState(this.error);
}

class NewsGetTechnologyLoadingState extends homeStates{}
class NewsGetTechnologySuccessState extends homeStates{}
class NewsGetTechnologyErrorState extends homeStates{
 final String error;

 NewsGetTechnologyErrorState(this.error);
}

class NewsGetBusinessLoadingState extends homeStates{}
class NewsGetBusinessSuccessState extends homeStates{}
class NewsGetBusinessErrorState extends homeStates{
 final String error;

 NewsGetBusinessErrorState(this.error);
}

class NewsGetHealthLoadingState extends homeStates{}
class NewsGetHealthSuccessState extends homeStates{}
class NewsGetHealthErrorState extends homeStates{
 final String error;

 NewsGetHealthErrorState(this.error);
}
class NewsGetSearchLoadingState extends homeStates{}
class NewsGetSearchSuccessState extends homeStates{}
class NewsGetSearchErrorState extends homeStates{
 final String error;

 NewsGetSearchErrorState(this.error);
}

class CreateDatabaseState extends homeStates{}
class InsertToDatabaseState extends homeStates{}
class GetDataFromDatabaseState extends homeStates{}
class DeletedItemFromDatabaseState extends homeStates{}



class loading1 extends homeStates{}
class loading2 extends homeStates{}
class loading3 extends homeStates{}
class state1 extends homeStates{}
class state0 extends homeStates{}
class state2 extends homeStates{}
class state3 extends homeStates{}