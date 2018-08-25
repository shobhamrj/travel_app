import 'package:flutter/material.dart';


class GradientOverlaysImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top:50.0),
          child: new Container(

            width: double.infinity,
            height: 160.0,
            decoration: new BoxDecoration(
              gradient: new LinearGradient(
                  colors: [new Color(0x00FFFFFF),new Color(0xFFFFFFFF)],
                  begin: new FractionalOffset(0.0,0.0),
                  end: new FractionalOffset(0.0, 1.0),
                  stops: [0.3,0.8]
              ),
            ),
          ),
        ),
      ],
    );
  }
}