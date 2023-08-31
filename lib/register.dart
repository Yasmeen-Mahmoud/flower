import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flower/login.dart';
import 'package:flower/pages/Home.dart';
import 'package:flower/pages/layout_screen.dart';
import 'package:flower/welcome.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends

StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {


  bool showPassword = true;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();

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
                    builder: (context) => WelcomeScreen(),
                  )
              );
            },
            icon: Icon(Icons.arrow_back),
        ),
        title: Text(
          'Register',
          style: TextStyle(
            fontSize: 25,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: (){},
            icon: Icon(Icons.menu),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 20,
            right: 20,
            top: 20,
          ),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height /3,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage('assets/img/flowers.jpeg',)
                    ),
                  ),

                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: emailController,
                  validator: (value){
                    final bool emailValid =
                    RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                        .hasMatch(value!);
                    if (value!.isEmpty){
                      return "Email must not be empty";
                    }
                    else if (emailValid == false){
                      return "Email Format invalid";
                    }
                    return null;
                  },
                  keyboardType: TextInputType.emailAddress,
                  cursorColor: Colors.pinkAccent,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    labelStyle: TextStyle(
                      color: Colors.pinkAccent,
                    ),
                    prefixIcon: Icon(
                      Icons.email,
                      color: Colors.pinkAccent,
                    ),
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(
                        color: Colors.pinkAccent,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  obscureText: showPassword,
                  controller: passwordController,
                  validator: (value){
                    if (value!.isEmpty){
                      return "Password must not be empty";
                    }
                    else if (value.length < 5){
                      return "Password is too short";
                    }
                    return null;
                  },
                  keyboardType: TextInputType.emailAddress,
                  cursorColor: Colors.pinkAccent,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    labelStyle: TextStyle(
                      color: Colors.pinkAccent,
                    ),
                    prefixIcon: Icon(
                      Icons.lock,
                      color: Colors.pinkAccent,
                    ),
                    suffixIcon: IconButton(
                      onPressed: (){
                        setState((){
                          showPassword = !showPassword;
                        });
                      },
                      icon: Icon(
                        showPassword ? Icons.visibility_off : Icons.visibility,
                        color: Colors.pinkAccent,
                      ),
                    ),
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(
                        color: Colors.pinkAccent,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  obscureText: showPassword,
                  controller: passwordController,
                  validator: (value){
                    if (value!.isEmpty){
                      return "Password must not be empty";
                    }
                    else if (value.length < 5){
                      return "Password is too short";
                    }
                    return null;
                  },
                  keyboardType: TextInputType.emailAddress,
                  cursorColor: Colors.pinkAccent,
                  decoration: InputDecoration(
                    labelText: 'Confirm Password',
                    labelStyle: TextStyle(
                      color: Colors.pinkAccent,
                    ),
                    prefixIcon: Icon(
                      Icons.lock,
                      color: Colors.pinkAccent,
                    ),
                    suffixIcon: IconButton(
                      onPressed: (){
                        setState((){
                          showPassword = !showPassword;
                        });
                      },
                      icon: Icon(
                        showPassword ? Icons.visibility_off : Icons.visibility,
                        color: Colors.pinkAccent,
                      ),
                    ),
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(
                        color: Colors.pinkAccent,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.pinkAccent,
                  ),
                  child: MaterialButton(
                    onPressed: (){
                      if (formKey.currentState!.validate()) {
                        print(emailController.text);
                        print(passwordController.text);

                        void userCreate({
                          required String name,
                          required String uId,
                        }) {
                          FirebaseFirestore.instance
                              .collection("users")
                              .doc(uId)
                              .set({
                            "email": emailController.text,
                          })
                              .then((value) {
                            print("success");
                          })
                              .catchError((error) {
                            print(error.toString());
                          });
                        }
                        if (context.mounted) {
                          if (Navigator.canPop(context)) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const LayoutScreen(),
                                ));
                          } else {
                            Navigator.pop(context);
                          }
                        }
                      }

                        FirebaseAuth.instance.createUserWithEmailAndPassword(
                          email: emailController.text.trim(),
                          password: passwordController.text.trim(),
                        )
                            .then((value) {
                              //emit(_RegisterScreenState());
                              print(value.user!.email);
                              print(value.user!.uid);
                              print("success");
                        })
                            .catchError((error) {
                             // emit(_RegisterScreenState());
                              print(error.toString());
                        });

                  },
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
            ),
          ),
        ),
      ),
    );
  }

  void emit(_RegisterScreenState registerScreenState) {}
}