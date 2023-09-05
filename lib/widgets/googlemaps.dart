import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class CustomGoogleMap extends StatefulWidget {
  const CustomGoogleMap({super.key});

  @override
  State<CustomGoogleMap> createState() => _CustomGoogleMapState();
}

class _CustomGoogleMapState extends State<CustomGoogleMap> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 7.4746,
  );

  final List<Marker> _markers = [];
  final List<Marker> _locations = [
    const Marker(
      markerId: MarkerId('1'),
      position: LatLng(37.42796133580664, -122.085749655962),
      infoWindow: InfoWindow(
        title: 'My Location',
      ),
    ),
    const Marker(
      markerId: MarkerId('2'),
      position: LatLng(37.82796133580664, -122.045749655962),
      infoWindow: InfoWindow(
        title: 'My Friend',
      ),
    ),
  ];

  @override
  void initState() {
    super.initState();
    _markers.addAll(_locations);
  }

  _buildMap() {
    return Container(
      height: 400,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(3)),
      child: GoogleMap(
        mapType: MapType.hybrid,
        markers: Set<Marker>.of(_markers),
        initialCameraPosition: _kGooglePlex,
        onMapCreated: (controller) {
          _controller.complete(controller);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildMap();
  }
}
