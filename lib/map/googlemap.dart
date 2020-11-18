import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class GoogleMapSdk extends StatefulWidget {
  @override
  _GoogleMapSdkState createState() => _GoogleMapSdkState();
}

class _GoogleMapSdkState extends State<GoogleMapSdk> {
  Completer<GoogleMapController> _controller = Completer();

  static const LatLng _center = const LatLng(45.521563, -122.677433);

  final Set<Marker> _markers = {};

  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _markers.add(Marker(
        markerId: MarkerId(_center.toString()),
        position: _center,
        infoWindow:
            InfoWindow(title: "this is title", snippet: "This is snippt")));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Google Map"),
      ),
      body: Container(
        child: Column(
          children: [
            Center(
              child: Container(
                child: Material(
                  child: InkWell(
                      onTap: () {
                        bottoSheet(context);
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            vertical: 15.0, horizontal: 25.0),
                        child: Text(
                          "BottomSheet",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      splashColor: Colors.amber[400],
                      borderRadius: BorderRadius.circular(8.0)),
                  color: Colors.transparent,
                ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    color: Colors.amber),
              ),
            )
          ],
        ),
      ),
    );
  }

  void bottoSheet(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (builder) {
          return Container(
              height: MediaQuery.of(context).size.height * 0.5,
              decoration: BoxDecoration(
                  color: Color(0xFF737373),
                  borderRadius: BorderRadius.only(
                    topLeft: const Radius.circular(25.0),
                    topRight: const Radius.circular(25.0),
                  )), //could change this to Color(0xFF737373),
              //so you don't have to change MaterialApp canvasColor
              child: Container(
                padding: EdgeInsets.only(top: 25.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: const Radius.circular(25.0),
                    topRight: const Radius.circular(25.0),
                  ),
                ),
                child: GoogleMap(
                  mapType: MapType.normal,
                  onMapCreated: _onMapCreated,
                  initialCameraPosition: CameraPosition(
                    target: _center,
                    zoom: 11.0,
                  ),
                  markers: _markers,
                  mapToolbarEnabled: true,
                  myLocationButtonEnabled: true,
                  onTap: (argument) {
                    print(argument);
                    setState(() {
                      _markers.add(Marker(
                          markerId: MarkerId(argument.toString()),
                          position: argument,
                          infoWindow: InfoWindow(
                              title: "this is title",
                              snippet: "This is snippt")));
                    });
                  },
                ),
              ));
        });
  }
}
