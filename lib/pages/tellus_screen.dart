import 'package:flower/model/prodect.dart';
import 'package:flower/pages/Check%20_out.dart';
import 'package:flower/pages/Home.dart';
import 'package:flower/pages/detailsScreen.dart';
import 'package:flower/pages/layout_screen.dart';
import 'package:flutter/material.dart';

class TellUs extends StatelessWidget {
  const TellUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        title: const Text("Tell Us"),
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            top: 20,
            left: 10,
            right: 10
          ),
          child: Column(
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage(
                        "assets/photo/أزهار-جراند-فلورا.jpg"
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Yasmeen Mahmoud",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "  ysmn@gmail.com",
                        style: TextStyle(
                          fontSize: 10,
                          color: Colors.black45,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage(
                        "assets/photo/أميرال أفيلان.jpg"
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Suad Abd-Elmalak",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "  suad@gmail.com",
                        style: TextStyle(
                          fontSize: 10,
                          color: Colors.black45,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              TextFormField(
                maxLines: 5,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(
                        color: Colors.pinkAccent
                    ),
                  ),
                  labelText: "if you have any comments",
                  labelStyle: TextStyle(
                    color: Colors.pinkAccent
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                width: 200,
                child: MaterialButton(
                  color: Colors.pinkAccent,
                  onPressed: (){
                   /* Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LayoutScreen(),
                        )
                    ); */
                  },
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.pinkAccent),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    'Send',
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
    );
  }
}