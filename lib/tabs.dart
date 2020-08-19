import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test1/dashboard.dart';
import 'package:flutter_test1/new.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:flutter_test1/geo_service.dart';
import 'package:flutter_test1/tabs1.dart';

void main() {
  runApp(TabBarDemo());
}

// ignore: must_be_immutable
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
              actions: [
                IconButton(icon: Icon(FontAwesomeIcons.doorOpen), onPressed: () {
                  showDialog(
                    context: context,
                    builder: (_) => AlertDialog(
                        title: Text(""),
                        content: Text("Do You Wish to sign out"),
                        actions: [
                          FlatButton(
                            child: Text("YES"),
                            onPressed: () {
                              Navigator.popUntil(context, ModalRoute.withName("/"));
                            },
                          ),
                          FlatButton(
                            child: Text("NO"),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                        ]),
                    barrierDismissible: false,
                  );
                })
              ],
              bottom: TabBar(
                tabs: [
                  Tab(icon: Icon(Icons.home),
                  text: 'Home',),
                  Tab(icon: Icon(FontAwesomeIcons.bus),
                  text:'Route Activity'),
                  Tab(icon: Icon(FontAwesomeIcons.cartArrowDown),
                  text:'Customer View'),
                ],
              ),
              title: Text('ViewSm'),
            ),

            body: TabBarView(
              children: [
                Dashboard(),
                App(),
                StoreList(),
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


////  function to call at run time
//  void initState() {
//    getCurrentLocation();
//    super.initState();
//  }
//
//  void getCurrentLocation() async {
//    Position res = await Geolocator().getCurrentPosition();
//    setState(() {
//      position = res;
////        _lat = position.latitude;
////        _lng = position.longitude
//      _child = mapWidget();
//    });
////      await getAddres(_lat, _lng);
//  }

//Main app return@override
Widget build(BuildContext context) {
  return new WillPopScope(
    onWillPop: () async => false,
    child: new Scaffold(
      appBar: new AppBar(
        title: new Text("data"),
        leading: new IconButton(
          icon: new Icon(Icons.ac_unit),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
    ),
  );
}
//
  }

