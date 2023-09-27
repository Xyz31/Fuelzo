import 'dart:async';
import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class CustomGoogleMap extends StatefulWidget {
  const CustomGoogleMap({Key? key}) : super(key: key);

  @override
  _CustomGoogleMapState createState() => _CustomGoogleMapState();
}

class _CustomGoogleMapState extends State<CustomGoogleMap> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 7.4746,
  );

  final List<Marker> _markers = [];

  @override
  void initState() {
    // _loadMarkers();
    super.initState();
  }

/*
  Future<void> _loadMarkers() async {
    // Load markers with icons
    _markers.add(
      Marker(
          markerId: const MarkerId('1'),
          position: const LatLng(37.42796133580664, -122.085749655962),
          infoWindow: const InfoWindow(
            title: 'My Location',
            snippet: 'This is my location',
          ),
          icon: await _loadIcon()),
    );

    _markers.add(
      Marker(
        markerId: const MarkerId('2'),
        position: const LatLng(37.12796133580664, -122.055749655962),
        infoWindow: const InfoWindow(
          title: 'My Friend',
          snippet: 'This is your location',
        ),
        icon: await _loadIcon(),
      ),
    );

    // Add more markers as needed
  }
  */

  Future<Position> getUserLoaction() async {
    await Geolocator.requestPermission()
        .then((value) => {})
        .onError((error, stackTrace) {
      debugPrint(error.toString());
      throw error.toString();
    });

    return await Geolocator.getCurrentPosition();
  }

  Future<void> _loadMarkers() async {
    // Fetch the current location
    // final Position position = await Geolocator.getCurrentPosition(
    //   desiredAccuracy: LocationAccuracy.high,
    // );

    await Geolocator.requestPermission().then((value) {
      debugPrint(value.toString());
      final pos = Geolocator.checkPermission();
    }).onError((error, stackTrace) {
      debugPrint(error.toString());
    });

    // Load markers with icons
    // _markers.add(
    //   Marker(
    //     markerId: const MarkerId('1'),
    //     position: LatLng(
    //       position.latitude,
    //       position.longitude,
    //     ),
    //     infoWindow: const InfoWindow(
    //       title: 'My Location',
    //       snippet: 'This is my location',
    //     ),
    //     icon: await _loadIcon(),
    //   ),
    // );
    /*

    _markers.add(
      Marker(
        markerId: const MarkerId('2'),
        position: const LatLng(37.12796133580664, -122.055749655962),
        infoWindow: const InfoWindow(
          title: 'My Friend',
          snippet: 'This is your location',
        ),
        icon: await _loadIcon(),
      ),
    );
*/
    // Add more markers as needed
  }

  Future<BitmapDescriptor> _loadIcon() async {
    // Load your custom icon here, e.g., from an asset or network
    var url =
        'https://user-images.githubusercontent.com/95264887/244848150-e687a448-dca6-4d5b-82de-9d12eca1687b.png';
    var bytes = (await NetworkAssetBundle(Uri.parse(url)).load(url))
        .buffer
        .asUint8List();
    // return await BitmapDescriptor.fromAssetImage(
    //     const ImageConfiguration(
    //       devicePixelRatio: BitmapDescriptor.hueBlue,
    //     ),
    //     'Assets/Images/profile.png');
    return BitmapDescriptor.fromBytes(bytes);
  }

  Widget _buildMap() {
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
    // return _buildMap();
    return FloatingActionButton(
      backgroundColor: Colors.purple,
      tooltip: 'Access Current Location',
      child: Icon(Icons.my_location_outlined),
      onPressed: () async {
        await getUserLoaction().then((value) {
          debugPrint("${value.latitude}  ${value.longitude}");
        });
      },
    );
  }
}
