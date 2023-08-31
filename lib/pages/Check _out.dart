import 'package:flower/Shared/appbar.dart';
import 'package:flower/pages/Home.dart';
import 'package:flower/pages/checkout_details.dart';
import 'package:flower/pages/layout_screen.dart';
import 'package:flower/provider/shopping_card.dart';
import 'package:flower/register.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Check_Out extends StatelessWidget {
  const Check_Out({super.key});

  @override
  Widget build(BuildContext context) {
    final instanceClass = Provider.of<Shopping_card>(context);
    return SafeArea(
      child: Scaffold(
         appBar: AppBar(
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
          title: const Text("Check Out"),
          actions: const [APPBAR()],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(5),
            child: Column(
              children: [
                SingleChildScrollView(
                  child: SizedBox(
                    height: 430,
                    child: ListView.builder(
                        padding: const EdgeInsets.all(7),
                        itemCount: instanceClass.PRoducts.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Card(
                            child: ListTile(
                              title: Text(instanceClass.PRoducts[index].name),
                              subtitle:
                                  Text("${instanceClass.PRoducts[index].price}"),
                              leading: CircleAvatar(
                                backgroundImage: AssetImage(
                                    instanceClass.PRoducts[index].imagepath),
                              ),
                              trailing: IconButton(
                                  onPressed: () {
                                    instanceClass.delete(
                                        instanceClass.PRoducts[index]);
                                  },
                                  icon: const Icon(Icons.remove)),
                            ),
                          );
                        }),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  width: 200,
                  child: MaterialButton(
                    color: Colors.pinkAccent,
                    onPressed: (){
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CheckoutDetails(),
                          )
                      );
                    },
                    shape: RoundedRectangleBorder(
                      side: BorderSide(color: Colors.pinkAccent),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      'Check out',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
