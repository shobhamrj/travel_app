import 'dart:async';

import 'package:flutter/material.dart';
import 'package:exploreskflutteryyyy/pages/attractions_page/dribbble_travel-details.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:exploreskflutteryyyy/pages/attractions_page/gradientOverlaysImage.dart';
import 'package:exploreskflutteryyyy/pages/attractions_page/sliderSingleItemContent.dart';
import 'package:exploreskflutteryyyy/pages/attractions_page/textOverlaysGradient.dart';






class FadeInSlideOutRoute<T> extends MaterialPageRoute<T> {
  FadeInSlideOutRoute({WidgetBuilder builder, RouteSettings settings})
      : super(builder: builder, settings: settings);

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    if (settings.isInitialRoute) return child;
    // Fades between routes. (If you don't want any animation,
    // just return child.)
    if (animation.status == AnimationStatus.reverse)
      return super.buildTransitions(context, animation, secondaryAnimation, child);
    return FadeTransition(opacity: animation, child: child);
  }
}


double swipedInterval = 1.0;
int swipedIndex;
String coverPic;
String coverTitle;
String urlPath;
double mapLat;
double mapLong;


List<Map> _attractions;
String locDescription;

class Locations extends StatefulWidget {
  final List<Map> displayItems;
  Locations({
      this.displayItems,
  });


  @override
  _LocationsState createState() => _LocationsState();
}

class _LocationsState extends State<Locations> with TickerProviderStateMixin{

  Offset startDrag;
  double translatePercent = 0.0;
  double draggedDistance = 0.0;
  Offset currScrolled ;
  AnimationController swipeController;
  Animation <double> swipeAnimation;
  AnimationController blinkEaseAnimationController;
  Animation <double> blinkEaseAnimation;

  Future <Null> _getDetails() async{
    final httpGet = await rootBundle.loadString(urlPath);
    print(httpGet);
    setState(() {
      locDescription = httpGet.trim().substring(0,150) + '...';
    });
  }


  @override
  void initState() {

    _attractions = widget.displayItems;
    print(_attractions);
    blinkEaseAnimationController = new AnimationController(vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    blinkEaseAnimation = new Tween(begin: 0.0,end: -6.0).animate(
        new CurvedAnimation(parent: blinkEaseAnimationController, curve: new Interval(
            0.0,0.7,curve: Curves.easeOut
        ))
    );


    swipeController = new AnimationController(vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    swipeAnimation = new Tween(begin: 30.0,end:10.0).animate(
        new CurvedAnimation(parent: swipeController, curve: new Interval(
            0.0,0.7,curve: Curves.easeOut
        ))
    )..addListener((){
      setState((){
        swipedInterval = swipeAnimation.value * 0.5;
        translatePercent = swipeAnimation.value;
        _getDetails();
      });
    })..addStatusListener((listener) async{
      if(listener == AnimationStatus.forward){
        await blinkEaseAnimationController.forward(from: 0.0);
       // await blinkEaseAnimationController.reverse();
      }
    });

    super.initState();
    coverPic = _attractions[0]['image'];
    coverTitle = _attractions[0]['title'];
    urlPath = _attractions[0]['urlPath'];
    mapLat = _attractions[0]['lat'];
    mapLong = _attractions[0]['long'];
    _getDetails();

  }

//  final String locDescription = 'Gangtok is the capital of the mountainous northern Indian state of Sikkim. Established as a Buddhist pilgrimage site in the 1840s';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: new Container(
        width: 70.0,
        height: 70.0,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                spreadRadius: 1.0,
                blurRadius: 5.0,
                offset: Offset(0.0,4.0)
              )
            ],
            gradient: new LinearGradient(
                colors: [
                  new Color.fromRGBO(33, 150, 243, 1.0),
                  new Color.fromRGBO(0, 188, 212, 1.0),
                  new Color.fromRGBO(140, 204, 255, 1.0),
                ],
                begin: new FractionalOffset(1.0, 0.0),
                end: new FractionalOffset(0.0, 1.0),
                stops: [0.2,0.6,1.0]
            ),
        ),
        child: new IconButton(iconSize: 30.0,icon: Icon(Icons.close,color: Colors.white,), onPressed: (){
          Navigator.of(context).pop();
        })
      ),
      body : new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new Stack(
              children: <Widget>[
                new Container(
                  height: 210.0,
                  width: double.infinity,
                  child: Hero(
                    tag: 'coverPic',
                    child: FadeInImage(
                        fadeInCurve: Curves.elasticOut,
                        fadeInDuration: const Duration(microseconds: 150),
                        placeholder: new AssetImage('images/shadow.png'),
                        image: new AssetImage(coverPic),fit: BoxFit.cover,),
                  )
                ),

                new GradientOverlaysImage(),
                new TextOverlaysGradient(
                  animationValues: blinkEaseAnimation,
                ),
                new Positioned(
                  right: 20.0,
                  top: 160.0,
                  child: new FloatingActionButton(backgroundColor: Colors.white,foregroundColor: Colors.black54,onPressed: (){

                    Navigator.push(context, new FadeInSlideOutRoute(builder: (BuildContext context){
                      return new DetailLocationPage(
                        coverPic: coverPic,
                        coverTitle: coverTitle,
                        detailPath: urlPath,
                      );
                    }));

                  },
                    child: new Icon(Icons.keyboard_arrow_right),),
                )

              ],
            ),
            new Divider(),

            AboutAndDescriptionText(blinkEaseAnimation: blinkEaseAnimation,),

            Padding(
              padding: const EdgeInsets.only(top:30.0),
              child: new Container(
                height: 190.0,
                decoration: new BoxDecoration(
                  boxShadow: [
                    new BoxShadow(
                      color: Colors.white.withOpacity(0.1),
                      offset: new Offset(0.0,-3.0),
                      spreadRadius: 15.0,
                      blurRadius: 15.0
                    )
                  ],
                  gradient: new LinearGradient(
                    colors: [Colors.transparent ,new Color(0xFFEFEFEF).withOpacity(0.3)],
                    begin: new FractionalOffset(0.0, 0.0),
                    end: new FractionalOffset(0.0, 1.0),
                    stops: [0.3,1.0]
                  )
                ),

                child: new ListView.builder(scrollDirection: Axis.horizontal,itemCount: _attractions.length,itemBuilder: (context,index){
                  return new SliderHorizontalItem(
                    image: _attractions[index]['image'],
                    title: _attractions[index]['title'],
                    subtitle: _attractions[index]['subtitle'],
                    translatePercent: 0.0,
                    swipeAnimation: swipeAnimation,
                    swipeController: swipeController,
                    index: index,
                  );
                }),
              ),
            )
          ],
        ),
    );
  }
}


