import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
// import 'package:location/location.dart';

const double CAMERA_ZOOM = 13;
const double CAMERA_TILT = 0;
const double CAMERA_BEARING = 30;
const LatLng SOURCE_LOCATION = LatLng(30.139412, 77.290126);
const LatLng DEST_LOCATION = LatLng(30.092207, 77.220064);

class DrawingRouteLine extends StatefulWidget {
  @override
  _DrawingRouteLineState createState() => _DrawingRouteLineState();
}

class _DrawingRouteLineState extends State<DrawingRouteLine> {
  // Completer<GoogleMapController> _completer =Completer();
  GoogleMapController _controller;
  double _originLatitude = 6.5212402, _originLongitude = 3.3679965;
  double _destLatitude = 6.849660, _destLongitude = 3.648190;
  Map<MarkerId, Marker> markers = {};
  Map<PolylineId, Polyline> polylines = {};
  List<LatLng> polylineCoordinates = [];
  PolylinePoints polylinePoints = PolylinePoints();
  String googleApiKey = "AIzaSyDW48aP23Ql8upkfet4J9uFeY3_QPkuGxQ";
  var sourceIcon;
  var destinationIcon;


  Position _currentPos;

  String _currentAddress;

  final startAddressController = TextEditingController();
  final destinationAddressController = TextEditingController();

  final startAddressFocusNode = FocusNode();
  final desrinationAddressFocusNode = FocusNode();

  String _startAddress = '';
  String _destinationAddress = '';
  String _placeDistance;
  
  var _geolocator=Geolocator();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    CameraPosition initialLocation = CameraPosition(
        target: SOURCE_LOCATION,
        zoom: CAMERA_ZOOM,
        bearing: CAMERA_BEARING,
        tilt: CAMERA_TILT);

