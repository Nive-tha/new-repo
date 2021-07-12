// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';

// import 'dart:async';
// import 'package:http/http.dart' as http;
// import 'package:permission_handler/permission_handler.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:geocoder/geocoder.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class MyLocation extends StatefulWidget {
//   @override
//   MyLocationState createState() {
//     return MyLocationState();
//   }
// }

// class MyLocationState extends State {
//   static const LatLng showLocation = const LatLng(9.9380112, 78.16794);
//   var _id;
//   bool isMapCreated = true;
//   var latlong = null;
//   var latlong1 = null;
//   var _cameraPosition;
//   var _controller;
//   Set<Marker> _markers = {};
//   final Set<Marker> markers = new Set(); //markers for google map
//   var position;
//   var latitudeSet;
//   var longitudeSet;
//   var originalIdFromSharedPreference;
//   var detail1;
//   var detail2;
//   TextEditingController locationController = TextEditingController();
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     _cameraPosition = CameraPosition(target: LatLng(0, 0), zoom: 40.0);
//     getCurrentLocation();
//     getCurrentAddress();
//     // map();
//     print(_address);
//     print("41 line");

//     if (isMapCreated && getCurrentAddress() != null && getLocation() != null) {
//       changeMapMode();
//       map();
//     }
//     map1();
//     print("yfjfvjjjjjjjjjjjjjjjfjjjjjjjj");
//   }

//   map() async {
//     SharedPreferences prefer = await SharedPreferences.getInstance();
//     _id = prefer.getStringList('idS');

//     print(_id[0]);

//     // print(position.latitude);
//     // print(313);
//     String url = 'http://2a0cafcf30b5.ngrok.io/parampara/location';
//     // var id  "jsfhg";
//     final response = await http.post(Uri.parse(url), body: {
//       "id": _id[0].toString(),
//       "latitude": latitudeSet.toString(),
//       "longnitude": longitudeSet.toString(),
//       "address": _address.toString(),
//       "district": _district.toString(),
//       "state": _state.toString(),
//       "country": _country.toString(),
//       "pin_code": _pincode.toString()
//     });
//     print(_id[0]);
//     print(76);
//     print(_address.toString());
//     print(_district.toString());
//     print(_state.toString());
//     print(_country.toString());
//     print(_pincode.toString());
//     print(response.body);
//     print("71line");

//     // print(position.latitude);
//   }

//   func() async {
//     var detail1, detail2;
//     var text1 = detail1;
//     print(text1);
//     print(226);
//     var text2 = detail2;
//     // var text3 = id;
//     List<String> stringList = [text1, text2];

//     SharedPreferences prefer = await SharedPreferences.getInstance();
//     await prefer.setStringList('a', stringList);
//   }

//   var latposi;
//   map1() async {
//     SharedPreferences prefer = await SharedPreferences.getInstance();
//     _id = prefer.getStringList('idS');

//     print(_id[0]);

//     String url = 'http://2a0cafcf30b5.ngrok.io/locations/nearFamilyMembers';
//     // var id  "jsfhg";
//     final response = await http.post(Uri.parse(url), body: {
//       "id": _id[0].toString(),
//     });
//     // print(_id);

//     print(response.body);
//     var responsedecode = json.decode(response.body);
//     print(responsedecode);
//     print(100);
//     // var detail = responsedecode['nearFamilyMembers'].latitude;
//     // print(detail);
//     print(104);
//     print("usgah");
//     setState(() {
//       detail1 = responsedecode['nearFamilyMembers'][0]['latitude'].toString();
//       detail2 = responsedecode['nearFamilyMembers'][0]['longnitude'].toString();
//     });

//     List<String> stringList = [detail1, detail2];
//     SharedPreferences prefer1 = await SharedPreferences.getInstance();
//     setState(() {
//       detail1 = responsedecode['nearFamilyMembers'][0]['latitude'].toString();
//       detail2 = responsedecode['nearFamilyMembers'][0]['longnitude'].toString();
//       var lat = prefer1.setStringList('latitude', stringList);
//       print(lat);
//       latposi = prefer1.getStringList('latitude');
//       print(latposi[0]);
//       print(latposi[1]);
//       print(detail1);
//     });

