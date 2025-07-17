import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapSample extends StatefulWidget {
  const MapSample({super.key});

  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  late GoogleMapController _controller;

  late CameraPosition initialPosition;

  late Set<Marker> markers;
  late Set<Circle> circles;

  String mapStyle = "";

  Future<void> _loadMapStyle() async {
    try {
      mapStyle = await rootBundle.loadString("assets/map_style.json");
    } catch (e) {
      log("mapStyle error: $mapStyle");
    }

    log("mapStyle: $mapStyle");

    setState(() {});
  }

  @override
  void initState() {
    _loadMapStyle();

    initialPosition = CameraPosition(
      target: LatLng(31.98806778553768, 35.89491058140993),
      zoom: 14.4746, //max zoom = 23
    );

    markers = {
      Marker(
        markerId: MarkerId("1"),
        position: LatLng(31.98806778553768, 35.88491058140993),
        draggable: true,
        onDrag: (latLng) {
          log("onDrag");
        },
        onDragStart: (latLng) {
          log("onDragStart");
        },
        onDragEnd: (latLng) {
          log("onDragEnd");
        },
      ),
      Marker(
        markerId: MarkerId("2"),
        position: LatLng(31.98806778553768, 35.89491058140993),
      ),
    };

    circles = {
      Circle(
        circleId: CircleId("1"),
        strokeColor: Colors.red,
        center: LatLng(31.98806778553768, 35.88491058140993),
        radius: 70,
        strokeWidth: 5,
        fillColor: Colors.blue.withAlpha(100),
      ),
      Circle(
        circleId: CircleId("2"),
        strokeColor: Colors.green,
        center: LatLng(31.98806778553768, 35.89491058140993),
        radius: 70,
        strokeWidth: 5,
        fillColor: Colors.blue.withAlpha(100),
      ),
    };

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              child: GoogleMap(
                mapType: MapType.satellite,
                //الموقع الإفتراضي عند بناء الخريطة
                initialCameraPosition: initialPosition,
                //تفعيل زر الموقع الحالي
                myLocationButtonEnabled: true,
                //اظهار الموقع الحالي
                myLocationEnabled: true,
                //إظهار المباني من الداخل
                indoorViewEnabled: false,
                //بشغل وضع الخرائظ البسيط وببطل يحرك الخريطة لا زوم ولا يمين وشمال
                liteModeEnabled: false,
                // تكبير وتصغير الخريطة باستخدام الأصابع
                zoomGesturesEnabled: true,
                //إظهار ازرار التكبير والتصغير
                zoomControlsEnabled: true,
                //تفعيل ثلاثي الأبعاد للمباني
                buildingsEnabled: false,
                //إظهار شريط الأدوات للخريطة
                mapToolbarEnabled: false, //TODO
                //إظهار حركة المرور
                trafficEnabled: false,
                //السماح بسحب الخريطة يمين وشمال ولا لا
                scrollGesturesEnabled: true,
                //السماح بإمالة الخريطة ولا لا
                tiltGesturesEnabled: true,
                //اقدر الف الخريطة ولا لا
                rotateGesturesEnabled: true,
                //إظهار البوصلة عند تدوير الخريطة
                compassEnabled: true,
                //اكبر زوم واصغر زوم بقدر اوصله
                minMaxZoomPreference: MinMaxZoomPreference(12, 18),
                // markers: markers,
                // //بحدد دوائر على الخريطة
                // circles: circles,
                //اذا بدك تغير الستايل لاشي خاص من موقع
                //https://mapstyle.withgoogle.com/
                // style: mapStyle,
                padding: EdgeInsets.all(15),
                // onCameraIdle: () {
                //   log("onCameraIdle");
                // },
                // onCameraMoveStarted: () {
                //   log("onCameraMoveStarted");
                // },
                // onCameraMove: (position) {
                //   log(position.toMap().toString());
                // },
                onMapCreated: (controller) async {
                  _controller = controller;
                  if (mapStyle.isNotEmpty) {}
                },
                // onTap: (latLng) {
                //   _controller.setMapStyle(mapStyle);
                //   log(mapStyle);
                //   setState(() {});
                //   log(latLng.toJson().toString());
                // },
                // onLongPress: (latLng) {
                //   log(latLng.toJson().toString());
                // },
              ),
            ),
          ],
        ),
        // floatingActionButton: FloatingActionButton(
        //   onPressed: _goToTheLake,
        //   child: Icon(Icons.location_searching_outlined),
        // ),
      ),
    );
  }

  Future<void> _goToTheLake() async {
    Position positioned = await Geolocator.getCurrentPosition();

    await _controller.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          zoom: 15,
          target: LatLng(positioned.latitude, positioned.longitude),
        ),
      ),
    );
  }
}
