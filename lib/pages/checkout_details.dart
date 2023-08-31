import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flower/pages/layout_screen.dart';
import 'package:flutter/material.dart';


class CheckoutDetails extends StatefulWidget {
  const CheckoutDetails({super.key});

  @override
  State<CheckoutDetails> createState() => _CheckoutDetailsState();
}

class _CheckoutDetailsState extends State<CheckoutDetails> {

  bool showPassword = true;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController fullNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
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
                  TextFormField(
                    validator: (value){
                      if (value!.isEmpty){
                        return "FullName must not be empty";
                      }
                      return null;
                    },
                    keyboardType: TextInputType.emailAddress,
                    cursorColor: Colors.pinkAccent,
                    decoration: InputDecoration(
                      labelText: 'Full Name',
                      labelStyle: TextStyle(
                        color: Colors.pinkAccent,
                      ),
                      prefixIcon: Icon(
                        Icons.person,
                        color: Colors.pinkAccent,
                      ),
                      border: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
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
                        borderRadius: BorderRadius.circular(25),
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
                    validator: (value){
                      if (value!.isEmpty){
                        return "Phone must not be empty";
                      }
                      else if (value.length < 11){
                        return "Phone must be 11 number";
                      }
                      return null;
                    },
                    keyboardType: TextInputType.emailAddress,
                    cursorColor: Colors.pinkAccent,
                    decoration: InputDecoration(
                      labelText: 'Phone',
                      labelStyle: TextStyle(
                        color: Colors.pinkAccent,
                      ),
                      prefixIcon: Icon(
                        Icons.phone_android,
                        color: Colors.pinkAccent,
                      ),
                      border: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
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
                    width: 200,
                    child: MaterialButton(
                      color: Colors.pinkAccent,
                      onPressed: (){
                        if (formKey.currentState!.validate()) {
                          print(emailController.text);
                          print(passwordController.text);
                          print(fullNameController.text);
                          print(phoneController.text);

                          void userCreate({
                            required String name,
                            required String phone,
                            required String email,
                            required String uId,
                          })
                          {
                            FirebaseFirestore.instance
                                .collection("users")
                                .doc(uId)
                                .set({
                              "email" : emailController.text,
                              "name" : fullNameController.text,
                              "phone" : phoneController.text,
                            })
                                .then((value){
                              print("success");
                            })
                                .catchError((error){
                              print(error.toString());
                            });
                          }
                          if (context.mounted) {
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const LayoutScreen(),
                              ),
                                  (route) => false,
                            );
                          }

                          FirebaseAuth.instance.signInWithEmailAndPassword(
                            email: emailController.text.trim(),
                            password: passwordController.text.trim(),
                          ).then((value) {

                            print(value.user!.email);
                            print(value.user!.uid);
                            print("success");

                          }).catchError((error){

                            print(error.toString());
                          });
                        }
                      },
                      shape: RoundedRectangleBorder(
                        side: BorderSide(color: Colors.pinkAccent),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        'Done',
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

      ),
    );
  }
}
