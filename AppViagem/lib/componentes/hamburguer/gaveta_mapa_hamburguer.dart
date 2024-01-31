import 'dart:io';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_controller/google_maps_controller.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

class GavetaMap extends StatefulWidget {
  final Function() onLogout;
  final Function() onNavigateToSomeRoute;
  final VoidCallback onNewButtonAction;

  GavetaMap({
    required this.onLogout,
    required this.onNavigateToSomeRoute,
    required this.onNewButtonAction,
  });

  @override
  _GavetaMapState createState() => _GavetaMapState();
}

class _GavetaMapState extends State<GavetaMap> {
  File? _userImage;
  bool isCalculatingRoute = false;

  @override
  void initState() {
    super.initState();
    _loadUserImage();
  }

  Future<void> _loadUserImage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? imagePath = prefs.getString('userImage');

    if (imagePath != null) {
      setState(() {
        _userImage = File(imagePath);
      });
    }
  }

  Future<void> _saveUserImage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (_userImage != null) {
      prefs.setString('userImage', _userImage!.path);
    }
  }

  Future<void> _pickImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _userImage = File(pickedFile.path);
      });
      _saveUserImage();
    }
  }

  Future<void> _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  Future<void> _takePhoto() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      setState(() {
        _userImage = File(pickedFile.path);
      });
      _saveUserImage();
    }
  }

  Future<void> _showImageOptions() async {
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Escolher foto"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: Icon(Icons.photo_library),
                title: Text("Escolher da galeria"),
                onTap: () {
                  Navigator.pop(context);
                  _pickImage();
                },
              ),
              ListTile(
                leading: Icon(Icons.photo_camera),
                title: Text("Tirar uma foto"),
                onTap: () {
                  Navigator.pop(context);
                  _takePhoto();
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SizedBox(
        height: 500, // Ajuste a altura conforme necessário
        child: Container(
          //color: Colors.blue, // Cor desejada
          // Se quiser um degradê ou outro efeito, você pode usar BoxDecoration
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.blue, Colors.green],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),

          child: Column(
            children: <Widget>[
              Expanded(
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: <Widget>[
                    UserAccountsDrawerHeader(
                      accountName: null,
                      accountEmail: null,
                      currentAccountPicture: GestureDetector(
                        onTap: () {
                          _showImageOptions();
                        },
                        child: Container(
                          height: 100, // Ajuste a altura conforme necessário
                          width: 100,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: _userImage != null
                                  ? FileImage(_userImage!)
                                  : AssetImage('assets/images/user.jpg')
                                      as ImageProvider<Object>,
                            ),
                          ),
                        ),
                      ),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/images/usuar.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    ListTile(
                      leading: Icon(Icons.home),
                      title: Text(
                        "Home",
                        style: TextStyle(
                          color:
                              Colors.white, // Define a cor do texto para branco
                        ),
                      ),
                      onTap: () {
                        Navigator.pushReplacementNamed(context, '/home');
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.help),
                      title: Text(
                        "Quem somos",
                        style: TextStyle(
                          color:
                              Colors.white, // Define a cor do texto para branco
                        ),
                      ),
                      onTap: () {
                        Navigator.pushReplacementNamed(context, '/inicio');
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.location_on),
                      title: Text(
                        "Onde estamos",
                        style: TextStyle(
                          color:
                              Colors.white, // Define a cor do texto para branco
                        ),
                      ),
                      onTap: () {
                        Navigator.pushReplacementNamed(context, '/mapa');
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.contact_mail),
                      title: Text(
                        "Contatos",
                        style: TextStyle(
                          color:
                              Colors.white, // Define a cor do texto para branco
                        ),
                      ),
                      onTap: () {
                        Navigator.pushReplacementNamed(context, '/contato');
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.flight),
                      title: Text(
                        "Vamos viajar",
                        style: TextStyle(
                          color:
                              Colors.white, // Define a cor do texto para branco
                        ),
                      ),
                      onTap: () {
                        Navigator.pushReplacementNamed(context, '/home');
                      },
                    )
                  ],
                ),
              ),
              // Container fixo na parte inferior
              // Container fixo na parte inferior
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border(
                    top: BorderSide(color: Colors.grey, width: 0.5),
                  ),
                ),
                //padding: EdgeInsets.all(10),
                width: double
                    .infinity, // Largura do Container igual à largura máxima possível
                child: Column(
                  children: [
                    SizedBox(height: 15),
                    // Sua imagem ou outro conteúdo aqui
                    Image.asset(
                      'assets/images/logo.png',
                      height: 200,
                      width: double
                          .infinity, // Largura da imagem igual à largura máxima possível
                      fit: BoxFit.cover,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<LatLng> _getUserLocation(BuildContext context) async {
    try {
      Position position = await Geolocator.getCurrentPosition();
      return LatLng(position.latitude, position.longitude);
    } catch (e) {
      print("Error getting user location: $e");
      return LatLng(0, 0);
    }
  }
}
