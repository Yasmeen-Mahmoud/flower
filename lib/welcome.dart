import 'package:flower/login.dart';
import 'package:flower/register.dart';
import 'package:flutter/material.dart';


class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(

            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(25),
                        child: Text(
                          'Welcome',
                          style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                            color: Colors.pinkAccent.shade700,
                          ),
                        ),

                      ),
                      SizedBox(height: 10),
                      Container(
                        height: MediaQuery.of(context).size.height /3,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/img/flowers.jpeg',)
                          ),
                        ),

                      ),
                      SizedBox(height: 20,),
                      Text(
                      " Roses are known for their charming different types, "
                          "Although there are many types of roses, it is easy to distinguish between them, "
                          "Each one has its own shape and distinctive aroma.",
                        textAlign: TextAlign.center,
                        style:TextStyle(
                          color: Colors.grey[700],
                            fontSize: 15
                        ),
                      ),



                    ],
                  ),

                  SizedBox(height: 30,)
                  , Column(
                    children: <Widget>[
                      Container(
                        width: double.infinity,
                        child: MaterialButton(
                          onPressed: (){
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LoginScreen(),
                                )
                            );
                          },
                          shape: RoundedRectangleBorder(
                            side: BorderSide(color: Colors.pinkAccent),
                            borderRadius: BorderRadius.circular(20),
                          ),

                          child: Text(
                            'Login',
                            style: TextStyle(
                              color: Colors.pinkAccent,
                              fontSize: 25,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: double.infinity,
                        child: MaterialButton(
                          color: Colors.pinkAccent,
                          onPressed: (){
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => RegisterScreen(),
                                )
                            );
                          },
                          shape: RoundedRectangleBorder(
                            side: BorderSide(color: Colors.pinkAccent),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            'Register',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                            ),
                          ),
                        ),
                      ),

                    ],
                  )
                ]),

          ),
        )
    );
  }
}