//     // print(position.latitude);
//   }

//   changeMapMode() {
//     getJsonFile("assets/dark.json").then(setMapStyle);
//   }

//   Future<String> getJsonFile(String path) async {
//     return await rootBundle.loadString(path);
//   }

//   void setMapStyle(String mapStyle) {
//     _controller.setMapStyle(mapStyle);
//   }

//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     return SafeArea(
//         child: Stack(
//       children: [
//         // (latlong != null)
//         GoogleMap(
//           initialCameraPosition: _cameraPosition,
//           onMapCreated: (GoogleMapController controller) {
//             _controller = (controller);
//             _controller
//                 .animateCamera(CameraUpdate.newCameraPosition(_cameraPosition));

//             changeMapMode();
//             isMapCreated = true;
//           },
//           markers: _markers,
//         )
//       ],
//     ));
//   }

//   Set<Marker> getmarkers() {
//     //markers to place on map
//     setState(() {
//       markers.add(Marker(
//         //add second marker
//         markerId: MarkerId("1"),
//         position: latlong,
//         infoWindow: InfoWindow(
//           //popup info
//           title: 'Madurai',
//           snippet: 'Periyar Bus stand',
//         ),
//         icon: BitmapDescriptor.defaultMarker,
//         //Icon for Marker
//       ));

//       markers.add(Marker(
//         //add third marker
//         markerId: MarkerId("2"),
//         position: LatLng(9.9449, 78.1557), //position of marker
//         infoWindow: InfoWindow(
//           //popup info
//           title: 'Madurai',
//           snippet: 'Mattuthavani Bus Stand ',
//         ),
//         icon: BitmapDescriptor.defaultMarker, //Icon for Marker
//       ));

//       //add more markers here
//     });

//     return markers;
//   }

//   Future getCurrentLocation() async {
//     LocationPermission permission = await Geolocator.checkPermission();
//     if (permission != PermissionStatus.granted) {
//       LocationPermission permission = await Geolocator.requestPermission();
//       if (permission != PermissionStatus.granted) getLocation();
//       return;
//     }
//     getLocation();
//     // if (getCurrentAddress() != null) {
//     //   print("523line");
//     //   map();
//     // }
//   }

//   List<Address> results = [];
//   getLocation() async {
//     Position position = await Geolocator.getCurrentPosition(
//         desiredAccuracy: LocationAccuracy.high);
//     print(position.latitude);
//     setState(() {
//       latitudeSet = position.latitude.toString();
//       longitudeSet = position.longitude.toString();
//     });

//     setState(() {
//       latlong = new LatLng(position.latitude, position.longitude);
//       _cameraPosition = CameraPosition(target: latlong, zoom: 10.0);
//       if (_controller != null)
//         _controller
//             .animateCamera(CameraUpdate.newCameraPosition(_cameraPosition));

//       _markers.add(Marker(
//           markerId: MarkerId("a"),
//           draggable: true,
//           position: latlong,
//           icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
//           onDragEnd: (_currentlatLng) {
//             latlong = _currentlatLng;
//             print(latlong);
//           }));
//     });
//     setState(() {
//       latlong1 = new LatLng(detail1, detail2);
//       // _cameraPosition = CameraPosition(target: latlong, zoom: 10.0);
//       // if (_controller != null)
//       //   _controller
//       //       .animateCamera(CameraUpdate.newCameraPosition(_cameraPosition));

//       _markers.add(Marker(
//         markerId: MarkerId("b"),
//         position: latlong1,
//         icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
//       ));
//     });
//     // print("hi");
//     // getCurrentAddress();
//     // print("hello");
//   }

