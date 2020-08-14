import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_test1/dashboard.dart';
import 'package:flutter_test1/tabs.dart';


class CreateLogin extends StatefulWidget {
  final Function cancelBackToHome;
  CreateLogin({this.cancelBackToHome});

  @override
  _CreateLoginState createState() => _CreateLoginState();
}

class _CreateLoginState extends State<CreateLogin> {
  String email, password, passwordConfirm;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  bool _termsAgreed = false;
  bool saveAttempted = false;
  final formKey = GlobalKey<FormState>();

  void _createUser({String email, String pw}) {
    _auth
        .createUserWithEmailAndPassword(email: email, password: pw)
        .then((authResult) {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) =>
              TabBarDemo(),
          )
      );
    }).catchError((err) {
      print(err.code);
      if (err.code == 'ERROR_EMAIL_ALREADY_IN_USE') {
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
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: 25.0,
          ),
          child: Column(
            children: <Widget>[
              Text('CREATE YOUR LOGIN',
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
                onChanged: (textValue) {
                  setState(() {
                    email = textValue;
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
                validator: (pwValue) {
                  if (pwValue.isEmpty) {
                    return "This field is required";
                  }
                  if (pwValue.length < 8) {
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
                  hintText: 'Password',
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
                height: 10,
              ),
              TextFormField(
                autovalidate: saveAttempted,
                onChanged: (textValue) {
                  setState(() {
                    passwordConfirm = textValue;
                  });
                },
                validator: (pwConValue) {
                  if (pwConValue != password) {
                    return "Passwords do not match";
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
                  hintText: 'Re-enter Password',
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
                      value: _termsAgreed,
                      onChanged: (newValue) {
                        setState(() {
                          _termsAgreed = newValue;
                        });
                      }),
                  Text('Agreed to Terms & Conditions',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'openSans',
                      )),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  InkWell(
                    onTap: () {
                      widget.cancelBackToHome();
                    },
                    child: Text('CANCEL',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'openSans',
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        )),
                  ),
                  SizedBox(
                    width: 38.0,
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        saveAttempted = true;
                      });
                      if (formKey.currentState.validate()) {
                        formKey.currentState.save();
                        _createUser(email: email, pw: password);
                      }
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        vertical: 16.0,
                        horizontal: 34.0,
                      ),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30.0)),
                      child: Text('SAVE',
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'openSans',
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          )),
                    ),
                  ),
                ],
              ),
            ],
          )),
    );
  }
}
