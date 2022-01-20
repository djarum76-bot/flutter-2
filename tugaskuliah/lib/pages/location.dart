import 'package:flutter/material.dart';
import 'package:location/location.dart';

class LocationPage extends StatefulWidget{
  @override
  State<LocationPage> createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage> {
  Location location = new Location();
  late bool _serviceEnabled;
  late PermissionStatus _permissionGranted;
  late LocationData _locationData;
  bool _isListenLocation = false, _isGetLocation = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Location"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: ()async{
                  _serviceEnabled = await location.serviceEnabled();
                  if(!_serviceEnabled){
                    _serviceEnabled = await location.requestService();
                    if(_serviceEnabled) return;
                  }

                  _permissionGranted = await location.hasPermission();
                  if(_permissionGranted == PermissionStatus.denied){
                    _permissionGranted = await location.requestPermission();
                    if(_permissionGranted != PermissionStatus.granted) return;
                  }

                  _locationData = await location.getLocation();
                  setState(() {
                    _isGetLocation = true;
                  });
                },
                child: Text("Get Location")
            ),
            _isGetLocation ? Text("Location : ${_locationData.latitude}/${_locationData.longitude}") : Container()
          ],
        ),
      )
    );
  }
}