import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flower/pages/Home.dart';
import 'package:flower/pages/layout_screen.dart';
import 'package:flutter/material.dart';
import 'package:flower/pages/detailsScreen.dart';
import 'package:flower/provider/shopping_card.dart';
import 'package:flower/model/prodect.dart';
import 'package:provider/provider.dart';
import 'package:flower/Shared/appbar.dart';
import 'package:flower/pages/Check%20_out.dart';

class GategoryScreen extends StatefulWidget{
    GategoryScreen({super.key});

  @override
  State<GategoryScreen> createState() => _GategoryScreenState();

  final Stream<QuerySnapshot> notesStream = FirebaseFirestore.instance
      .collection('categories')
      .orderBy('id')
      .snapshots();
}

class _GategoryScreenState extends State<GategoryScreen> {
  @override
  Widget build(BuildContext context) {

    final instanceClass = Provider.of<Shopping_card>(context);
    return Scaffold(

       appBar: AppBar(
          //elevation: 0,
          backgroundColor: Colors.pinkAccent,
         leading: IconButton(
             onPressed: (){
               Navigator.push(
                   context,
                   MaterialPageRoute(
                     builder: (context) => LayoutScreen(),
                   )
               );
             },
             icon: Icon(Icons.arrow_back)
         ),
          title: const Text("Gategories"),
          //   centerTitle: true,
          actions: const [APPBAR()],
        ),
      body: Padding(
          padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
          child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 2 / 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 30,
              ),
              itemCount: items.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Details(product: items[index]),
                      ),
                    );
                  },
                  child: GridTile(
                    footer: GridTileBar(
                      //eading: const Text(
                      // "\$10",
                      // style: TextStyle(fontWeight: FontWeight.bold),
                      //,
                      title: const Text(""),
                      // backgroundColor: Colors.cyanAccent,
                      trailing: IconButton(
                          color: const Color.fromARGB(221, 216, 66, 172),
                          onPressed: () {
                            instanceClass.add(items[index]);
                          },
                          icon: const Icon(Icons.add_circle_outline_rounded)),
                    ),
                    child: Stack(
                      children: [
                        Positioned(
                          top: -2,
                          bottom: 5,
                          left: 0,
                          right: 5,
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(40),
                              child: Image.asset(items[index].imagepath)),
                        ),
                      ],
                    ),
                  ),
                );
              })),
    );
  }
}