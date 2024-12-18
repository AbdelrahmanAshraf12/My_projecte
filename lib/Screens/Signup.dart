import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:project_1/Screens/bottombar.dart';

import 'login.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool isLoading = false;

  final name = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();

  void signUp() async {
    setState(() {
      isLoading = true;
    });
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email.text, password: password.text);
      await FirebaseFirestore.instance //save data of users in cloud
          .collection("users")
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .set({
        'name': name.text,
        'email': email.text,
        'id': FirebaseAuth.instance.currentUser!.uid,
        "usercart": [],
        'userwishlist': [],
      });
      setState(() {
        isLoading = false;
      });
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => BottomBar(),
        ),
      );
    } on FirebaseException catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(error.toString()),
        ),
      );
    }
  }

  @override
  void dispose() {
    name.dispose();
    email.dispose();
    password.dispose();

    super.dispose();
  }

//for validation
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Align(
          alignment: Alignment.topCenter,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 50,
                  ),
                  Text(
                    "E_commerce",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Form(
                    key: formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          controller: name,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "please enter a valid name";
                            } else {
                              return null;
                            }
                          },
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.blue)),
                            hintText: "name",
                            labelText: "Username",
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey)),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          controller: email,
                          validator: (value) {
                            if (value!.isEmpty || !value.contains("@")) {
                              return "please enter a valid Email";
                            } else {
                              return null;
                            }
                          },
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.blue)),
                            hintText: "user@test.com",
                            labelText: "Email",
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey)),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          controller: password,
                          validator: (value) {
                            if (value!.isEmpty || value.length < 8) {
                              return "please enter  valid passward ";
                            } else {
                              return null;
                            }
                          },
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.blue)),
                            hintText: "********",
                            labelText: "passward",
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey)),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue[800],
                        ),
                        onPressed: () {
                          formKey.currentState!.save(); // save values
                          if (formKey.currentState!.validate()) {
                            signUp();
                          }
                        },
                        child: isLoading
                            ? CircularProgressIndicator()
                            : Text(
                                "Sign Up",
                                style: TextStyle(color: Colors.white),
                              )),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text("Do you have account?"),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => LoginScreen()));
                    },
                    child: Text("Login"),
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