    Widget textField(
        {TextEditingController controller,
        FocusNode focusNode,
        String label,
        String hint,
        double width,
        Icon prefixIcon,
        Widget suffixIcon,
        Function(String) locationCallBack}) {
      return Container(
        padding: EdgeInsets.all(20.0),
        child: TextFormField(
            controller: controller,
            focusNode: focusNode,
            decoration: InputDecoration(
              prefixIcon: prefixIcon,
              suffixIcon: suffixIcon,
              labelText: label,
              filled: true,
              fillColor: Colors.white,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0),),
                borderSide: BorderSide(
                  color: Colors.grey[400],
                  width: 2
                )
              ),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0),),
                  borderSide: BorderSide(
                      color: Colors.blue[300],
                      width: 2
                  )
              ),
                contentPadding: EdgeInsets.all(15.0),
                hintText: hint
            ),
            ),
      );
    }

    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Scaffold(
        appBar: AppBar(title: Text('Google Map'),),
        body: Stack(
          children: [
            GoogleMap(
              initialCameraPosition: initialLocation,
              myLocationEnabled: true,
              mapType: MapType.normal,
              zoomGesturesEnabled: true,
              zoomControlsEnabled: false,
              myLocationButtonEnabled: false,
              onMapCreated: _onMapCreate,
            ),
            Positioned(
              bottom: MediaQuery.of(context).size.height * 0.05,
              right: MediaQuery.of(context).size.width * 0.03,
              child: ClipOval(
                child: Material(
                  child: InkWell(
                    splashColor: Colors.orange,
                    child: SizedBox(
                      width: 56,
                      height: 56,
                      child: Icon(Icons.my_location),
                    ),
                    onTap: _getPosition,
                  ),
                ),
              ),
            ),
            Positioned(
              child: Column(
                children: [
                  Form(
                    child: Column(
                      children: [
                        textField(
                          controller: startAddressController,
                          focusNode: startAddressFocusNode,
                          label: 'Start',
                          hint: 'Choose Starting Point...',
                          prefixIcon: Icon(Icons.looks_one),
                          suffixIcon: IconButton(icon: Icon(Icons.my_location), onPressed: () {
                             _getPosition();
                          },),
                          width: MediaQuery.of(context).size.width,
                          locationCallBack: (value) {

                          },
                        )
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void setSourceAndDestinationIcons() async {
    sourceIcon = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(devicePixelRatio: 2.5), 'assets/driving_pin.png');
    destinationIcon = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(devicePixelRatio: 2.5), 'assets/markericon.png');
  }

  void _onMapCreate(GoogleMapController controller) {
    // _completer.complete(controller);
    _controller = controller;
  }

  //to get current location
  // void _getCurrentLocation() async {
  //   LocationData currentlocation;
  //   var location = Location();
  //   try {
  //     currentlocation = await location.getLocation();
  //   } catch (e) {
  //     currentlocation = null;
  //   }
  //   _controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
  //       target: LatLng(currentlocation.latitude, currentlocation.longitude),
  //       zoom: CAMERA_ZOOM,
  //       tilt: CAMERA_TILT,
  //       bearing: CAMERA_BEARING)));
  // }

  //to get current location
  _getPosition() async {
    await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then((value) {
      setState(() {
        _currentPos = value;
        print('Current Positon ${value}');
      });

      _controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
          target: LatLng(value.latitude, value.longitude),
          zoom: CAMERA_ZOOM,
          tilt: CAMERA_TILT,
          bearing: CAMERA_BEARING)));

    }).catchError((e) {
      print(e);
    });

    await _getAddress();
  }
  _getAddress() async {
    try {
      List<Placemark> p = await placemarkFromCoordinates(_currentPos.latitude, _currentPos.longitude);
      Placemark place=p[0];

      setState(() {

        _currentAddress = "${place.name}, ${place.locality},${place.administrativeArea} ${place.postalCode}, ${place.country}";
        startAddressController.text = _currentAddress;
        _startAddress =_currentAddress;
      });
    }catch(e) {
      print(e);
    }
  }
}


// const double CAMERA_ZOOM = 13;
// const double CAMERA_TILT = 0;
// const double CAMERA_BEARING = 30;
// const LatLng SOURCE_LOCATION = LatLng(42.7477863, -71.1699932);
// const LatLng DEST_LOCATION = LatLng(42.6871386, -71.2143403);
//
// class DrawingRouteLine extends StatefulWidget {
//   @override
//   _DrawingRouteLineState createState() => _DrawingRouteLineState();
// }
//
// class _DrawingRouteLineState extends State<DrawingRouteLine> {
//   Completer<GoogleMapController> _completer = Completer();
//
//   Set<Marker> _markers = {};
//
//   Set<Polyline> _polylines = {};
//
//   List<LatLng> polyLineCordinates = [];
//
//   PolylinePoints polylinePoints = PolylinePoints();
//
//   String googleApiKey = "AIzaSyCXBBSsCPqYAQyG9lSB17eoTiYMKkRMQ84";
//
//   var sourceIcon;
//
//   var destinationIcon;
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     setSourceAndDestinationIcons();
//   }
//
//   void setSourceAndDestinationIcons() async {
//      sourceIcon = await BitmapDescriptor.fromAssetImage(
//         ImageConfiguration(devicePixelRatio: 2.5), 'assets/driving_pin.png');
//     destinationIcon = await BitmapDescriptor.fromAssetImage(
//         ImageConfiguration(devicePixelRatio: 2.5), 'assets/markericon.png');
//   }
//
//   void onMapCreated(GoogleMapController controller) {
//    _completer.complete(controller);
//    setMapPins();
//    setPolylines();
//
//   }
//
//   void setMapPins() {
//     setState(() {
//       //source pin
//       _markers.add(Marker(
//         markerId: MarkerId('sourceId'),
//         position: SOURCE_LOCATION,
//         icon:sourceIcon
//       ));
//
//       //destination pin
//       _markers.add(Marker(
//         markerId: MarkerId('destiId'),
//         position: DEST_LOCATION,
//         icon:destinationIcon
//       ));
//     });
//   }
//
//   void setPolylines() async {
//     PolylineResult result= await polylinePoints.getRouteBetweenCoordinates(googleApiKey, PointLatLng(SOURCE_LOCATION.latitude, SOURCE_LOCATION.longitude),PointLatLng(DEST_LOCATION.latitude, DEST_LOCATION.longitude));
//   if(result.points.isNotEmpty) {
//     result.points.forEach((element) {
//       polyLineCordinates.add(LatLng(element.latitude, element.longitude));
//     });
//
//     setState(() {
//       Polyline polyline =Polyline(polylineId: PolylineId('id'),
//       color: Color.fromARGB(255, 40, 122, 198),
//         points: polyLineCordinates
//       );
//       _polylines.add(polyline);
//     });
//
//
//
//   }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     CameraPosition initialLocation = CameraPosition(
//         target: SOURCE_LOCATION,
//         zoom: CAMERA_ZOOM,
//         bearing: CAMERA_BEARING,
//         tilt: CAMERA_TILT);
//     return GoogleMap(
//         myLocationEnabled: true,
//         compassEnabled: true,
//         tiltGesturesEnabled: false,
//         markers: _markers,
//         polylines: _polylines,
//         mapType: MapType.normal,
//         onMapCreated: onMapCreated,
//         initialCameraPosition: initialLocation);
//   }
// }
