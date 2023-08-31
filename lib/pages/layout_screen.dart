import 'package:flower/model/prodect.dart';
import 'package:flower/pages/Check%20_out.dart';
import 'package:flower/pages/Home.dart';
import 'package:flower/pages/detailsScreen.dart';
import 'package:flower/pages/gategory_screen.dart';
import 'package:flower/pages/tellus_screen.dart';
import 'package:flutter/material.dart';
import 'package:flower/Shared/appbar.dart';
import 'package:flower/pages/Check%20_out.dart';

class LayoutScreen extends StatefulWidget {
  const LayoutScreen({Key? key}) : super(key: key);

  @override
  State<LayoutScreen> createState() => _ScreensState();
}

class _ScreensState extends State<LayoutScreen> {
  List<Widget> Screens =[

    Home(),
    GategoryScreen(),
    Check_Out(),
    TellUs(),

  ];
  int currentIndex=0;
  List<String> appBarName =[
    "Home",
    "categories",
    "Check Out",
    "Tell Us",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        onTap: (index) {
          this.setState(() {
            currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home),label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.type_specimen),label: "categories"),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart_sharp),label: "Check Out"),
          BottomNavigationBarItem(icon: Icon(Icons.send),label: "Tell Us"),
        ],
      ),

    );
  }
}
