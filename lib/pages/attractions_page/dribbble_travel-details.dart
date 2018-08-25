import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

String locationDetails;

class DetailLocationPage extends StatefulWidget {

  final String coverPic;
  final String coverTitle;
  final String detailPath;
  DetailLocationPage({
    this.coverPic,
    this.coverTitle,
    this.detailPath
  });


  @override
  _DetailLocationPageState createState() => _DetailLocationPageState();
}

class _DetailLocationPageState extends State<DetailLocationPage>{

  Future <Null> _getDetails() async{
    final httpGet = await rootBundle.loadString(widget.detailPath);
     print(httpGet);
    setState(() {
      locationDetails = httpGet;
    });
  }

  @override
  void initState(){
    _getDetails();
    print(widget.detailPath);
  }

  @override

  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: new CustomScrollView(
          slivers: <Widget>[
            new SliverAppBar(
              expandedHeight: 200.0,
              backgroundColor: Theme.of(context).primaryColor,
              pinned: true,
              flexibleSpace: new FlexibleSpaceBar(
                  title: new Text(widget.coverTitle,style: TextStyle(color: Colors.white),),
                  background: new Stack(
                    fit: StackFit.expand,
                    children: <Widget>[
                      Hero(tag:'coverPic',child: new Image.asset(widget.coverPic,fit: BoxFit.cover,)),
                      new BlackGradientOverlaysImage(),
                      new Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Container(
                            height: 40.0,
                            width: double.infinity,
                          )
                        ],
                      )
                    ],
                  )
              ),
            ),
            new SliverList(delegate: SliverChildListDelegate([
              new BodyContents(
                coverTitle: widget.coverTitle,
                coverPic: widget.coverPic,
              )
            ])
            )
          ],
        )
    );
  }
}



class BodyContents extends StatelessWidget {
  final String coverPic;
  final String coverTitle;

  BodyContents({
    this.coverPic,
    this.coverTitle,
  });
  @override
  Widget build(BuildContext context) {
    return new Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        new Stack(
          children: <Widget>[


            Container(
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  new TextOverlaysGradientForDetailPage(
                    coverTitle: coverTitle,
                    subTitle: 'East Sikkim - 20000 FT / Travel',
                  ),
                  new Divider(),

                  Padding(
                    padding: const EdgeInsets.only(top:20.0,left:15.0),
                    child: new Text('ABOUT',
                        style: new TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black54,
                            fontSize: 20.0
                        )
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top:20.0,left:10.0,right: 10.0),
                    child: locationDetails == null || locationDetails == ''
                        ? new Center(child: new CircularProgressIndicator())
                        : new Text(locationDetails,
                        style: new TextStyle(
                          color: Colors.black54,
                          fontSize:15.0,
                          height: 1.2,
                          fontWeight: FontWeight.w300,
                          wordSpacing: 1.7,

                        )
                      ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top:20.0),
                    child: new Container(
                        decoration: new BoxDecoration(
                            gradient: new LinearGradient(
                                colors: [Colors.white,new Color(0xFFEFEFEF).withOpacity(0.5)],
                                begin: new FractionalOffset(0.0, 0.0),
                                end: new FractionalOffset(0.0, 1.0),
                                stops: [0.0,1.0]
                            )
                        ),
                        height: 250.0,
                        child: Container()
                    ),
                  )
                ],
              ),
            )

          ],
        ),

      ],
    );
  }
}



class BlackGradientOverlaysImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top:50.0),
          child: new Container(
            width: double.infinity,
            height: 160.0,
            decoration: new BoxDecoration(
                gradient: new LinearGradient(
                    colors: [new Color(0x001D1D1D),new Color(0xFF1A1A1A).withOpacity(0.8)],
                    begin: new FractionalOffset(0.0,0.1),
                    end: new FractionalOffset(0.0, 1.0),
                    stops: [0.1,1.0]
                )
            ),
          ),
        ),
      ],
    );
  }
}


class TextOverlaysGradientForDetailPage extends StatelessWidget {
  final String coverTitle;
  final String subTitle;

  TextOverlaysGradientForDetailPage({
    this.coverTitle,
    this.subTitle
  });
  @override
  Widget build(BuildContext context) {
    return new Container(
      padding: new EdgeInsets.only(top:2.0),
      width: double.infinity,
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left:25.0,top:10.0),
            child: new Text(subTitle.toUpperCase(),style: new TextStyle(fontFamily: 'Poiret-One',color:Colors.black26,fontSize: 15.0,fontWeight: FontWeight.bold),),
          ),

        ],
      ),
    );
  }
}