//   var _address, _pincode, _district, _state, _country;
//   getCurrentAddress() async {
//     print("getcurrentaddress");
//     print(latlong);
//     print(158);
//     final coordinates = new Coordinates(latlong.latitude, latlong.longitude);
//     results = await Geocoder.local.findAddressesFromCoordinates(coordinates);
//     var first = results.first;
//     if (first != null) {
//       _address = " ${first.locality}".toString();
//       print(_address);
//       print(_address.toString().length);
//       print(165);
//       _pincode = "  ${first.postalCode}".toString();
//       print(_pincode);
//       _district = "  ${first.subAdminArea}".toString();
//       print(_district);
//       _state = "  ${first.adminArea}".toString();
//       print(_state);
//       _country = "  ${first.countryName}".toString();
//       print(_country);
//       // locationController.text = address;
//     }
//   }
// }
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoder/geocoder.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class MyLocation extends StatefulWidget {
  @override
  _MyLocationState createState() => _MyLocationState();
}

class _MyLocationState extends State<MyLocation> {
  GoogleMapController? mapController;
  Set<Marker> marker = {};
  bool isMapCreated = true;
  var address;
  var coordinates;
  var loca;
  var _id;
  var receivedLatitude;
  var receivedLongitude;
  var _controller;
  @override
  void initState() {
    super.initState();
    getLocation();
  }

  changeMapMode() {
    getJsonFile("assets/dark.json").then(setMapStyle);
  }

  Future<String> getJsonFile(String path) async {
    return await rootBundle.loadString(path);
  }

  void setMapStyle(String mapStyle) {
    _controller.setMapStyle(mapStyle);
  }

  getLocation() async {
    SharedPreferences prefer = await SharedPreferences.getInstance();
    _id = prefer.getStringList('idS');

    print(_id[0]);
    await Geolocator.getCurrentPosition().then((value) {
      setState(() {
        loca = value;
      });
    });
    print(loca);
    var coordinates = Coordinates(loca.latitude, loca.longitude);
    var address =
        await Geocoder.local.findAddressesFromCoordinates(coordinates);
    var url = Uri.parse('https://2a0cafcf30b5.ngrok.io/parampara/location');
    var url1 =
        Uri.parse('https://2a0cafcf30b5.ngrok.io/locations/nearFamilyMembers');
    var sending = await http.post(url, body: {
      "id": _id[0],
      "latitude": loca.latitude.toString(),
      "longnitude": loca.longitude.toString(),
      "address": address.first.subLocality.toString(),
      "district": address.first.subAdminArea.toString(),
      "state": address.first.adminArea.toString(),
      "country": address.first.countryName.toString(),
      "pin_code": address.first.postalCode.toString()
    });

    print(sending.statusCode);
    var sendingAgain = await http.post(url1, body: {
      "id": _id[0],
    });
    var information = json.decode(sendingAgain.body);
    receivedLatitude = information['nearFamilyMembers'][0]['latitude'];
    receivedLongitude = information['nearFamilyMembers'][0]['longnitude'];
    print(receivedLatitude);
    print(receivedLongitude);
    setState(() {
      marker.add(Marker(
        markerId: MarkerId("another area"),
        position: LatLng(receivedLatitude, receivedLongitude),
      ));
    });
  }

  myMarker() {
    marker.add(Marker(
      markerId: MarkerId("area"),
      position: LatLng(loca.latitude, loca.longitude),
      infoWindow: InfoWindow(title: "my area"),
    ));

    print(marker.length);
    return marker;
  }

  @override
  Widget build(BuildContext context) {
    if (isMapCreated) {
      changeMapMode();
    }
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: [
          loca == null
              ? Text(
                  'waiting',
                  style: TextStyle(
                    fontSize: 40,
                  ),
                )
              : Container(
                  height: height,
                  width: width,
                  child: GoogleMap(
                    initialCameraPosition: CameraPosition(
                      zoom: 15,
                      target: LatLng(loca.latitude, loca.longitude),
                    ),
                    onMapCreated: (controller) {
                      setState(() {
                        mapController = controller;
                      });
                    },
                    markers: myMarker(),
                  ),
                ),
        ],
      ),
    );
  }
}
