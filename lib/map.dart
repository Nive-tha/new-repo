// import 'dart:async';

// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:location/location.dart';
// import 'package:geocoder/geocoder.dart';
// import 'package:intl/intl.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:http/http.dart' as http;
// import 'package:shared_preferences/shared_preferences.dart';
// import 'map.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: MyLocation(),
//     );
//   }
// }

// class MyLocation extends StatefulWidget {
//   @override
//   _MyLocationState createState() => _MyLocationState();
// }

// class _MyLocationState extends State<MyLocation> {
//   var _currentPosition;
//   var _address, _district, _state, _country;
//   var _pincode;
//   var mapController;
//   var marker;
//   Location location = Location();
//   var _id = 989;
//   var _controller;
//   LatLng _initialcameraposition = LatLng(0.5937, 0.9629);

//   // final _id = TextEditingController();
//   // final String a = _id.text;
//   bool isMapCreated = false;
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();

//     getLoc();
//     map();
//   }

//   map() async {
//     String url = 'http://8d11647acb1b.ngrok.io/parampara/location';
//     final response = await http.post(Uri.parse(url), body: {
//       "id": _id.toString(),
//       "latitude": 696840.toString(),
//       "longnitude": 945840589.toString(),
//       "address": _address.toString(),
//       "district": _district.toString(),
//       "state": _state.toString(),
//       "country": _country.toString(),
//       "pin_code": _pincode.toString()
//     });
//     print(_id);
//     print(response.body);
//     print("hello");
//     print("sjhg");
//   }

//   changeMapMode() {
//     getJsonFile("assets/dark.json").then(setMapStyle);
//     print("sdgsdgsd");
//     print("sghjgdg");
//   }

//   Future<String> getJsonFile(String path) async {
//     return await rootBundle.loadString(path);
//   }

//   void setMapStyle(String mapStyle) {
//     _controller.setMapStyle(mapStyle);
//   }

//   @override
//   Widget build(BuildContext context) {
//     if (isMapCreated) {
//       changeMapMode();
//     }
//     return Scaffold(
//       body: Container(
//         height: MediaQuery.of(context).size.height,
//         width: MediaQuery.of(context).size.width,
//         child: Container(
//           child: Column(
//             children: [
//               Container(
//                 height: MediaQuery.of(context).size.height * 1,
//                 width: MediaQuery.of(context).size.width,
//                 child: GoogleMap(
//                   initialCameraPosition:
//                       CameraPosition(target: _initialcameraposition),
//                   mapType: MapType.normal,
//                   onMapCreated: (GoogleMapController controller) {
//                     _controller = (controller);

