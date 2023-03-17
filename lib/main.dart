import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:testing/Recording/profile.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Wallet',
      debugShowCheckedModeBanner: false,
      home: ProfilePage(),
    );
  }
}
