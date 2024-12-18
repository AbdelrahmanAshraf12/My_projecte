import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddProduct extends StatefulWidget {
  const AddProduct({super.key});

  @override
  State<AddProduct> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<AddProduct> {
  File? pickedImage;

  Future<void> _pickImage() async {
    try {
      final XFile? image =
          await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image != null) {
        setState(() {
          pickedImage = File(image.path);
        });
      }
    } catch (e) {
      // Handle the exception, such as displaying an error message to the user.
      print('Error picking image: $e');
    }
  }

  final formKey = GlobalKey<FormState>();
  String category = 'Iphone';

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
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "please enter a valid title";
                            } else {
                              return null;
                            }
                          },
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.blue)),
                            labelText: "Title",
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey)),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "please enter a valid Description";
                            } else {
                              return null;
                            }
                          },
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.blue)),
                            labelText: "Description",
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey)),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "please enter a Price ";
                            } else {
                              return null;
                            }
                          },
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.blue)),
                            labelText: "price",
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
                  DropdownButtonHideUnderline(
                    child: DropdownButton(
                      items: [
                        DropdownMenuItem(
                          child: Text("Iphone"),
                          value: "Iphone",
                        ),
                        DropdownMenuItem(
                          child: Text("Labtop"),
                          value: "Labtop",
                        ),
                        DropdownMenuItem(
                          child: Text("Watch"),
                          value: "Watch",
                        ),
                      ],
                      hint: Text("select a category"),
                      onChanged: (value) {
                        setState(() {
                          category = value!;
                        });
                      },
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  TextButton(
                    onPressed: () {
                      _pickImage();
                    },
                    child: pickedImage == null
                        ? Text("Choose image")
                        : Image.file(pickedImage!),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue[800],
                      ),
                      onPressed: () {
                        formKey.currentState!.save(); // save values
                        if (formKey.currentState!.validate()) {}
                      },
                      child: Text(
                        "Upload",
                        style: TextStyle(color: Colors.white),
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
