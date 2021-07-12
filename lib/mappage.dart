import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:permission_handler/permission_handler.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geocoder/geocoder.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  GoogleMapController? mapController; //contrller for Google map
  final Set<Marker> markers = new Set(); //markers for google map
  static const LatLng showLocation =
      const LatLng(9.9380112, 78.16794); //location to show in map
  var _id;
  bool isMapCreated = true;
  var latlong = null;
  var _cameraPosition;
  var _controller;
  Set<Marker> _markers = {};

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
    // map();
    print(_address);
    print("41 line");
  }

  map() async {
    SharedPreferences prefer = await SharedPreferences.getInstance();
    _id = prefer.getStringList('idS');

    print(_id[0]);

    // print(position.latitude);
    // print(313);
    String url = 'http://d7b38844ee7e.ngrok.io/parampara/location';
    // var id  "jsfhg";
    final response = await http.post(Uri.parse(url), body: {
      "id": _id[0].toString(),
      "latitude": latitudeSet.toString(),
      "longnitude": longitudeSet.toString(),
      "address": _address.toString(),
      "district": _district.toString(),
      "state": _state.toString(),
      "country": _country.toString(),
      "pin_code": _pincode.toString()
    });
    // print(_id);
    print(_address);
    print(_district);
    print(response.body);
    print("hello");
    print("sjhg");

    // print(position.latitude);
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

  Widget build(BuildContext context) {
    if (isMapCreated) {
      changeMapMode();
      if (getCurrentAddress() != null) {
        map();
      }
    }
    return Scaffold(
      body: GoogleMap(
        //Map widget from google_maps_flutter package
        zoomGesturesEnabled: true, //enable Zoom in, out on map
        initialCameraPosition: CameraPosition(
          //innital position in map
          target: showLocation, //initial position
          zoom: 15.0, //initial zoom level
        ),
        markers: getmarkers(), //markers to show on map
        mapType: MapType.normal, //map type
        onMapCreated: (GoogleMapController controller) {
          _controller = (controller);
          _controller
              .animateCamera(CameraUpdate.newCameraPosition(_cameraPosition));

          changeMapMode();
          isMapCreated = true;
        },
      ),
    );
  }

  Set<Marker> getmarkers() {
    getLocation(); //position of marker
    print(position);
    print(124);
    //markers to place on map
    setState(() {
      markers.add(Marker(
        //add first marker
        markerId: MarkerId(showLocation.toString()),
        position: showLocation,
        //position of marker
        infoWindow: InfoWindow(
          //popup info
          title: 'Madurai ',
          snippet: 'ElcotITPark',
        ),
        icon: BitmapDescriptor.defaultMarker, //Icon for Marker
      ));

      markers.add(Marker(
        //add second marker
        markerId: MarkerId(showLocation.toString()),
        position: LatLng(9.9159, 78.111),
        infoWindow: InfoWindow(
          //popup info
          title: 'Madurai',
          snippet: 'Periyar Bus stand',
        ),
        icon: BitmapDescriptor.defaultMarker,
        //Icon for Marker
      ));

      markers.add(Marker(
        //add third marker
        markerId: MarkerId(showLocation.toString()),
        position: LatLng(9.9449, 78.1557), //position of marker
        infoWindow: InfoWindow(
          //popup info
          title: 'Madurai',
          snippet: 'Mattuthavani Bus Stand ',
        ),
        icon: BitmapDescriptor.defaultMarker, //Icon for Marker
      ));

      //add more markers here
    });

    return markers;
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
            print(latlong);
          }));
    });
    // print("hi");
    // getCurrentAddress();
    // print("hello");
  }

  var _address, _pincode, _district, _state, _country;
  getCurrentAddress() async {
    print("getcurrentaddress");
    print(latlong);
    print(158);
    final coordinates = new Coordinates(latlong.latitude, latlong.longitude);
    results = await Geocoder.local.findAddressesFromCoordinates(coordinates);
    var first = results.first;
    if (first != null) {
      _address = " ${first.locality}";
      print(_address);
      print(165);
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
