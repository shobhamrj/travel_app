import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:exploreskflutteryyyy/pages/attractions_page/gradientOverlaysImage.dart';
import 'package:exploreskflutteryyyy/pages/interests/interests.dart';


class MapBoxGl extends StatefulWidget {
  @override
  _MapBoxGlState createState() => _MapBoxGlState();
}

class _MapBoxGlState extends State<MapBoxGl> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new Stack(
        children: <Widget>[

          new GradientOverlaysImage(),
          new InterestPage(
          )
        ],
      ),
    );
  }
}

