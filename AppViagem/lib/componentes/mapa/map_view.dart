import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
//import 'package:flutter_compass/flutter_compass.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

//import '../api/carPosicao.dart';
import '../controllers/map_markers.dart';
import '../hamburguer/gaveta_mapa_hamburguer.dart';

//import '../rotas/rota.dart';

class MapView extends StatefulWidget {
  @override
  _MapViewState createState() => _MapViewState();
}

class _MapViewState extends State<MapView> {
  late GoogleMapController googleMapController;
  Set<Marker> markers = {};
  late LatLng busLocation;

  double currentHeading = 0;
  bool followUser = false;
  late Timer centerOnBusTimer;
  Set<Marker> carPositionMarkers = {};

  bool userMovedMap = false;

  @override
  void initState() {
    super.initState();

    MapMarkers.getMarkers(context).then((result) {
      setState(() {
        markers = result;
      });
    });

    centerOnBusTimer = Timer.periodic(Duration(minutes: 1), (Timer timer) {
      _centerOnBus();
    });

    //_initializeRoutes();
  }

  @override
  void dispose() {
    centerOnBusTimer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.pushNamed(context, '/home2');
        return false;
      },
      child: Scaffold(
        drawer: GavetaMap(
          onLogout: () {
            Navigator.pop(context);
            Navigator.pushNamedAndRemoveUntil(
              context,
              '/login',
              (route) => false,
            );
          },
          onNavigateToSomeRoute: () {
            Navigator.pop(context);
          },
          onNewButtonAction: () {},
        ),
        body: Builder(
          builder: (context) => Stack(
            children: [
              GoogleMap(
                onMapCreated: (controller) {
                  _onMapCreated(controller);
                  // Add this line
                },
                initialCameraPosition: CameraPosition(
                  target: LatLng(-15.7801, -47.9292),
                  zoom: 0,
                ),
                mapType: MapType.normal,
                markers: markers.union(carPositionMarkers),
                myLocationEnabled: false,
                compassEnabled: false,
                onCameraMove: (CameraPosition position) {
                  userMovedMap = true;
                  followUser = false;
                },
                onCameraIdle: () {
                  if (followUser) {
                    _rotateMap(currentHeading);
                  }
                },
              ),
              Positioned(
                top: 70,
                left: 20,
                child: FloatingActionButton(
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                  child: Icon(Icons.menu),
                  backgroundColor: Color.fromARGB(80, 37, 34, 34),
                  foregroundColor: Color.fromARGB(255, 255, 255, 255),
                  elevation: 4,
                ),
              ),
              Visibility(
                visible: userMovedMap,
                child: Positioned(
                  top: 839,
                  left: 20,
                  child: FloatingActionButton(
                    onPressed: () {
                      _centerOnBus();
                      setState(() {
                        userMovedMap =
                            false; // essa linha faz o botão sumir depois de clicado
                      });
                      Timer(Duration(seconds: 1), () {
                        if (!userMovedMap) {
                          setState(() {
                            userMovedMap = true;
                          });
                        }
                      });
                    },
                    child: Icon(Icons.location_searching),
                    backgroundColor: Color.fromARGB(80, 37, 34, 34),
                    foregroundColor: Color.fromARGB(255, 255, 255, 255),
                    elevation: 1,
                  ),
                ),
              ),
              /*Positioned(
                bottom: 16,
                left: 16,
                child: CarPositionComponentWithoutMap(
                  onUpdateMarkers: (Set<Marker> newMarkers) {
                    setState(() {
                      carPositionMarkers = newMarkers;
                    });
                  },
                ),
              ),*/
            ],
          ),
        ),
      ),
    );
  }

  void _onMapCreated(GoogleMapController controller) {
    googleMapController = controller;
  }

  void _updateBusMarker(LatLng busLocation) async {
    this.busLocation = busLocation;

    final BitmapDescriptor busIcon = await _getResizedBusIcon();

    setState(() {
      markers.removeWhere((marker) => marker.markerId.value == 'busLocation');
      markers.add(
        Marker(
          markerId: MarkerId('busLocation'),
          position: busLocation,
          icon: busIcon,
          anchor: Offset(0.5, 0.5),
        ),
      );
    });

    if (followUser) {
      googleMapController.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
            target: busLocation,
            bearing: currentHeading,
          ),
        ),
      );
    }
  }

  Future<BitmapDescriptor> _getResizedBusIcon() async {
    final ByteData data = await rootBundle.load('assets/images/user_map.png');
    final Uint8List bytes = data.buffer.asUint8List();

    final codec = await instantiateImageCodec(
      bytes,
      targetHeight: 250,
      targetWidth: 250,
    );
    final FrameInfo frameInfo = await codec.getNextFrame();
    final ByteData? resizedData =
        await frameInfo.image.toByteData(format: ImageByteFormat.png);

    return BitmapDescriptor.fromBytes(resizedData!.buffer.asUint8List());
  }

  void _centerOnBus() {
    if (busLocation != null && googleMapController != null) {
      googleMapController.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
            target: busLocation,
            zoom: 14, //17
            bearing: currentHeading,
          ),
        ),
      );
    }
  }

  void _rotateMap(double heading) {
    if (googleMapController != null) {
      googleMapController.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
            target: busLocation,
            zoom: 15,
            bearing: heading,
          ),
        ),
      );
    }
  }
}
