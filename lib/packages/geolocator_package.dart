import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class GeolocatorPackage extends StatelessWidget {
  const GeolocatorPackage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Geolocator package')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: Text('Get Location name'),
              onPressed: () async {
                Position position = await Geolocator.getCurrentPosition();

                List<Placemark> placemarks = await placemarkFromCoordinates(
                  position.latitude,
                  position.longitude,
                );

                log(placemarks.first.toJson().toString());
              },
            ),
            ElevatedButton(
              child: Text('Get Location'),
              onPressed: () async {
                LocationPermission locationPermission =
                    await Geolocator.checkPermission();

                if (locationPermission == LocationPermission.denied) {
                  locationPermission = await Geolocator.requestPermission();
                  if (locationPermission == LocationPermission.denied) {
                    return;
                  }
                }

                Position position = await Geolocator.getCurrentPosition();

                position.isMocked;

                log("${position.latitude} , ${position.longitude}");
                //31.9880629 , 35.8949763

                double distance = Geolocator.distanceBetween(
                  31.9880629,
                  35.8949763,
                  32.9880629,
                  34.8949763,
                );

                StreamSubscription<Position> stream =
                    Geolocator.getPositionStream(
                      locationSettings: LocationSettings(distanceFilter: 0),
                    ).listen((event) {
                      log(event.toJson().toString());
                    });

                stream.cancel();

                log(distance.toString());
              },
            ),
          ],
        ),
      ),
    );
  }
}
