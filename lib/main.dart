import 'package:flutter/material.dart';
import 'package:quran/View/Maryam_Lectures/maryam_contents.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: MaterialApp(
        home: MaryamContentScreen(),
      ),
    );
  }
}


