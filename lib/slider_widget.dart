import 'dart:ui';

import 'package:flutter/material.dart';

List<viewModel> _cardList = [
  new viewModel(
    title: 'Changu',
    subtitle: "East Sikkim",
    imageUrl: 'images/card5.jpg',
  ),
  new viewModel(
    title: 'Seven Sister Falls',
    subtitle: "North Sikkim",
    imageUrl: 'images/card3.jpg',
  ),
  new viewModel(
    title: 'Lachung',
    subtitle: "East Sikkim",
    imageUrl: 'images/card1.jpg',
  )
];


class viewModel{
  final title;
  final subtitle;
  final imageUrl;
  viewModel({
    this.title,
    this.subtitle,
    this.imageUrl,
  });
}

class DetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Column(
      children: <Widget>[
        new Expanded(child: new CardFlipper(),)
      ],
    );
  }

}



class MyCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Stack(
      fit: StackFit.expand,
      children: <Widget>[

        new Padding(
          padding:new EdgeInsets.all(10.0),
          child: new ClipRRect(
              borderRadius:new BorderRadius.circular(10.0),
              child: new Image.asset('images/card3.jpg',fit: BoxFit.cover,)
          ),
        ),

        new Padding(
          padding: const EdgeInsets.all(20.0),
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              new Text(
                '10th Seteer'.toUpperCase(),
                style: new TextStyle(
                    color: Colors.white,
                    fontSize: 30.0,
                    fontFamily: 'Poiret-One',
                    fontWeight: FontWeight.bold
                ),
              ),

              new Expanded(child: new Container(),),
              new Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  new Text(
                    '2-3',
                    style: new TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 130.0,
                        letterSpacing: -5.0,
                        fontFamily: 'Poiret-One',
                        color: Colors.white
                    ),
                  ),
                  new Text(
                    'FT',
                    style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white
                    ),
                  )
                ],
              ),
              new Expanded(child: new Container(),),

              new Container(
                padding: new EdgeInsets.symmetric(vertical: 5.0,horizontal: 10.0),
                decoration: new BoxDecoration(
                  color: Colors.black.withOpacity(0.6),
                  border: new Border.all(color: Colors.white,),
                  borderRadius: new BorderRadius.circular(30.0),
                ),
                child: new Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    new Icon(Icons.wb_sunny,color: Colors.white,),
                    new Text(
                      'Sunny',
                      style: new TextStyle(
                        color: Colors.white,

                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),


      ],
    );
  }
}

class CardFlipper extends StatefulWidget {
  @override
  _CardFlipperState createState() => _CardFlipperState();
}

class _CardFlipperState extends State<CardFlipper> with TickerProviderStateMixin{
  double scrollPercent = 0.0;
  Offset startDrag;
  double endDrag;
  double initialScrollValue;
  AnimationController cardEndAnimation;
  double finishScrollStart;
  double finishScrollEnd;
  double endScrollEnd;
  AnimationController automaticScrollController;
  Animation <double> automaticScroll;

