import 'package:flutter/material.dart';

class space{

 static double h(context,n){
    return MediaQuery.of(context).size.height*n;
  }
 static double w(context,n){
  return MediaQuery.of(context).size.width*n;
  }

}