import 'package:country_code_picker/country_localizations.dart';
import 'package:flutter/material.dart';
import 'package:hunger/screens/Login_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      supportedLocales: [
        Locale('en', 'us'),
      ],
      localizationsDelegates: [
        CountryLocalizations.delegate,
      ],
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        backgroundColor: Colors.pink[100],
      ),
      home: LoginScreen(),
    );
  }
}
