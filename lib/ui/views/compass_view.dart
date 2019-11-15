import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_compass/flutter_compass.dart';
import 'dart:math' as math;

class CompassView extends StatefulWidget {
  @override
  _CompassViewState createState() => _CompassViewState();
}

class _CompassViewState extends State<CompassView> {
  double _direction;

  @override
  void initState() {
    super.initState();
    _getDirection();
  }

  void _getDirection() {
    FlutterCompass.events.listen((double direction) {
      print(direction);
      setState(() {
        _direction = direction;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: Container(
        color: Colors.white,
        child: SafeArea(
          bottom: false,
          child: Scaffold(
            backgroundColor: Colors.white,
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: <Widget>[
                    _verticalSpace(32.0),
                    _title(),
                    _verticalSpace(32.0),
                    Image.asset('assets/images/kaaba.png'),
                    _verticalSpace(16.0),
                    Transform.rotate(
                        angle: ((_direction != null ? _direction + 65 : 0) *
                            (math.pi / 180) *
                            -1),
                        child: _compass()),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _title() {
    return Text(
      "Arah Kiblat",
      style: TextStyle(fontSize: 24.0),
    );
  }

  Widget _verticalSpace(double height) {
    return Container(height: height);
  }

  Widget _compass() {
    return Image.asset('assets/images/compass.png');
  }
}
