import 'package:flutter/material.dart';
import 'package:exploreskflutteryyyy/pages/attractions_page/dribbble_travel.dart';
class LocationSliderSingleItemContents extends StatelessWidget {
  final String image;
  final String title;
  final String subtitle;
  final int index;

  LocationSliderSingleItemContents({
    this.title,
    this.subtitle,
    this.image,
    this.index
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      //elevation: 4.0,
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Container(
              height: 80.0,
              child: new ClipRRect(
                  borderRadius: new BorderRadius.circular(1.0),
                  child: Stack(
                    fit: StackFit.expand,
                    alignment: FractionalOffset.center,
                    children: <Widget>[
                      Container(
                        decoration: new BoxDecoration(
                          boxShadow: [
                            new BoxShadow(
                              color: Colors.white,
                              offset: Offset(0.0,-10.0),
                              spreadRadius: 10.0,
                              blurRadius: 10.0
                            )
                          ]
                        ),
                        child: new Image.asset(image,fit: BoxFit.cover,)
                      ),
                      index == swipedIndex
                          ? new Container(
                        width: double.infinity,
                        height:double.infinity,
                        decoration: BoxDecoration(
                            gradient: new LinearGradient(
                                colors: [
                                  new Color.fromRGBO(33, 150, 243, 1.0),
                                  new Color.fromRGBO(0, 188, 212, 1.0),
                                  new Color.fromRGBO(140, 204, 255, 1.0),
                                ],
                                begin: new FractionalOffset(1.0, 0.0),
                                end: new FractionalOffset(0.0, 1.0),
                                stops: [0.2,0.6,1.0]
                            )
                        ),
                      )
                          : new Container(),
                      new Center(
                        child: new Icon(Icons.remove_red_eye,color: Colors.white,),
                      )
                    ],
                  )
              )
          ),
          new Container(height: 10.0,),
          new Text(
            title,
            textAlign: TextAlign.center,
            overflow: TextOverflow.clip,
            style: new TextStyle(
              color: Colors.black54,
              fontWeight: FontWeight.bold,
              fontSize: 15.0,
              fontFamily: "Lato",
            ),
          ),
          new Container(height: 10.0),
          new Text(
            "sikkim".toUpperCase(),
            style: new TextStyle(
                color: Colors.black38,
                fontSize: 11.0
            ),
          )
        ],
      ),
    );
  }
}




