import 'package:shared_preferences/shared_preferences.dart';

import '../assistantMethods/cart_methods.dart';



SharedPreferences? sharedPreferences;

final itemsImagesList =
[
  "slider/0.jpeg",
  "slider/1.jpeg",
  "slider/2.jpeg",
  "slider/3.jpeg",
  "slider/4.jpeg",


];

CartMethods cartMethods = CartMethods();

double countStarsRating = 0.0;
String titleStarsRating = "";