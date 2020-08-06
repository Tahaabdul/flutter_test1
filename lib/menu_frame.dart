import 'package:flutter/material.dart';
import 'package:flutter_test1/create_login.dart';
import 'package:flutter_test1/sign_in.dart';
import 'package:flutter_test1/home_signin_widget.dart';
import 'package:flutter_test1/tabs.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MenuFrame extends StatelessWidget{
  PageController pageController =  PageController();
  Duration _animationDuration = Duration(milliseconds: 500);

  void _changePage(int page ){
    pageController.animateToPage(page,
        duration: _animationDuration, curve: Curves.easeIn);
  }
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        child: Column(
          children: <Widget>[
            SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 28.0, vertical: 40.0),

                child: Column(
                  children: <Widget>[
                    Icon(
                      FontAwesomeIcons.truck,
                      size: 60.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                            'View',
                            style: TextStyle(
                              fontSize: 38.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            )
                        ),
                        Text(
                          'Sm',
                          style: TextStyle(
                            fontSize: 38.00,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                    Text('Streamline your van sales activities ',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                      ),
                      textAlign: TextAlign.center,
                    ),
//                    SizedBox(
//                      height: 85.0,
//                    ),
                  ],
                ),
                ),
              ),
            Expanded(
              child: PageView(
                physics: NeverScrollableScrollPhysics(),
                controller: pageController,
                children: <Widget>[
                  HomeSignInWidget(
                    goToSignIn: (){
                      _changePage(1);
                    },
                    goToSignUp: (){
                      _changePage(2);
                    },
                  ),
                  SignIn(
                    goToSignUp: (){
                      _changePage(2);
                    },
                  ),
                  CreateLogin(
                    cancelBackToHome: (){
                      _changePage(0);
                    },
                  ),
                  TabBarDemo()
                ],
              ),
            )
          ],
        ),
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF73AEF5),
              Color(0xFF61A4F1),
              Color(0xFF478DE0),
              Color(0xFF398AE5),
            ],
            stops: [0.1, 0.4, 0.7, 0.9],
          ),
        ),
      ),
    );
  }
}
