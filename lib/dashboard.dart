import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();

}
// ignore: must_be_immutable
class _DashboardState extends State<Dashboard>{
  final FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseUser user;

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
      child: GridView.count(
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        crossAxisCount: 2,
        childAspectRatio: .90,
        children: List.generate(4, (_) {
          return Card(
            elevation: 2,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8)
            ),
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[FlutterLogo(), Text('data')],
              ),
            ),
          );
        }),
      ),
    ),
  );
}
