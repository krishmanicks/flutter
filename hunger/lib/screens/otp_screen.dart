import 'dart:html';

import 'package:flutter/material.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class OtpScreen extends StatefulWidget {
  final String value;
  OtpScreen(this.value);

  @override
  _OtpScreenState createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  TextEditingController _otpController = TextEditingController();
  bool iscodesent = false;
  String _verificationId;
  AuthCredential _phoneAuthCredential = AuthCredential();
  User _firebaseUser;

  void _submitOTP() {
    String smsCode = _otpController.text.toString().trim();
    this._phoneAuthCredential = PhoneAuthProvider.credential(
        verificationId: this._verificationId, smsCode: smsCode);

    _login();
  }

  Future<void> _login() async {
    try {
      await FirebaseAuth.instance
          .signInWithCredential(this._phoneAuthCredential)
          .then((AuthResult authRes) {
        _firebaseUser = authRes.user;
        print(_firebaseUser.toString());
      });
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> _submitPhoneNumber() async {
    String phoneNumber = "+91 " + widget.value.toString().trim();
    print(phoneNumber);

    void verificationCompleted(AuthCredential phoneAuthCredential) {
      print('verificationCompleted');
      this._phoneAuthCredential = phoneAuthCredential;
      print(phoneAuthCredential);
    }

    Future<void> verificationFailed(error) async {
      print(error);
    }

    void codeSent(String verificationId, [int code]) {
      print('codeSent');
    }

    void codeAutoRetrievalTimeout(String verificationId) {
      print('codeAutoRetrievalTimeout');
    }

    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      timeout: Duration(milliseconds: 10000),
      verificationCompleted: verificationCompleted,
      verificationFailed: verificationFailed,
      codeSent: codeSent,
      codeAutoRetrievalTimeout: codeAutoRetrievalTimeout,
    ); // All the callbacks are above
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        title: Text(
          'OTP Verification',
          style: TextStyle(
            color: Colors.pink,
            fontSize: 22.0,
          ),
        ),
        centerTitle: true,
        backgroundColor: Theme.of(context).backgroundColor,
      ),
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
                vertical: 40.0,
                horizontal: 30.0,
              ),
              child: Column(
                children: [
                  Center(
                    child: Text(
                      'OTP Sent to ${widget.value}',
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  SizedBox(height: 40.0),
                  Container(
                    child: OTPTextField(
                      length: 6,
                      width: MediaQuery.of(context).size.width,
                      textFieldAlignment: MainAxisAlignment.spaceAround,
                      fieldWidth: 50,
                      fieldStyle: FieldStyle.underline,
                      style: TextStyle(fontSize: 17),
                      onCompleted: (pin) {
                        print("Completed: " + pin);
                      },
                    ),
                  ),
                  SizedBox(
                    height: 50.0,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 30.0),
                    width: 200.0,
                    child: RaisedButton(
                      onPressed: () {},
                      padding: EdgeInsets.all(15.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      color: Colors.pink,
                      child: Text(
                        'Continue',
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
          ),
        ],
      ),
    );
  }
}
