import 'package:exploreskflutteryyyy/pages/itineraryDetails/index.dart';
import 'package:flutter/material.dart';
import 'package:exploreskflutteryyyy/fluttery/framing.dart';


class FullScreenItinerary extends StatefulWidget {
final String title;
final String subtitle;
final String image;
final List gallery;
final String price;
final List<Map> itinerary;
final int nights;

FullScreenItinerary({
  this.subtitle,
  this.title,
  this.image,
  this.gallery,
  this.itinerary,
  this.price,
  this.nights
});

  @override
  _FullScreenItineraryState createState() => _FullScreenItineraryState();
}

class _FullScreenItineraryState extends State<FullScreenItinerary> with TickerProviderStateMixin{

  AnimationController swipePager;
  Animation<Offset> pageSwipeAnim;



  @override
  void initState(){
    super.initState();
    swipePager = new AnimationController(
        vsync: this,
        duration: Duration(milliseconds: 500)
    )..addListener((){
      print(pageSwipeAnim.value);
    })..addStatusListener((animation){

    });

    pageSwipeAnim = new Tween(begin: Offset(0.0,1.0),end: Offset(0.0,0.0)).animate(new CurvedAnimation(parent: swipePager, curve: Interval(0.0,1.0,curve: Curves.ease)));
  }

  Widget _chipLabel(){
    return new Container(
        margin: EdgeInsets.all(20.0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30.0),
            color: Colors.lightBlueAccent,
            gradient: LinearGradient(
                colors: [Color(0xFF52c9ff),Color(0xFF43c5ff),Colors.blue,Colors.blueAccent],
                begin: FractionalOffset.centerLeft,
                end: FractionalOffset.centerRight,
                stops: [0.2,0.5,0.8,1.0]
            ),
            boxShadow: [
              BoxShadow(
                  offset: Offset(0.0,5.0),
                  color: Colors.black.withOpacity(0.3),
                  spreadRadius: 5.0,
                  blurRadius: 10.0
              )
            ]
        ),
        padding: EdgeInsets.symmetric(horizontal:15.0,vertical:10.0),

        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Icon(Icons.card_travel,color: Colors.white,),
            Padding(
              padding: const EdgeInsets.only(left:8.0),
              child: new Text('Travel'.toUpperCase(),
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Lato',
                    fontWeight: FontWeight.bold
                ),
              ),
            ),

          ],
        )
    );
  }

  Widget _hBar(){
    return Padding(
      padding: EdgeInsets.symmetric(vertical:10.0,horizontal: 20.0),
      child: new Container(
        width: 80.0,
        height: 2.0,
        color: Colors.white70,
      ),
    );
  }

  Widget _footText(){
    return Padding(
      padding: const EdgeInsets.symmetric(vertical:15.0,horizontal: 20.0),
      child: new Row(
        children: <Widget>[
          Text(
            'From',
            style: TextStyle(
                color: Colors.white,
                fontFamily: 'Lato'
            ),
          ),
          Text(
            widget.price,
            style: TextStyle(
                color: Colors.lightBlueAccent,
                fontFamily: 'Lato',
                fontWeight: FontWeight.bold
            ),
          ),
          Text(
            ' For ${widget.nights} Nights',
            style: TextStyle(
                color: Colors.white,
                fontFamily: 'Lato'
            ),
          )
        ],
      ),
    );
  }

  Widget _subTitle(){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal:10.0,vertical:20.0),
      child: Row(
        children: <Widget>[
          Icon(
            Icons.location_on,
            color: Colors.white,
          ),
          Container(width:5.0),
          Text(
            widget.subtitle,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'Lato',
              fontSize: 16.0,
            ),
          ),
        ],
      ),
    );
  }

  Widget _title(){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal:15.0),
      child: Text(
       widget.title,
        style: TextStyle(
            color: Colors.white,
            fontFamily: 'Lato',
            fontSize: 27.0,
            fontWeight: FontWeight.bold
        ),
      ),
    );
  }

