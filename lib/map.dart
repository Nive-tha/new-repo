import 'dart:async';

import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:geocoder/geocoder.dart';
import 'package:intl/intl.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'map.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyLocation(),
    );
  }
}

class MyLocation extends StatefulWidget {
  @override
  _MyLocationState createState() => _MyLocationState();
}

class _MyLocationState extends State<MyLocation> {
  var _currentPosition;
  var _address, _district, _state, _country;
  var _pincode;
  var mapController;
  var marker;
  Location location = Location();
  var _id = 989;
  var _controller;
  LatLng _initialcameraposition = LatLng(0.5937, 0.9629);
  // final _id = TextEditingController();
  // final String a = _id.text;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getLoc();
  }

  void _onMapCreated(GoogleMapController _cntlr) {
    _controller = _controller;
    location.onLocationChanged.listen((l) {
      _controller.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(target: LatLng(l.latitude!, l.longitude!), zoom: 15),
        ),
      );
    });
  }

  // fun() {
  //   print(_id.runtimeType);
  //   print(_currentPosition.latitude.runtimeType);
  // }
  // save() async {
  //   SharedPreferences get = await SharedPreferences.getInstance();
  //   get.setStringList('a', _id);
  // }

  map() async {
    String url = 'http://ae53595c09a2.ngrok.io/parampara/location';
    final response = await http.post(Uri.parse(url), body: {
      "id": _id.toString(),
      "latitude": _currentPosition.latitude.toString(),
      "longnitude": _currentPosition.longitude.toString(),
      "address": _address.toString(),
      "district": _district.toString(),
      "state": _state.toString(),
      "country": _country.toString(),
      "pin_code": _pincode.toString()
    });
    print(_id);
    print(response.body);

    // var convertedDatatoJson = jsonDecode(response.body);
    // return convertedDatatoJson;
  }

  // id() {
  //   print("hello");
  //   print(_id.hashCode.runtimeType);
  //   print(_currentPosition.latitude.hashCode.runtimeType);
  //   print(_currentPosition.longitude.hashCode.runtimeType);

  //   print(_address.toString().runtimeType);
  //   print(_district.toString().runtimeType);
  //   print(_state.toString().runtimeType);
  //   print(_country.toString().runtimeType);
  //   print(_pincode.hashCode.runtimeType);
  //   print("hello");
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // decoration: BoxDecoration(
        //   image: DecorationImage(
        //       image: AssetImage('assets/images/bg.jpg'), fit: BoxFit.cover),
        // ),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SafeArea(
          child: Container(
            color: Colors.blueGrey.withOpacity(.8),
            child: Center(
              child: Column(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height / 2.5,
                    width: MediaQuery.of(context).size.width,
                    child: GoogleMap(
                      initialCameraPosition: CameraPosition(
                          target: _initialcameraposition, zoom: 15),
                      mapType: MapType.normal,
                      onMapCreated: _onMapCreated,
                      myLocationEnabled: true,
                    ),
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  // if (_dateTime != null)
                  //   Text(
                  //     "Date/Time: $_dateTime",
                  //     style: TextStyle(
                  //       fontSize: 15,
                  //       color: Colors.white,
                  //     ),
                  //   ),
                  // TextField(
                  //   controller: _id,
                  //   decoration: InputDecoration(
                  //       border: InputBorder.none,
                  //       hintText: "Id:265",
                  //       hintStyle: TextStyle(
                  //           fontSize: 22,
                  //           color: Colors.white,
                  //           fontWeight: FontWeight.bold)),
                  // ),
                  // Text('$_id:ID:265'),
                  Text(
                    "Id: $_id",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  if (_currentPosition != null)
                    Text(
                      "Latitude: ${_currentPosition.latitude}, Longitude: ${_currentPosition.latitude}",
                      style: TextStyle(
                          fontSize: 22,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  SizedBox(
                    height: 3,
                  ),
                  if (_address != null)
                    Text(
                      "Address: $_address",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  SizedBox(
                    height: 3,
                  ),
                  if (_pincode != null)
                    Text(
                      "Pincode: $_pincode",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  SizedBox(
                    height: 3,
                  ),
                  if (_district != null)
                    Text(
                      "District: $_district",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  SizedBox(
                    height: 3,
                  ),
                  if (_state != null)
                    Text(
                      "State: $_state",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  SizedBox(
                    height: 3,
                  ),
                  if (_country != null)
                    Text(
                      "Country: $_country",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ElevatedButton(
                      onPressed: () {
                        map();
                      },
                      child: Text("Submit"))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  getLoc() async {
    bool _serviceEnabled;
    PermissionStatus _permissionGranted;
    // print(_id);
    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    _currentPosition = await location.getLocation();
    _initialcameraposition =
        LatLng(_currentPosition.latitude!, _currentPosition.longitude!);
    location.onLocationChanged.listen((LocationData currentLocation) {
      print(
          "${currentLocation.longitude.hashCode} : ${currentLocation.longitude.hashCode}");
      setState(() {
        _currentPosition = currentLocation;
        _initialcameraposition =
            LatLng(_currentPosition.latitude!, _currentPosition.longitude!);

        DateTime now = DateTime.now();
        print(_currentPosition.latitude.hashCode);
        print(_currentPosition.longitude.hashCode.runtimeType);
        print(_currentPosition.latitude.hashCode.runtimeType);
        print(_currentPosition.runtimeType);
        print(321);
        // _dateTime = DateFormat('EEE d MMM kk:mm:ss ').format(now);
        _getAddress(_currentPosition.latitude!, _currentPosition.longitude!)
            .then((value) {
          setState(() {
            _address = "${value.first.locality}";
            _pincode = "${value.first.postalCode}";
            _district = "${value.first.subAdminArea}";
            _state = "${value.first.adminArea}";
            _country = "${value.first.countryName}";
          });
        });
      });
    });
  }

  Future<List<Address>> _getAddress(double lat, double lang) async {
    final coordinates = new Coordinates(lat, lang);
    List<Address> add =
        await Geocoder.local.findAddressesFromCoordinates(coordinates);
    return add;
  }

  // DateFormat(String s) {}
}
