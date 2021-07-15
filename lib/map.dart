
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

   setMapStyle(String mapStyle) {
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
    var url = Uri.parse('https://www.cviacserver.tk/parampara/parampara/location');
    var url1 =
        Uri.parse('https://www.cviacserver.tk/parampara/locations/nearFamilyMembers');
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
      infoWindow: InfoWindow(title: "ElcotITPark"),
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
