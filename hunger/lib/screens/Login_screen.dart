import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hunger/screens/Phone_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
          ),
          Container(
            child: SingleChildScrollView(
              physics: AlwaysScrollableScrollPhysics(),
              padding: EdgeInsets.symmetric(
                vertical: 30.0,
                horizontal: 20.0,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Welcome to Hunger',
                    style: TextStyle(
                      fontSize: 35.0,
                      fontFamily: 'Pacifico',
                      fontWeight: FontWeight.w500,
                      letterSpacing: 1.0,
                      color: Colors.pink,
                    ),
                  ),
                  SizedBox(
                    height: 95.0,
                  ),
                  Center(
                    child: ClipOval(
                      child: Image(
                        image: AssetImage("images/logo.png"),
                        height: 220.0,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 95.0,
                  ),
                  Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'By clicking on Next, you agree to our',
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          'Terms and Privacy Policy.',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0,
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(vertical: 30.0),
                          width: 200.0,
                          child: RaisedButton(
                            onPressed: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => PhoneScreen()));
                            },
                            padding: EdgeInsets.all(15.0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                            color: Colors.pink,
                            child: Text(
                              'Next',
                              style: TextStyle(
                                fontSize: 22.0,
                                letterSpacing: 1.5,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
