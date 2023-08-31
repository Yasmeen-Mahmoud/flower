import 'package:firebase_core/firebase_core.dart';
import 'package:flower/login.dart';
import 'package:flower/model/prodect.dart';
import 'package:flower/pages/Check%20_out.dart';
import 'package:flower/pages/Home.dart';
import 'package:flower/provider/shopping_card.dart';
import 'package:flower/welcome.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flower/Shared//custom_textfield.dart';
//import 'package:flower/pages/Welcome.dart';
import 'package:flower/pages/detailsScreen.dart';
import 'package:flower/pages/detailsScreen.dart';
void main() async{
  runApp(const MyApp());

  await Firebase.initializeApp();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: ( context) {
        return Shopping_card();
      },
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: WelcomeScreen(),
      ),
    );
  }
}

