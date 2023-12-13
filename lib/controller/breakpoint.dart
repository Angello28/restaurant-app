import 'package:flutter/material.dart';

int RestaurantGridCount(BuildContext context){
  if (MediaQuery.of(context).size.width > 1024){
    return 4;
  }
  else if (MediaQuery.of(context).size.width > 768){
    return 3;
  }
  else if (MediaQuery.of(context).size.width > 480){
    return 2;
  }
  else{
    return 1;
  }
}