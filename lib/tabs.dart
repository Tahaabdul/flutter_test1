import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:flutter_test1/geo_service.dart';
import 'package:flutter_test1/tabs1.dart';

void main() {
  runApp(TabBarDemo());
}

class TabBarDemo extends StatelessWidget {
  final locatorService = GeoService();
  @override
  Widget build(BuildContext context) {
    return FutureProvider(
      create: (context) => locatorService.getLocation(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: DefaultTabController(
          length: 3,
          child: Scaffold(
            appBar: AppBar(
              bottom: TabBar(
                tabs: [
                  Tab(icon: Icon(Icons.location_on)),
                  Tab(icon: Icon(Icons.directions_transit)),
                  Tab(icon: Icon(Icons.directions_bike)),
                ],
              ),
              title: Text('ViewSm'),
            ),
            body: TabBarView(
              children: [
                MapPage(),
                Icon(Icons.directions_bike),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MyHomepage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomepage> {
  GoogleMapController _controller;

  WidgetBuilder builder(BuildContext context) {}
  Position position;
  Widget _child;

//  function to call at run time
  void initState() {
    getCurrentLocation();
    super.initState();
  }

  void getCurrentLocation() async {
    Position res = await Geolocator().getCurrentPosition();
    setState(() {
      position = res;
//        _lat = position.latitude;
//        _lng = position.longitude
      _child = mapWidget();
    });
//      await getAddres(_lat, _lng);
  }

//Main app return
  @override
  Widget build(BuildContext context) {
    final currentPosition = Provider.of<Position>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('ViewSm'),
      ),
      body: _child,
    );
  }

// set a marker
  Set<Marker> _createMarker() {
    return <Marker>[
      Marker(
        markerId: MarkerId("home"),
        position: LatLng(position.latitude, position.longitude),
        icon: BitmapDescriptor.defaultMarker,
        infoWindow: InfoWindow(title: "Home"),
      ),
    ].toSet();
  }

//create a map widget to display
  Widget mapWidget() {
    return Scaffold(
        body: Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height / 2,
      child: GoogleMap(
          mapType: MapType.hybrid,
          markers: _createMarker(),
          initialCameraPosition: CameraPosition(
            target: LatLng(position.latitude, position.longitude),
            zoom: 16.0,
          ),
          onMapCreated: (GoogleMapController controller) {
            _controller = controller;
          },
          zoomGesturesEnabled: true),
    ));
  }
}
