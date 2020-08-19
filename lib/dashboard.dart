import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_test1/new.dart';
import 'package:flutter_test1/tabs.dart';
import 'package:flutter_test1/tabs1.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import 'geo_service.dart';
final locatorService = GeoService();
class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();


}
// ignore: must_be_immutable
class _DashboardState extends State<Dashboard>{
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final locatorService = GeoService();
  FirebaseUser user;
  PageController pageController =  PageController();
  Duration _animationDuration = Duration(milliseconds: 500);

  void _changePage(int page ){
    pageController.animateToPage(page,
        duration: _animationDuration, curve: Curves.easeIn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[dashBg, content],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    initUser();
  }

  initUser() async {
    user = await _auth.currentUser();
    setState(() {});
  }
  get dashBg => Column(
    children: <Widget>[
      Expanded(
        child: Container(color: Colors.blue),
        flex: 2,
      ),
      Expanded(
        child: Container(color: Colors.transparent),
        flex: 5,
      ),
    ],
  );

  get content => Container(
    child: Column(
      children: <Widget>[
        header,
        grid,
      ],
    ),
  );

  get header => ListTile(
    contentPadding: EdgeInsets.only(left: 20, right: 20, top: 20),
    title: Text(
      'Your Dashboard',
      style: TextStyle(color: Colors.white),
    ),
    subtitle: Text('Welcome',
      style: TextStyle(color: Colors.white,
      fontSize: 30.0,
      ),
    ),
    trailing: CircleAvatar(
    ),
  );



  get grid => Expanded(
    child: Container(
      padding: EdgeInsets.only(left: 16, right: 16, bottom: 16),
      child: Scaffold(
        body: GridView.count(
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          crossAxisCount: 2,
          childAspectRatio: .90,
          children: [
            Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)
              ),
              child: Center(

                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[ IconButton(
                      icon: Icon(FontAwesomeIcons.calendar),
                      onPressed: () {

                      }
                  ), Text('SLIDES')],
                ),
              ),
            ),
            Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)
              ),
              child: Center(

                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[ IconButton(
                      icon: Icon(FontAwesomeIcons.calendar),
                      onPressed: () {

                      }
                  ), Text('SLIDES')],
                ),
              ),
            ),
            Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)
              ),
              child: Center(

                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[ IconButton(
                      icon: Icon(FontAwesomeIcons.route),
                      onPressed: () {

                      }
                  ), Text('Route Activity')],
                ),
              ),
            ),
            Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)
              ),
              child: Center(

                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[ IconButton(
                      icon: Icon(FontAwesomeIcons.addressBook),
                      onPressed: () {

                      }
                  ), Text('Contacts')],
                ),
              ),
            ),
          ],


            )
        ),
      ),
    );
  
}