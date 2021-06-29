import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:hunger/screens/otp_screen.dart';

class PhoneScreen extends StatefulWidget {
  @override
  _PhoneScreenState createState() => _PhoneScreenState();
}

class _PhoneScreenState extends State<PhoneScreen> {
  GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  TextEditingController _controller = TextEditingController();

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
                vertical: 50.0,
                horizontal: 30.0,
              ),
              child: Form(
                key: _formkey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Text(
                        'Enter your phone number with country code and click continue to get the otp.',
                        style: TextStyle(
                          fontSize: 18.0,
                          // fontWeight: FontWeight.w500,
                          letterSpacing: 1.0,
                          color: Colors.pink,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 50.0,
                    ),
                    SizedBox(
                      height: 90.0,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: CountryCodePicker(
                              onChanged: (val) {},
                              alignLeft: true,
                              initialSelection: 'in',
                            ),
                          ),
                          Expanded(
                            flex: 3,
                            child: TextFormField(
                              maxLength: 10,
                              validator: (val) {
                                if (val.isEmpty) {
                                  return 'empty';
                                } else if (val.length < 9) {
                                  return 'enter correct phone number';
                                }
                                return null;
                              },
                              controller: _controller,
                              keyboardType: TextInputType.phone,
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 15.0, horizontal: 20.0),
                                border: OutlineInputBorder(
                                  borderRadius: const BorderRadius.all(
                                    const Radius.circular(0.0),
                                  ),
                                ),
                                hintText: "Phone Number",
                              ),
                              onChanged: (value) {},
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 50.0,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 30.0),
                      width: 200.0,
                      child: RaisedButton(
                        onPressed: () {
                          if (_formkey.currentState.validate()) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    OtpScreen(_controller.text),
                              ),
                            );
                          }
                        },
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
          ),
        ],
      ),
    );
  }
}
