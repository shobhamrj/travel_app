import 'package:flutter/material.dart';
import 'package:exploreskflutteryyyy/fluttery/framing.dart';
import 'package:exploreskflutteryyyy/fluttery/src/layout_core.dart';
import 'package:exploreskflutteryyyy/fluttery/src/layout_overlays.dart';

List<Package> _pkgList = [
  new Package(
    image: 'images/card1.jpg',
    title: 'North Sikkim',
    centerText: 'Rs 5000'
  ),
  new Package(
      image: 'images/login.jpg',
      title: 'East Sikkim',
      centerText: 'Rs 5000'
  ),
  new Package(
      image: 'images/card2.jpg',
      title: 'West Sikkim',
      centerText: 'Rs 5000'
  )
];

class Package{
  final String image;
  final String title;
  final String centerText;
  Package({
    this.title,
    this.image,
    this.centerText
  });
}

class PackagesList extends StatefulWidget {
  int activePkgIndex;
  @override
  _PackagesListState createState() => _PackagesListState();
}

class _PackagesListState extends State<PackagesList> {

Offset dragPercent = Offset(0.0,0.0);
Offset dragStart;
Offset dragEnd;

  void onPanStart(DragStartDetails details){
    setState(() {
      dragStart = details.globalPosition;
    });
  }

  void onPanUpdate(DragUpdateDetails details){
    setState(() {
      dragPercent = details.globalPosition - dragStart;
      print(dragPercent);
    });
  }

  void onPanEnd(DragEndDetails details){
    setState(() {
      dragStart = null;
      dragEnd = null;
    });
  }

  @override
  void initState(){
    super.initState();
    widget.activePkgIndex = 0;
  }

  Widget _bgImage(){
    return new Image.asset(
      _pkgList[widget.activePkgIndex].image,fit: BoxFit.cover,
    );
}

Widget _bgFilter(){
    return Opacity(
      opacity: 0.4,
      child: new Image.asset(
        'images/shadow.png',fit: BoxFit.cover,
      ),
    );
}

_prevImage(){
    print('prev');
    setState(() {
      widget.activePkgIndex =
      widget.activePkgIndex > 0 ? widget.activePkgIndex - 1 : 0;
    });
}
  _nextImage(){
    print('next');
    setState(() {
      widget.activePkgIndex =
      widget.activePkgIndex < _pkgList.length - 1
          ? widget.activePkgIndex + 1 : _pkgList.length -1;
    });
  }

Widget _overlayText(){
    return Stack(
      fit:StackFit.expand,
      children: <Widget>[
        new Column(
          //mainAxisSize: MainAxisSize.min,
          children: <Widget>[

            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    _pkgList[widget.activePkgIndex].title.toUpperCase(),
                    style:TextStyle(
                      color: Colors.white,
                      fontFamily: 'Lato',
                      fontSize: 30.0
                    )
                  ),
                  new Container(
                    margin: EdgeInsets.only(top:10.0),
                    color: Colors.white,
                    alignment: Alignment.center,
                    width: 70.0,
                    height: 2.0,
                  )
                ],
              ),
            ),
            Expanded(child: Container(),),
            Container(
              alignment: Alignment.center,
              width: 150.0,
              height: 150.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white,width: 1.0)
              ),
              child: Text(
                  _pkgList[widget.activePkgIndex].centerText,
                  style:TextStyle(
                      color: Colors.white,
                      fontSize: 25.0
                  )
              ),
            ),
            Expanded(child: Container(),),
            Padding(
              padding: const EdgeInsets.only(bottom:20.0),
              child: Container(
                width: 150.0,
                padding: EdgeInsets.all(7.0),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.0),
                  border: Border.all(
                    color: Colors.white,
                    width: 1.0
                  )
                ),
                child: new Text(
                  'See Details',
                    style:TextStyle(
                        color: Colors.white,
                        fontSize: 15.0
                    )
                ),
              ),
            ),
          ],
        ),
        new GestureDetector(
          onTap: (){
            _prevImage();
          },
          child: new FractionallySizedBox(
            alignment: Alignment.topLeft,
            heightFactor: 1.0,
            widthFactor: 0.5,
            child: new Container(color: Colors.transparent,)
          ),
        ),
        new GestureDetector(
          onTap: (){
            _nextImage();
          },
          child: new FractionallySizedBox(
            alignment: Alignment.bottomRight,
            heightFactor: 1.0,
            widthFactor: 0.5,
            child: new Container(color: Colors.transparent,)
          ),
        ),
      ],
    );
}

Widget packageCard(){
    return new Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(top: 100.0),
        ),
        Expanded(
          child: Container(
            margin: const EdgeInsets.only(bottom:20.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical:20.0,horizontal: 30.0),
                child: Container(
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 10.0,
                            spreadRadius: 3.0,
                            color: Color(0xFF5f3544),
                            offset: Offset(0.0,10.0)
                        ),
                        BoxShadow(
                            blurRadius: 10.0,
                            spreadRadius: 0.0,
                            color: Color(0xFF5f3544).withOpacity(0.7),
                            offset: Offset(0.0,-10.0)
                        ),

                      ]
                  ),
                  child: Transform(
                    transform: Matrix4.translationValues(dragPercent.dx,0.0,0.0),
                    child: GestureDetector(
                      onPanStart: onPanStart,
                      onPanEnd: onPanEnd,
                      onPanUpdate: onPanUpdate,
                      child: new Card(
                        elevation: 10.0,
                        child: new Stack(
                          fit: StackFit.expand,
                          children: <Widget>[
                            _bgImage(),
                            _bgFilter(),
                            _overlayText()
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            )
          ),
        ),

      ],
    );
}

Widget _buildOverlay(){
    return packageCard();
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: new Stack(
          children: <Widget>[
            new _bgGradient(),
            _buildOverlay()
          ],
        ),
      ),
    );
  }
}

class _bgGradient extends StatelessWidget {
  Color topColor = new Color(0xFF723d4d);
  Color bottomColor = Colors.white;
  //new Color(0xFF2d2135);

  @override
  Widget build(BuildContext context) {
    return new Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [topColor, bottomColor],
          begin: FractionalOffset.topLeft,
          end : FractionalOffset.bottomRight,
          stops: [0.1,1.0]
        )
      ),
    );
  }
}
