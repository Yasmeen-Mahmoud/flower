import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flower/Shared/appbar.dart';
import 'package:flower/login.dart';
import 'package:flower/pages/Check%20_out.dart';
import 'package:flower/pages/detailsScreen.dart';
import 'package:flower/pages/flower_page_body.dart';
import 'package:flower/pages/flower_page_two.dart';
import 'package:flower/provider/shopping_card.dart';
import 'package:flutter/material.dart';
import 'package:flower/model/prodect.dart';
import 'package:provider/provider.dart';


class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  final Stream<QuerySnapshot> productsStream = FirebaseFirestore.instance
      .collection('products')
      .orderBy('id')
      .snapshots();

  @override
  Widget build(BuildContext context) {
    final instanceClass = Provider.of<Shopping_card>(context);
    return SafeArea(
      child: Scaffold(
        /*appBar: AppBar(
          //elevation: 0,
          backgroundColor: Colors.pinkAccent,
          leading: IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginScreen(),
                    )
                );
              },
              icon: Icon(Icons.arrow_back)
          ),
          title: const Text("Home"),
          //   centerTitle: true,
          //actions: const [APPBAR()],
        ),*/

        body: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 15, bottom: 15),
              padding: EdgeInsets.only(left: 20 , right: 20),
              child:
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text(
                          "Egypt",
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.pink,
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            "Zagazig",
                            style: TextStyle(
                              fontSize: 10,
                              color: Colors.black45,
                            ),
                          ),
                          Icon(
                            Icons.arrow_drop_down_rounded,
                            color: Colors.black45,
                          ),
                        ],
                      ),
                    ],
                  ),
                  Center(
                    child: Container(
                      width: 45,
                      height: 45,
                      child: Icon(
                        Icons.search,
                        color: Colors.white,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.pink,
                      ),
                    ),
                  ),
                ],
              ),

            ),
            Expanded(child: SingleChildScrollView(
              child:Column(
                children: [
                  FlowerPageBody(),
                  FlowerPageTwo(),
                ],
              ),
            ),
            ),
          ],
        ),
      ),
    );
  }
}