  @override
  void initState(){

    automaticScrollController = new AnimationController(
      vsync: this,
      duration: const Duration(seconds: 10),
    );

    automaticScroll = new Tween(begin: 0.0,end: 0.67).animate(automaticScrollController)..addListener((){
      setState(() {
        print(automaticScroll.value);
        scrollPercent = automaticScroll.value;
      });
    });

    automaticScrollController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        automaticScrollController.reverse();
      } else if (status == AnimationStatus.dismissed) {
        automaticScrollController.forward();
      }
    });


    //automaticScrollController.forward(from:0.0);

    cardEndAnimation = new AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 500),
    )..addListener((){
      setState((){
        scrollPercent = lerpDouble(finishScrollStart,finishScrollEnd,cardEndAnimation.value);
      });
    });
  }


  void _onHorizontalDragStart(DragStartDetails details){

    startDrag = details.globalPosition;
    initialScrollValue = scrollPercent;
  }

  void _onHorizontalDragEnd(DragEndDetails details){
    finishScrollStart = scrollPercent;
    finishScrollEnd = (scrollPercent * _cardList.length).round()  / _cardList.length;
    cardEndAnimation.forward(from:0.0);
    setState(() {
      startDrag = null;
      initialScrollValue = null;
    });
  }

  _onHorizontalDragUpdate(DragUpdateDetails details){
    final currDrag = details.globalPosition;
    final dragDistance = currDrag.dx - startDrag.dx;
    final singleCardDragPercent = dragDistance / context.size.width;
    final _numCards = _cardList.length;
    setState(() {
      scrollPercent = (initialScrollValue + (-singleCardDragPercent / _numCards)).clamp(0.0, 1.0 - ( 1/_numCards));
    });
  }

  List<Widget> _buildCards(){
    int _inc = -1;
      return _cardList.map((_cardModel){
        ++_inc;
        return _buildSingleCard(_inc,_cardList.length,scrollPercent,_cardModel);
      }).toList();
  }

  Widget _buildSingleCard(int cardIndex,int cardCount , double scrollPercent , viewModel _cardModel){
    final double singleCardScroll = scrollPercent /( 1 / cardCount);
    final double parallax = scrollPercent - (cardIndex / cardCount);
    return new FractionalTranslation(
      translation: new Offset(cardIndex - singleCardScroll,0.0),
      child: new BannerCard(
        model: _cardModel,
        parallaxPercent: parallax,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      onHorizontalDragStart: _onHorizontalDragStart,
      onHorizontalDragEnd: _onHorizontalDragEnd,
      onHorizontalDragUpdate: _onHorizontalDragUpdate,
      behavior: HitTestBehavior.translucent,
      child: new Stack(
        children: _buildCards(),
      ),
    );
  }

}



class BannerCard extends StatelessWidget {
  final viewModel model;
  final double parallaxPercent;

  BannerCard({
    this.model,
    this.parallaxPercent
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal:10.0,vertical: 10.0),
      child: ClipRRect(
        borderRadius: new BorderRadius.circular(10.0),
        child: new FractionalTranslation(
          translation: new Offset(2 * parallaxPercent, 0.0),
          child: new Stack(
            fit: StackFit.expand,
            children: <Widget>[
              new Image.asset(
                model.imageUrl,
                fit: BoxFit.cover,
              ),
              Opacity(
                opacity: 0.3,
                child: new Image.asset(
                    'images/shadow-overlay.png',
                    fit:BoxFit.cover
                ),
              ),
              new FractionalTranslation(
                translation: new Offset(-2.6 * parallaxPercent,0.0),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: new Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      new Expanded(flex: 2,child: new Container(),),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          new Text(
                            model.title.toUpperCase(),
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 30.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top:10.0),
                        child: new Text(
                          model.subtitle,
                          style: TextStyle(
                            color: Colors.white,
                            letterSpacing: 1.1,
                            fontSize: 18.0,
                            fontFamily: 'Poiret-One',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),

                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}



class CustomLoader extends StatefulWidget {
  @override
  _CustomLoaderState createState() => _CustomLoaderState();
}



class _CustomLoaderState extends State<CustomLoader> with TickerProviderStateMixin{
  Animation <double> widthController;
  Animation <double> shiftController;
  AnimationController loadingController;
  @override
  void initState() {
    super.initState();
     loadingController = new AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );

    widthController = new Tween(begin: 0.0,end: 100.0).animate(loadingController)..addListener((){
      setState(() {

      });
    });

    shiftController = new Tween(begin: 0.0,end: 1.0).animate(loadingController)..addListener((){
      setState(() {

      });
    });
    shiftController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        loadingController.reverse();
    } else if (status == AnimationStatus.dismissed) {
        loadingController.forward();
    }
    });

    loadingController.forward();
  }

  @override
  void dispose() {
    loadingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FractionalTranslation(
      translation: new Offset(shiftController.value,0.0),
      child: Container(
        color: Colors.blue,
        width: widthController.value,
      ),
    );
  }
}