//                     changeMapMode();
//                     isMapCreated = true;
//                   },
//                   myLocationEnabled: true,
//                 ),
//               ),
//               // SizedBox(
//               //   height: 3,
//               // ),
//               // if (_dateTime != null)
//               //   Text(
//               //     "Date/Time: $_dateTime",
//               //     style: TextStyle(
//               //       fontSize: 15,
//               //       color: Colors.white,
//               //     ),
//               //   ),
//               // TextField(
//               //   controller: _id,
//               //   decoration: InputDecoration(
//               //       border: InputBorder.none,
//               //       hintText: "Id:265",
//               //       hintStyle: TextStyle(
//               //           fontSize: 22,
//               //           color: Colors.white,
//               //           fontWeight: FontWeight.bold)),
//               // ),
//               // Text('$_id:ID:265'),
//               // Text(
//               //   "Id: $_id",
//               //   style: TextStyle(
//               //     fontSize: 16,
//               //     color: Colors.white,
//               //   ),
//               // ),
//               // SizedBox(
//               //   height: 3,
//               // ),
//               // if (_currentPosition != null)
//               //   Text(
//               //     "Latitude: ${_currentPosition.latitude}, Longitude: ${_currentPosition.latitude}",
//               //     style: TextStyle(
//               //         fontSize: 22,
//               //         color: Colors.white,
//               //         fontWeight: FontWeight.bold),
//               //   ),
//               // SizedBox(
//               //   height: 3,
//               // ),
//               // if (_address != null)
//               //   Text(
//               //     "Address: $_address",
//               //     style: TextStyle(
//               //       fontSize: 16,
//               //       color: Colors.white,
//               //     ),
//               //   ),
//               // SizedBox(
//               //   height: 3,
//               // ),
//               // if (_pincode != null)
//               //   Text(
//               //     "Pincode: $_pincode",
//               //     style: TextStyle(
//               //       fontSize: 16,
//               //       color: Colors.white,
//               //     ),
//               //   ),
//               // SizedBox(
//               //   height: 3,
//               // ),
//               // if (_district != null)
//               //   Text(
//               //     "District: $_district",
//               //     style: TextStyle(
//               //       fontSize: 16,
//               //       color: Colors.white,
//               //     ),
//               //   ),
//               // SizedBox(
//               //   height: 3,
//               // ),
//               // if (_state != null)
//               //   Text(
//               //     "State: $_state",
//               //     style: TextStyle(
//               //       fontSize: 16,
//               //       color: Colors.white,
//               //     ),
//               //   ),
//               // SizedBox(
//               //   height: 3,
//               // ),
//               // if (_country != null)
//               //   Text(
//               //     "Country: $_country",
//               //     style: TextStyle(
//               //       fontSize: 16,
//               //       color: Colors.white,
//               //     ),
//               //   ),
//               // ElevatedButton(
//               //     onPressed: () {
//               //       map();
//               //     },
//               //     child: Text("Submit"))
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   getLoc() async {
//     bool _serviceEnabled = true;
//     PermissionStatus _permissionGranted;
//     // print(_id);
//     _serviceEnabled = await location.serviceEnabled();
//     if (!_serviceEnabled) {
//       _serviceEnabled = await location.requestService();
//       if (_serviceEnabled) {
//         return;
//       }
//     }

//     _permissionGranted = await location.hasPermission();
//     if (_permissionGranted == PermissionStatus.denied) {
//       _permissionGranted = await location.requestPermission();
//       if (_permissionGranted == PermissionStatus.granted) {
//         return;
//       }
//     }

//     _currentPosition = await location.getLocation();
//     _initialcameraposition =
//         LatLng(_currentPosition.latitude, _currentPosition.longitude);
//     location.onLocationChanged.listen((LocationData currentLocation) {
//       print(
//           "${currentLocation.longitude.hashCode} : ${currentLocation.longitude.hashCode}");
//       setState(() {
//         _currentPosition = currentLocation;
//         _initialcameraposition =
//             LatLng(_currentPosition.latitude, _currentPosition.longitude);
//         // _dateTime = DateFormat('EEE d MMM kk:mm:ss ').format(now);
//         _getAddress(_currentPosition.latitude, _currentPosition.longitude)
//             .then((value) {
//           setState(() {
//             _address = "${value.first.locality}";
//             _pincode = "${value.first.postalCode}";
//             _district = "${value.first.subAdminArea}";
//             _state = "${value.first.adminArea}";
//             _country = "${value.first.countryName}";
//           });
//         });
//       });
//     });
//   }

//   Future<List<Address>> _getAddress(double lat, double lang) async {
//     final coordinates = new Coordinates(lat, lang);
//     List<Address> add =
//         await Geocoder.local.findAddressesFromCoordinates(coordinates);
//     return add;
//   }

//   // DateFormat(String s) {}
// }
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:permission_handler/permission_handler.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geocoder/geocoder.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyLocation extends StatefulWidget {
  @override
  MyLocationState createState() {
    return MyLocationState();
  }
}

class MyLocationState extends State {
  bool isMapCreated = true;
  var latlong = null;
  var _cameraPosition;
  var _controller;
  Set<Marker> _markers = {};
  var _id = 8476;
  var position;
  var latitudeSet;
  var longitudeSet;
  var originalIdFromSharedPreference;
  TextEditingController locationController = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _cameraPosition = CameraPosition(target: LatLng(0, 0), zoom: 10.0);
    getCurrentLocation();
    getCurrentAddress();
  }

  map() async {
    // print(position.latitude);
    // print(313);
    String url = 'http://8d4bba7d1b46.ngrok.io/parampara/location';
    final response = await http.post(Uri.parse(url), body: {
      "id": _id.toString(),
      "latitude": latitudeSet.toString(),
      "longnitude": longitudeSet.toString(),
      "address": _address.toString(),
      "district": _district.toString(),
      "state": _state.toString(),
      "country": _country.toString(),
      "pin_code": _pincode.toString()
    });
    print(_id);
    print(_address);
    print(_district);
    print(response.body);
    print("hello");
    print("sjhg");
    print(position.latitude);
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

  @override
  Widget build(BuildContext context) {
    if (isMapCreated) {
      changeMapMode();
      if (getCurrentAddress() != null) {
        map();
      }
      // if (getLocation() != null) {
      //   map();
      // }
    }

    // TODO: implement build
    return SafeArea(
        child: Stack(
      children: [
        // (latlong != null)
        GoogleMap(
          initialCameraPosition: _cameraPosition,
          onMapCreated: (GoogleMapController controller) {
            _controller = (controller);
            _controller
                .animateCamera(CameraUpdate.newCameraPosition(_cameraPosition));

            changeMapMode();
            isMapCreated = true;
          },
          markers: _markers,
        )
      ],
    ));
  }

  Future getCurrentLocation() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission != PermissionStatus.granted) {
      LocationPermission permission = await Geolocator.requestPermission();
      if (permission != PermissionStatus.granted) getLocation();
      return;
    }
    getLocation();
    // if (getCurrentAddress() != null) {
    //   print("523line");
    //   map();
    // }
  }

  List<Address> results = [];
  getLocation() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    print(position.latitude);
    setState(() {
      latitudeSet = position.latitude;
      longitudeSet = position.longitude;
    });

    setState(() {
      latlong = new LatLng(position.latitude, position.longitude);
      _cameraPosition = CameraPosition(target: latlong, zoom: 10.0);
      if (_controller != null)
        _controller
            .animateCamera(CameraUpdate.newCameraPosition(_cameraPosition));

      _markers.add(Marker(
          markerId: MarkerId("a"),
          draggable: true,
          position: latlong,
          icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
          onDragEnd: (_currentlatLng) {
            latlong = _currentlatLng;
          }));
    });

    getCurrentAddress();
  }

  var _address, _pincode, _district, _state, _country;
  getCurrentAddress() async {
    final coordinates = new Coordinates(latlong.latitude, latlong.longitude);
    results = await Geocoder.local.findAddressesFromCoordinates(coordinates);
    var first = results.first;
    if (first != null) {
      _address = " ${first.locality}";
      print(_address);
      _pincode = "  ${first.postalCode}";
      print(_pincode);
      _district = "  ${first.subAdminArea}";
      print(_district);
      _state = "  ${first.adminArea}";
      print(_state);
      _country = "  ${first.countryName}";
      print(_country);
      // locationController.text = address;
    }
  }
}
