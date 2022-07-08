import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:try_my_meal_user/assistantMethods/address_changer.dart';
import 'package:try_my_meal_user/assistantMethods/cart_item_counter.dart';
import 'package:try_my_meal_user/assistantMethods/total_amount.dart';
import 'package:try_my_meal_user/authScreens/auth_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:try_my_meal_user/global/global.dart';
import 'package:try_my_meal_user/splashScreen/my_splash_screen.dart';

Future<void> main()  async
{
  WidgetsFlutterBinding.ensureInitialized();

  sharedPreferences = await SharedPreferences.getInstance();

  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers:
      [
        ChangeNotifierProvider(create: (c)=> CartItemCounter()),
        ChangeNotifierProvider(create: (c)=> TotalAmount()),
        ChangeNotifierProvider(create: (c)=> AddressChanger()),
      ],
      child: MaterialApp(
        title: 'Users App',
        theme: ThemeData(
          primarySwatch: Colors.purple,
        ),
        debugShowCheckedModeBanner: false,
        home: MySplashScreen(),
      ),
    );
  }
}

