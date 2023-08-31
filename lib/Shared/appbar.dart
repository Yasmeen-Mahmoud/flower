import 'package:flower/pages/Check%20_out.dart';
import 'package:flower/provider/shopping_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class APPBAR extends StatelessWidget {
  const APPBAR({super.key});

  @override
  Widget build(BuildContext context) {
    final instanceClass = Provider.of<Shopping_card>(context);
    return Row(
      children: [
        Stack(
          children: [
            Positioned(
              bottom: 23,
              child: Container(
                child:Text(
                  "${instanceClass.PRoducts.length}",
                  style: TextStyle(
                      fontSize: 15,
                      color: Colors.black
                  ),
                ),
                  padding: const EdgeInsets.all(5),
                  decoration: const BoxDecoration(
                      color: Color.fromARGB(221, 233, 169, 210),
                      shape: BoxShape.circle),
                 ),
            ),
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Check_Out(),
                  ),
                );
              },
              icon: const Icon(Icons.add_shopping_cart_sharp),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(right: 17),
          child: Text(
            "\$ ${instanceClass.price}",
            style: const TextStyle(fontSize: 19),
          ),
        ),
      ],
    );
  }
}
