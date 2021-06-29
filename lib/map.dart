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
    String url = 'http://71026514a79e.ngrok.io/parampara/location';
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
