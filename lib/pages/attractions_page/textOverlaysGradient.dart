import 'package:flutter/material.dart';
import 'package:exploreskflutteryyyy/pages/attractions_page/dribbble_travel.dart';


class TextOverlaysGradient extends StatelessWidget {
 final Animation animationValues;

 TextOverlaysGradient({
    this.animationValues
  });

  @override
  Widget build(BuildContext context) {
    return new Container(
      padding: new EdgeInsets.only(top:170.0),
      width: double.infinity,
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left:25.0),
            child: new Transform.translate(
              offset: new Offset(0.0, animationValues.value),
              child: new Text(coverTitle,
                  overflow: TextOverflow.ellipsis,
                  style: new TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Lato',
                      fontSize: 33.0,
                      color: new Color(0xFF737373)
                  )
              ),
            ),
          ),
          Container(
            width: double.infinity,
            decoration: new BoxDecoration(
              color: Colors.white,
              boxShadow: [
                new BoxShadow(
                    color: Colors.white,
                    offset: new Offset(0.0,16.0),
                    spreadRadius: 10.0,
                    blurRadius: 15.0
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.only(left:25.0,top:10.0),
              child: new Text('East Sikkim - 20000 FT / Travel'.toUpperCase(),style: new TextStyle(fontFamily: 'Poiret-One',color:Colors.black26,fontSize: 15.0,fontWeight: FontWeight.bold),),
            ),
          ),

        ],
      ),
    );
  }
}
