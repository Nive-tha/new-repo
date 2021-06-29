import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google/LoginPage/Landingpage.dart';
import 'package:google/tabspages/homescreen.dart';
import 'package:image_picker/image_picker.dart';

class ImageGallery extends StatefulWidget {
  ImageGallery({Key? key}) : super(key: key);

  @override
  _ImageGalleryState createState() => _ImageGalleryState();
}

class _ImageGalleryState extends State<ImageGallery> {
  File? _image;
  final picker = ImagePicker();

  // Future getgallaryImage() async {
  //   final pickedFile = await picker.getImage(source: ImageSource.gallery);

  //   setState(() {
  //     if (pickedFile != null) {
  //       _image = File(pickedFile.path);
  //     } else {
  //       print('No image selected.');
  //     }
  //   });
  //   Navigator.of(context).pop();
  // }

  Future getcamImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.camera);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
    Navigator.of(context).pop();
  }

  // Future<void> _showChoiceDialog(BuildContext context) {
  // return showDialog(
  //     context: context,
  //     builder: (BuildContext context) {
  //       return AlertDialog(
  //         title: Text("Make a Choice!"),
  //         content: SingleChildScrollView(
  //             child: ListBody(
  //           children: <Widget>[
  //             GestureDetector(
  //               child: Text("Camera"),
  //               onTap: () {
  //                 getcamImage();
  //               },
  //             ),
  //             // Padding(padding: EdgeInsets.all(8.0)),
  //             // GestureDetector(
  //             //   child: Text("Gallery"),
  //             //   onTap: () {
  //             //     getgallaryImage();
  //             //   },
  //             // ),
  //           ],
  //         )),
  //       );
  //     });
  // }

  @override
  Widget build(BuildContext context) {
    var sizeHeight = MediaQuery.of(context).size.height;
    var sizeWidth = MediaQuery.of(context).size.width;
    var bottom = kBottomNavigationBarHeight;
    var floatingActionButton;
    return Scaffold(
      backgroundColor: Colors.teal,
      body: Container(
        child: Column(
          children: [
            Container(
              height: ((sizeHeight - bottom) * 0.15),
              width: sizeWidth,
              child: Center(
                child: Container(
                  height: ((sizeHeight - bottom) * 0.15) * 0.5,
                  width: sizeWidth,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(40),
                      ),
                      color: Colors.white),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 18.0),
                        child: IconButton(
                          icon: Icon(
                            Icons.arrow_back_ios,
                          ),
                          iconSize: 20,
                          color: Colors.teal,
                          splashColor: Colors.tealAccent,
                          onPressed: () {
                            Navigator.pushReplacement(
                                context,
                                new MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        new HomeScreen()));
                          },
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        'Image Gallery',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Colors.teal),
                      )
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  // image: DecorationImage(
                  //   image: AssetImage("assets/matrimony.jpeg"),
                  //   fit: BoxFit.cover,
                  // ),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30)),
                ),
                height: sizeHeight * 0.74,
                width: sizeWidth,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(height: 20),
                      Text(
                        "Your Gallery Photos",
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.teal,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        width: 350,
                        height: 55,
                        child: TextFormField(

                            // controller: username,
                            decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                // contentPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(30.0)),
                                  borderSide: BorderSide(
                                      color: Colors.grey.shade300, width: 4),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(40.0)),
                                  borderSide: BorderSide(
                                      color: Colors.grey.shade300, width: 34),
                                ),
                                hintText: "    Search Photos",
                                prefixIcon: Icon(Icons.search),
                                hintStyle: TextStyle(
                                  color: Colors.teal,
                                  fontSize: 18,

                                  // fontWeight: FontWeight.bold,
                                ))),
                      ),
                      // SizedBox(
                      //   height: 10,
                      // ),
                      Image(
                        image: AssetImage("assets/image.png"),
                      ),
                      Text(
                        "You don't have any photos yet",
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.teal,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: InkWell(
                          onTap: () {
                            getcamImage();
                          },
                          child: Icon(
                            Icons.camera_alt,
                            size: 30,
                          ),
                        ),
                      ),

                      Center(
                        child: _image == null
                            ? Text('No image selected.')
                            : Image.file(
                                _image!,
                                height: 50,
                                width: 50,
                              ),
                      ),
                      //     floatingActionButton:FloatingActionButton(
                      //   onPressed: () {
                      //     _showChoiceDialog(context);
                      //   },
                      //   tooltip: 'Pick Image',
                      //   child: Icon(Icons.add_a_photo),
                      // ),
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
