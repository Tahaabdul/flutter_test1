import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_test1/tabs.dart';

class SignIn extends StatefulWidget {
  final Function goToSignUp;
  SignIn({this.goToSignUp});

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  bool _rememberPass = false;
  String email, password;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final formKey = GlobalKey<FormState>();
  bool saveAttempted = false;

  void _signIn({String em, String pw}) => _auth
          .signInWithEmailAndPassword(email: em, password: pw)
          .then((authResult) {
            Navigator.push(context,
            MaterialPageRoute(builder: (context) =>
            TabBarDemo()
    ));
      }).catchError((err) {
        print(err.code);
        if (err.code != '') {
          showDialog(
            context: context,
            builder: (_) => AlertDialog(
                title: Text(""),
                content: Text("Wrong Password and email Combination"),
                actions: [
                  FlatButton(
                    child: Text("OK"),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ]),
            barrierDismissible: false,
          );
        }
      });

  @override
  Widget build(BuildContext context) {
    return Stack(
      key: formKey,
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          padding: EdgeInsets.symmetric(
            vertical: 20.0,
            horizontal: 20.0,
          ),
          child: Column(
            children: <Widget>[
              Text('SIGN IN',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 28.0,
                    fontFamily: 'openSans',
                    fontWeight: FontWeight.w600,
                  )),
              SizedBox(
                height: 12.0,
              ),
              TextFormField(
                autovalidate: saveAttempted,
                onChanged: (emailValue) {
                  setState(() {
                    email = emailValue;
                  });
                },
                validator: (emailValue) {
                  if (emailValue.isEmpty) {
                    return "This field is required";
                  }

                  String p = "[a-zA-Z0-9\+\.\_\%\-\+]{1,256}" +
                      "\\@" +
                      "[a-zA-Z0-9][a-zA-Z0-9\\-]{0,64}" +
                      "(" +
                      "\\." +
                      "[a-zA-Z0-9][a-zA-Z0-9\\-]{0,25}" +
                      ")+";
                  RegExp regExp = new RegExp(p);

                  if (regExp.hasMatch(emailValue)) {
                    // So, the email is valid
                    return null;
                  }

                  return 'This is not a valid email';
                },
                decoration: InputDecoration(
                  errorStyle: TextStyle(
                    color: Colors.white,
                  ),
                  prefixIcon: Icon(Icons.email, color: Colors.white),
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                    color: Colors.white,
                  )),
                  hintText: 'Enter Email Address',
                  hintStyle: TextStyle(color: Colors.white.withOpacity(0.7)),
                  focusColor: Colors.white,
                ),
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22.0,
                  fontFamily: 'openSans',
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                autovalidate: saveAttempted,
                onChanged: (textValue) {
                  setState(() {
                    password = textValue;
                  });
                },
                validator: (password) {
                  if (password.isEmpty) {
                    return "This field is required";
                  }
                  if (password.length < 8) {
                    return "Password must be as least 8 characters";
                  }
                  return null;
                },
                obscureText: true,
                decoration: InputDecoration(
                  errorStyle: TextStyle(
                    color: Colors.white,
                  ),
                  prefixIcon: Icon(Icons.lock, color: Colors.white),
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                    color: Colors.white,
                  )),
                  hintText: 'Enter Password',
                  hintStyle: TextStyle(color: Colors.white.withOpacity(0.7)),
                  focusColor: Colors.white,
                ),
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22.0,
                  fontFamily: 'openSans',
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Row(
                children: <Widget>[
                  Checkbox(
                      value: _rememberPass,
                      onChanged: (newValue) {
                        setState(() {
                          _rememberPass = newValue;
                        });
                      }),
                  Text('Remember Password',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'openSans',
                        fontSize: 16.0,
                      )),
                ],
              ),
              SizedBox(
                height: 10.0,
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    saveAttempted = true;

                    _signIn(em: email, pw: password);
                  });

//                  if (formKey.currentState.validate()) {
//                    formKey.currentState.save();
//                  }
                },
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(
                    vertical: 16.0,
                    horizontal: 34.0,
                  ),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(18.0)),
                  child: Text(
                    'LOGIN',
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'openSans',
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Text('FORGOT PASSWORD?',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'openSans',
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline,
                  )),
            ],
          ),
        ),
        Container(
          width: double.infinity,
          padding: EdgeInsets.all(30.0),
          color: Colors.black.withOpacity(0.2),
          child: InkWell(
            onTap: () {
              widget.goToSignUp();
            },
            child: Text(
              'DON\'T HAVE AN ACCOUNT? SIGN UP',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
                fontFamily: 'openSans',
              ),
            ),
          ),
        ),
      ],
    );
  }
}

//void goToSignUp() {
//}
