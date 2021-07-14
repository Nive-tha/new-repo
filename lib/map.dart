<<<<<<< HEAD
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'dart:async';
=======

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoder/geocoder.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
>>>>>>> Malathy
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

<<<<<<< HEAD
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
=======
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
>>>>>>> Malathy
  @override
  void initState() {
    super.initState();
<<<<<<< HEAD
    _cameraPosition = CameraPosition(target: LatLng(0, 0), zoom: 10.0);
    getCurrentLocation();
    getCurrentAddress();
  }

  map() async {
    // print(position.latitude);
    // print(313);
    String url = 'http://bdb62dc1e609.ngrok.io/parampara/location';
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
=======
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
>>>>>>> Malathy
  }

  @override
  Widget build(BuildContext context) {
    if (isMapCreated) {
      changeMapMode();
<<<<<<< HEAD
      if (getCurrentAddress() != null) {
        map();
      }
      // if (getLocation() != null) {
      //   map();
      // }
    }

    // TODO: implement build
    return SafeArea(
        child: Container(
      child: Stack(
        children: [
          // (latlong != null)
          GoogleMap(
            initialCameraPosition: _cameraPosition,
            onMapCreated: (GoogleMapController controller) {
              _controller = (controller);
              _controller.animateCamera(
                  CameraUpdate.newCameraPosition(_cameraPosition));

              changeMapMode();
              isMapCreated = true;
            },
            markers: _markers,
          )
        ],
      ),
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
=======
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
>>>>>>> Malathy
  }
}
