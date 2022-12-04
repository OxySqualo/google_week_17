import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:google_week_17/main.dart';

class WorkMapPage extends StatefulWidget {
  const WorkMapPage({Key? key}) : super(key: key);

  @override
  State<WorkMapPage> createState() => _WorkMapPageState();
}

class _WorkMapPageState extends State<WorkMapPage> {
  Location location = Location();
  late GoogleMapController _mapController;
  final Completer<GoogleMapController> _controller = Completer();

  void _onMapCreated(GoogleMapController mapController) {
    _controller.complete(mapController);
    _mapController = mapController;
  }

  _checkLocationPermission() async {
    bool locationServiceEnabled = await location.serviceEnabled();
    if (!locationServiceEnabled) {
      locationServiceEnabled = await location.requestService();
      if (!locationServiceEnabled) {
        return;
      }
    }

    PermissionStatus locationForAppStatus = await location.hasPermission();
    if (locationForAppStatus == PermissionStatus.denied) {
      await location.requestPermission();
      locationForAppStatus = await location.hasPermission();
      if (locationForAppStatus != PermissionStatus.granted) {
        return;
      }
    }
    LocationData locationData = await location.getLocation();
    _mapController.moveCamera(CameraUpdate.newLatLng(
        LatLng(locationData.latitude!, locationData.longitude!)));
  }

  void _addMarker(LatLng position) {
    lat = "${position.latitude}";
    long = "${position.longitude}";
    mylat?.add(lat);
    mylong?.add(long);
    markers.add(
      Marker(
          markerId: const MarkerId("mark"),
          infoWindow: const InfoWindow(title: "mark"),
          icon:
              BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
          position: position),
    );

    setState(() {});
  }

  @override
  initState() {
    super.initState();
    _checkLocationPermission();
  }

  @override
  void dispose() {
    _mapController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Map page"),
        centerTitle: true,
      ),
      body: GoogleMap(
        initialCameraPosition: const CameraPosition(
          target: LatLng(48.50, 2.20),
          zoom: 15,
        ),
        myLocationEnabled: true,
        myLocationButtonEnabled: true,
        onMapCreated: _onMapCreated,
        markers: markers,
        onTap: _addMarker,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {});
          Navigator.pushNamed(context, '/');
        },
        child: const Icon(Icons.save),
      ),
    );
  }
}
