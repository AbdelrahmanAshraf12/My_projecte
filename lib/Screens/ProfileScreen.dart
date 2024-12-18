import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project_1/Screens/Login.dart';

import '../widget/ListTileWidget.dart';
import 'AddProduct.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Align(
            alignment: Alignment.topCenter,
            //for display once info user not chat
            child: FutureBuilder(
                future: FirebaseFirestore.instance
                    .collection('users')
                    .doc(FirebaseAuth.instance.currentUser!.uid)
                    .get(),
                builder: (context, snapshot) {
                  final name = snapshot.data?.data()!['name'];
                  final email = snapshot.data?.data()!['email'];
                  if (snapshot.hasError) {
                    return Text("Error");
                  }
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return CircularProgressIndicator();
                  }
                  if (snapshot.hasData) {
                    return Column(
                      children: [
                        Text(
                          name,
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        Text(
                          email,
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        ListtileWidget(
                          icon: Icons.request_page,
                          title: 'Orders',
                          function: () {},
                        ),
                        Divider(
                          color: Colors.grey[300],
                          thickness: 1,
                        ),
                        ListtileWidget(
                          icon: Icons.favorite,
                          title: 'Favorite',
                          function: () {},
                        ),
                        Divider(
                          color: Colors.grey[300],
                          thickness: 1,
                        ),
                        ListtileWidget(
                          icon: Icons.add,
                          title: 'Add Proudct',
                          function: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => AddProduct()));
                          },
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue[900],
                            ),
                            onPressed: () async {
                              await FirebaseAuth.instance.signOut();
                              Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                  builder: (context) => LoginScreen(),
                                ),
                              );
                            },
                            child: Text(
                              "Sign Out",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    );
                  }

                  return Text(""); // for error of if
                }),
          ),
        ),
      ),
    );
  }
}
