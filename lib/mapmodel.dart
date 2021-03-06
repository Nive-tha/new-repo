import 'package:flutter/material.dart';
import 'package:geocoder/geocoder.dart';
import 'dart:async';

import 'package:google_maps_flutter/google_maps_flutter.dart';

const kGoogleApiKey = "API_KEY";

class BspAddressmapscreen extends StatefulWidget {
  // BspAddressmapscreen({required Key key}) : super(key: key);

  @override
  _BspAddressmapscreenState createState() => _BspAddressmapscreenState();
}

class _BspAddressmapscreenState extends State<BspAddressmapscreen> {
  final homeScaffoldKey = GlobalKey<ScaffoldState>();
  Completer<GoogleMapController> _controller = Completer();

  @override
  void initState() {
    super.initState();
  }

  double zoomVal = 5.0;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {
              /*NavigationHelper.navigatetoBack(context);*/
            }),
        centerTitle: true,
        title: Text("Business Address Detail"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
        ],
      ),
      bottomNavigationBar: Container(
        color: Colors.transparent,
        height: 56,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            new FlatButton.icon(
              icon: Icon(Icons.arrow_back_ios),
              label: Text('Show Address'),
              textColor: Colors.blue,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(7),
              ),
              onPressed: () {
                getUserLocation();
              },
            ),
          ],
        ),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Stack(
          children: <Widget>[
            _searchbar(),
            _buildGoogleMap(context),
            // _zoomminusfunction(),
            // _zoomplusfunction(),
          ],
        ),
      ),
    );
  }

  getUserLocation() async {
    markers.values.forEach((value) async {
      print(value.position);
      // From coordinates
      final coordinates =
          new Coordinates(value.position.latitude, value.position.longitude);
      var addresses = await Geocoder.google(kGoogleApiKey)
          .findAddressesFromCoordinates(coordinates);

      print("Address: ${addresses.first.featureName}");
      print("Address: ${addresses.first.adminArea}");
    });
  }

  Future<void> _minus(double zoomVal) async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(target: LatLng(40.712776, -74.005974), zoom: zoomVal)));
  }

  Future<void> _plus(double zoomVal) async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(target: LatLng(40.712776, -74.005974), zoom: zoomVal)));
  }

  Map<MarkerId, Marker> markers = <MarkerId, Marker>{};

  Widget _buildGoogleMap(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition:
            CameraPosition(target: LatLng(40.712776, -74.005974), zoom: 12),
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
        markers: Set<Marker>.of(markers.values),
        onLongPress: (LatLng latLng) {
          // creating a new MARKER

          final MarkerId markerId = MarkerId('4544');
          final Marker marker = Marker(
            markerId: markerId,
            position: latLng,
          );

          setState(() {
            markers.clear();
            // adding a new marker to map
            markers[markerId] = marker;
          });
        },
      ),
    );
  }

  Widget _searchbar() {
    return Positioned(
      top: 50.0,
      right: 15.0,
      left: 15.0,
      child: Container(
        height: 50.0,
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0), color: Colors.white),
        child: TextField(
          decoration: InputDecoration(
            hintText: 'Enter Address',
            border: InputBorder.none,
            contentPadding: EdgeInsets.only(left: 15.0, top: 15.0),
            suffixIcon: IconButton(
              icon: Icon(Icons.search),
              //onPressed: searchandNavigate,
              onPressed: () {},
              iconSize: 30.0,
            ),
          ),
          onChanged: (val) {
            setState(() {
              // searchAddr = val;
            });
          },
        ),
      ),
    );
  }
}
