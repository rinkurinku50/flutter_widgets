import 'dart:async';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class CustomMarker extends StatefulWidget {
  @override
  _CustomMarkerState createState() => _CustomMarkerState();
}

class _CustomMarkerState extends State<CustomMarker> {
  BitmapDescriptor pinLocationIcon;
  Set<Marker> _markers={};

  Completer<GoogleMapController> _controller = Completer();


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
     createMarker();
    _markers.add(
        Marker(
            markerId: MarkerId('1'),
            position: LatLng(37.3797536, -122.1017334),
            icon:pinLocationIcon
        )
    );
  }

  createMarker() {
    if (pinLocationIcon == null) {
      BitmapDescriptor.fromAssetImage(ImageConfiguration(size: Size(18,18)), 'assets/markericon.png')
          .then((icon) {
            print("rinku");

            setState(() {
              pinLocationIcon=icon;
            });
      });
    }
  }



  @override
  Widget build(BuildContext context) {
    createMarker();
    LatLng pinPosition = LatLng(37.3797536, -122.1017334);
    CameraPosition _initialposition =
        CameraPosition(zoom: 16, bearing: 30, target: pinPosition);




    return Scaffold(
      appBar: AppBar(
        title: Text('Custom Marker'),
      ),
      body: Container(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Custom Marker ',
                  style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ],
            ),
            Expanded(
              child: Container(
                child: GoogleMap(
                  myLocationEnabled: true,
                  markers: _markers,
                  onTap: (argument) {
                    setState(() {
                      _markers.add(
                          Marker(
                              markerId: MarkerId('1'),
                              position: argument,
                              icon:pinLocationIcon
                          )
                      );
                    });
                  },
                  initialCameraPosition: _initialposition,
                  onMapCreated: (GoogleMapController controller) {

                    _controller.complete(controller);


                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
