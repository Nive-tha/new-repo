// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:http/http.dart' as http;

// class Log extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: MyPickImageScreen(),
//     );
//   }
// }

// class MyPickImageScreen extends StatefulWidget {
//   // MyPickImageScreen({Key key, this.title}) : super(key: key);

//   // late final String title;

//   @override
//   _MyPickImageScreenState createState() => _MyPickImageScreenState();
// }

// class _MyPickImageScreenState extends State<MyPickImageScreen> {
//   File? _file;
//   String num = "125";

//   final imgPicker = ImagePicker();
//   api(_file) async {
//     final String url = "http://a0d7c1252d2d.ngrok.io/store-image";
//     var request = new http.MultipartRequest("POST", Uri.parse(url));
//     request.fields['id'] = num;

//     request.files.add(await http.MultipartFile.fromPath('sampleFile', _file));
//   }

//   Future<void> showOptionsDialog(BuildContext context) {
//     return showDialog(
//         context: context,
//         builder: (BuildContext context) {
//           return AlertDialog(
//             title: Text("Options"),
//             content: SingleChildScrollView(
//               child: ListBody(
//                 children: [
//                   GestureDetector(
//                     child: Text("Capture Image From Camera"),
//                     onTap: () {
//                       openCamera();
//                     },
//                   ),
//                   Padding(padding: EdgeInsets.all(10)),
//                   GestureDetector(
//                     child: Text("Take Image From Gallery"),
//                     onTap: () {
//                       openGallery();
//                     },
//                   ),
//                 ],
//               ),
//             ),
//           );
//         });
//   }

//   void openCamera() async {
//     var imgCamera = await imgPicker.getImage(source: ImageSource.camera);
//     setState(() {
//       _file = File(imgCamera!.path);
//     });
//     print(_file);
//     Navigator.of(context).pop();
//   }

//   void openGallery() async {
//     var imgGallery = await imgPicker.getImage(source: ImageSource.gallery);
//     setState(() {
//       _file = File(imgGallery!.path);
//     });
//     print(_file);

//     Navigator.of(context).pop();
//   }

//   Widget displayImage() {
//     if (_file == null) {
//       return Text("No Image Selected!");
//     } else {
//       return Image.file(_file!, width: 350, height: 350);
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//           // title: Text(),
//           ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             displayImage(),
//             SizedBox(height: 30),
//             // ElevatedButton(
//             //     onPressed: () {
//             //       api(_file);
//             //     },
//             //     child: Text('submit')),
//             ElevatedButton(
//               onPressed: () {
//                 showOptionsDialog(context);
//               },
//               child: Text("Select Image"),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