class SliderHorizontalItem extends StatefulWidget {

  final String image;
  final String title;
  final String subtitle;
  final int index;
  final AnimationController swipeController;
  final Animation <double> swipeAnimation;


  final double translatePercent;
  SliderHorizontalItem({
    this.image,
    this.title,
    this.subtitle,
    this.translatePercent,
    this.index,
    this.swipeAnimation,
    this.swipeController,
    Key key
  }):super(key:key);

  @override
  _SliderHorizontalItemState createState() => _SliderHorizontalItemState();
}

class _SliderHorizontalItemState extends State<SliderHorizontalItem> with TickerProviderStateMixin{

  _updateDescription() async{
    locDescription = (await rootBundle.loadString(urlPath)).trim().substring(0,150)+ '...';
  }
  void onVerticalDragStart (DragStartDetails details){
    swipedIndex = widget.index;
    _playAnim();

    setState (() {
      swipedIndex = widget.index;
      coverPic = _attractions[swipedIndex]['image'];
      coverTitle = _attractions[swipedIndex]['title'];
      urlPath = _attractions[swipedIndex]['urlPath'];
      mapLat = _attractions[swipedIndex]['lat'];
      mapLong = _attractions[swipedIndex]['long'];
      _updateDescription();
    });
  }




  Future<Null> _playAnim() async{
    try{
     await widget.swipeController.forward();
     await widget.swipeController.reverse();
    }on TickerCanceled{}
  }




  Widget _tileList(BuildContext context,Widget child){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: new GestureDetector(
        behavior: HitTestBehavior.opaque,
        onVerticalDragStart: onVerticalDragStart,
        child: new Transform(
          transform: new Matrix4.translationValues(0.0,  swipedIndex == widget.index ? ( widget.swipeAnimation.value )  : widget.swipeAnimation.value   * 1.3 , 0.0),
          child: new Container(
            decoration: new BoxDecoration(
              color: Colors.white.withOpacity(0.7),
            ),
            width: 100.0,
            height: double.infinity,
            child: new LocationSliderSingleItemContents(
              title: widget.title,
              subtitle: widget.subtitle,
              image: widget.image,
              index: widget.index,
            ),
          ),
        ),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return new AnimatedBuilder(
       builder: _tileList,
       animation: widget.swipeController,
    );
  }
}




class AboutAndDescriptionText extends StatelessWidget {

  Animation<double> blinkEaseAnimation;

  AboutAndDescriptionText({
    this.blinkEaseAnimation
  });
  @override
  Widget build(BuildContext context) {
    return new Container(
      margin: const EdgeInsets.only(left:20.0,top:20.0),
      decoration: new BoxDecoration(
        borderRadius: new BorderRadius.circular(10.0),
        //color: Colors.black26,
      ),
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top:1.0,left: 5.0),
            child: new Transform.translate(
              offset: new Offset(0.0, blinkEaseAnimation.value * 0.9),
              child: new Text('ABOUT',
                  style: new TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black45,
                      fontSize: 20.0
                  )
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(top:2.0,left: 5.0),
            child: Container(
              height: 60.0,
              child: new Transform.translate(
                  offset: new Offset(0.0, blinkEaseAnimation.value * 0.5),
                  child: new Text(locDescription !=null ?  locDescription : '...' ,overflow: TextOverflow.clip,style: new TextStyle(height: 1.2,color: Colors.black38,fontFamily: 'Lato'))),
            ),
          ),
        ],
      ),
    );
  }
}
