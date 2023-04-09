import 'package:flutter/material.dart';
import 'package:newsly_app/shared/manager/language/lang.dart';

class LanguageModel{
  String langName;
  String langIsoCode;
  LanguageModel({required this.langIsoCode,required this.langName});
}

// Todo: made this to use in dropDownButton that on Profile screen which used to change language
List<LanguageModel> languageOptions =
[
  LanguageModel(langIsoCode: "en", langName: "english"),
  LanguageModel(langIsoCode: "ar", langName: "arabic"),
  LanguageModel(langIsoCode: "fr", langName: "french"),
];

extension TranslateKey on String
{
  String translate({required BuildContext context}){
    return MyLocalizations.getInstance(context: context)!.getValueFromJsonData(key: this);  // Todo: this == String value that will be used to call this extension
  }
}








TextDirection arabicDirection = TextDirection.rtl;    // Todo: عامله عشان اضبط اتجاه الكلام علي حسب الاخبار بتاع كل دوله

Locale currentLocaleApp = const Locale("ar");
