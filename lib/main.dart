import 'package:arah_kiblat/ui/views/compass_view.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Arah Kiblat',
      theme: ThemeData(),
      home: CompassView(),
    );
  }
}