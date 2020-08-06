import 'package:flutter/material.dart';

class HomeSignInWidget extends StatelessWidget{
  final Function goToSignUp;
  final Function goToSignIn;

  HomeSignInWidget({this.goToSignUp, this.goToSignIn});


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 24.0,
        vertical: 30.0,
      ),
      child: Column(
        children: <Widget>[
//          Container(
//            padding: EdgeInsets.symmetric(
//              vertical: 16.0,
//              horizontal: 20.0,
//            ),
//            decoration: BoxDecoration(
//                color: Colors.white,
//                borderRadius: BorderRadius.circular(20.0)
//            ),
//            child: Row(
//              mainAxisAlignment: MainAxisAlignment.center,
//              children: <Widget>[
//                Text(
//                  'LOGIN',
//                  style: TextStyle(
//                    color: Colors.black,
//                    fontWeight: FontWeight.bold,
//                    fontSize: 20.0,
//                  ),
//                ),
//              ],
//            ),
//          ),
          SizedBox(
            height: 20.0,
          ),
          InkWell(
            onTap: (){
              goToSignUp();
            },
            child: Container(
              padding: EdgeInsets.symmetric(
                vertical: 16.0,
                horizontal: 20.0,
              ),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20.0)
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Create An Account',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          InkWell(
            onTap: (){
              goToSignIn();
            },

            child: Text(
              'ALREADY REGISTERED? SIGN IN',
              style:  TextStyle(
                color: Colors.white,
                fontSize:   16.0,
                fontFamily: 'openSans',
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.underline,
              ),
            ),
          ),
        ],
      ),
    );
  }
}