Widget _amenitiesBuilder(){
    List _amenitiesList = [
      {'title':'Hotel Included','icon':'Icons.hotel'},
      {'title':'Private transfers','icon':'directions_car'},
      {'title':'Breakfast','icon':'free_breakfast'},
      {'title':'Dinner','icon':'restaurant'},
    ];
    List<Widget> _amenitiesIcon = [
      Icon(Icons.hotel,color: Colors.white,),
      Icon(Icons.directions_car,color: Colors.white,),
      Icon(Icons.free_breakfast,color: Colors.white,),
      Icon(Icons.restaurant,color: Colors.white,),
    ];

   return Container(
     alignment: Alignment.center,
     height: 65.0,
     padding: const EdgeInsets.all(10.0),
     child: ListView.builder(
       scrollDirection: Axis.horizontal,
       itemCount: _amenitiesList.length,
      itemBuilder: (BuildContext context,int index){
          return SingleChip(
            text:  _amenitiesList[index]['title'].toUpperCase(),
            icon: _amenitiesIcon[index],
          );
        },
     ),
   );
}
  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: Scaffold(
          body: Stack(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  new Container(
                    width: double.infinity,
                    height: double.infinity,
                    child: new Image.asset(widget.image,fit: BoxFit.cover,),
                  ),
                  new Container(
                    width: double.infinity,
                    height: double.infinity,
                    color: Colors.black.withOpacity(0.3),
                    child: Opacity(opacity: 0.7,child: new Image.asset('images/shadow.png',fit: BoxFit.cover,)),
                  ),
                  new Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          padding:EdgeInsets.only(top:100.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              _chipLabel(),
                              _title(),
                              _subTitle(),
                              _hBar(),
                              _footText(),
                              GalleryBuilder(
                                imagesList: widget.gallery
                              ),
                              _amenitiesBuilder(),

                            ],
                          ),
                        )
                      ]
                  ),
                  Align(
                    alignment: FractionalOffset.bottomCenter,
                    child: Container(
                      height: 45.0,
                      //padding: const EdgeInsets.symmetric(horizontal:8.0,vertical:20.0),
                      child: GestureDetector(
                        behavior: HitTestBehavior.opaque,
                        onVerticalDragStart: (DragStartDetails details){
                          swipePager.forward(from:0.0);
                        },
                        child: new Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            new Icon(
                              Icons.info_outline,
                              color: Colors.white,
                            ),
                            new Text(
                              'Swipe up for more details',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Lato'
                              ),
                            ),
                            new Icon(
                              Icons.keyboard_arrow_up,
                              color: Colors.lightBlueAccent,
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
              AnimatedBuilder(
                animation: swipePager,
                builder: (BuildContext context , Widget child){
                  return new FractionalTranslation(
                    translation: Offset(pageSwipeAnim.value.dx , pageSwipeAnim.value.dy),
                    child: new PackageDetails(
                        optionalAnimController:swipePager,
                        schedule: widget.itinerary,
                    ),
                  );
                },
              )
            ],
          )
      ),
    );
  }
}




class GalleryBuilder extends StatefulWidget {
  final List imagesList;
  GalleryBuilder({
    this.imagesList
  });
  @override
  _GalleryBuilderState createState() => _GalleryBuilderState();
}

class _GalleryBuilderState extends State<GalleryBuilder> {

  Widget _singleGalleryItem(String itemPath){
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Stack(
        children: <Widget>[
          new Container(
            width: 50.0,
            height: 50.0,
            decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage(itemPath),fit: BoxFit.cover),
                borderRadius: BorderRadius.circular(5.0)
            ),
          ),
          Container(
            width: 50.0,
            height: 50.0,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Colors.blueAccent.withOpacity(0.4),Colors.white.withOpacity(0.2)],
                    begin: FractionalOffset.bottomLeft,
                    end: FractionalOffset.topRight,
                    stops: [0.2,1.0]
                ),
                borderRadius: BorderRadius.circular(5.0)
            ),
          )
        ],
      ),
    );
  }

  _buildChildren(){
    return widget.imagesList.map((item){
      return _singleGalleryItem(item);
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Container(
          height: 80.0,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: widget.imagesList.length,
              itemBuilder: (BuildContext context,int index){
                return _singleGalleryItem(widget.imagesList[index]);
              })
      ),
    );
  }
}



class SingleChip extends StatelessWidget {
  final String text;
  final Widget icon;
  SingleChip({
    this.icon,
    this.text
  });

  @override
  Widget build(BuildContext context) {
    return new Container(
        margin: EdgeInsets.symmetric(horizontal: 5.0),
        alignment: Alignment.center,
        height: 45.0,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30.0),
            color: Colors.lightBlueAccent,
            gradient: LinearGradient(
                colors: [Color(0xFF52c9ff),Color(0xFF43c5ff),Colors.blue,Colors.blueAccent],
                begin: FractionalOffset.centerLeft,
                end: FractionalOffset.centerRight,
                stops: [0.2,0.5,0.8,1.0]
            ),
            boxShadow: [
              BoxShadow(
                  offset: Offset(0.0,5.0),
                  color: Colors.black.withOpacity(0.3),
                  spreadRadius: 5.0,
                  blurRadius: 10.0
              )
            ]
        ),

        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal:15.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              icon,
              Padding(
                padding: const EdgeInsets.only(left:8.0),
                child: new Text('$text',
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Lato',
                      fontWeight: FontWeight.bold
                  ),
                ),
              ),

            ],
          ),
        )
    );
  }
}
