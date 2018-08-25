import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';


Color themeColor = Color(0xFF63739c);

class HotelListing extends StatefulWidget {
  @override
  HotelListingState createState() {
    return new HotelListingState();
  }
}

class HotelListingState extends State<HotelListing> with TickerProviderStateMixin{

  final List<Map> _hotels = [
    {"title":"Hotel Lachung","location":"Lachung , Sikkim","image":"images/hotel/slider1.jpg","rating":"5.0"},
    {"title":"Sim Retreat","location":"Gangtok , Sikkim","image":"images/hotel/slider3.jpg","rating":"5.0"},
    {"title":"Woods of Past","location":"Pelling , Sikkim","image":"images/hotel/slider2.jpg","rating":"5.0"},
  ];

  AnimationController swipeAnimationController;
  Animation<double> swipeAnimation;
  double count = 0.0;
  var sizeScreen = 0.0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    swipeAnimationController = new AnimationController(
      vsync: this,
      duration: Duration(seconds:1)
    )..addStatusListener((listener){
       if(swipeAnimationController.isCompleted){
         ++count;
       }
    });

    swipeAnimation = new Tween(begin: 0.0,end:-1.0).animate(
      new CurvedAnimation(
        parent: swipeAnimationController,
        curve: new Interval(0.1,0.8,curve: Curves.ease)
      )
    );
  }


 Widget _buildItems(){
    return Expanded(
      child: new CarouselSlider(
          items: [0,1,2].map((i) {
            return new Builder(
              builder: (BuildContext context) {
                return Container(margin: EdgeInsets.all(5.0),
                    child: new SingleHotelItem(
                      title:_hotels[i]['title'],
                      location:_hotels[i]['location'],
                      image:_hotels[i]['image']
                    ));
              },
            );
          }).toList(),
        autoPlay: true,
        interval: const Duration(seconds: 5),
        autoPlayCurve: Curves.easeInOut,
        autoPlayDuration: const Duration(milliseconds: 800),
        height: 470.0,
        viewportFraction: 0.8,
        aspectRatio: 16/9,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    sizeScreen = MediaQuery.of(context).size.height;
    print(sizeScreen);

    return new Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        actions: <Widget>[
          new Container(width: 5.0),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: new Material(
              shape: new CircleBorder(),
              child: new Image.asset('images/profile.jpg'),
            ),
          ),
        ],
        backgroundColor: Colors.white,
        centerTitle: true,
        leading: new IconButton(icon: Icon(Icons.menu,color: Colors.black26,), onPressed: (){}),
        title: Text('HOTELS',style: TextStyle(color:Colors.black45,fontWeight: FontWeight.bold),),
        elevation: 0.0,
      ),
      body: Stack(
        children: <Widget>[
          new Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: new BoxDecoration(
              gradient: new LinearGradient(
                  colors: [new Color(0xFFFFFFFF) , new Color(0xFF63739c)],
                  begin: new FractionalOffset(0.0, 0.0),
                  end: new FractionalOffset(0.0, 1.0),
                  stops: [0.1,1.0]
              ),
            ),
          ),
          Column(
            children: <Widget>[
              Container(
                height: 40.0,
                child: new ListView(
                  scrollDirection: Axis.horizontal,
                  children: List.generate(5,(index){
                    return new Material(
                      borderRadius: BorderRadius.circular(55.0),
                      color: Colors.transparent,
                      child: new InkWell(
                        onTap: (){},
                        child: new Container(
                          margin: EdgeInsets.symmetric(horizontal: 4.0),
                          alignment: FractionalOffset.center,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(55.0),
                              color:Color(0xFF63739c),
                              gradient: new LinearGradient(
                                  colors: [Colors.purpleAccent ,Colors.deepPurpleAccent],
                                  begin: FractionalOffset.topLeft,
                                  end: FractionalOffset.topRight,
                                  stops: [0.1,1.0]
                              ),
                          ),
                          padding: EdgeInsets.all(10.0),
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: new Text(
                              'Gangtok'.toUpperCase(),
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 13.0,
                                fontWeight:FontWeight.bold
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              ),
              AnimatedBuilder(
                animation: swipeAnimationController,
                builder: (BuildContext context , Widget child){
                  return _buildItems();
                },
              ),

            ],
          ),
        ],
      ),
    );
  }
}



class SingleHotelItem extends StatefulWidget {
  final String title;
  final String image;
  final String location;
  SingleHotelItem({
    this.image,
    this.location,
    this.title
  });

  @override
  _SingleHotelItemState createState() => _SingleHotelItemState();
}

class _SingleHotelItemState extends State<SingleHotelItem> {


  Widget _backgroundImage(){
    return Card(
      child: new Container(
        decoration: new BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: new Stack(
          children: <Widget>[
            new Image.asset(widget.image,fit: BoxFit.cover,),
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                new IconButton(icon: new Icon(Icons.favorite_border,color: Colors.white,), onPressed: (){}),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _hotelBody(){
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.0),
      ),
      margin: EdgeInsets.only(top:140.0),
      height: 230.0,
      child: new Column(
        children: <Widget>[
          new Expanded(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: new Column(
                  children: <Widget>[
                    new ListTile(
                      title: Text(widget.title,style: TextStyle(color: Colors.black54,fontSize: 20.0,fontWeight: FontWeight.bold),),
                      subtitle: Text(widget.location,style: TextStyle(color:Colors.grey),),
                      contentPadding: EdgeInsets.all(2.0),
                      trailing:new Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(width:20.0,height: 20.0,child: Image.asset('images/inr.png')),
                          Text(' 2400')
                        ],
                      ),
                    ),
                    Divider(),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 2.0),
                      child: new Text(
                        'Hotel Lachung is also fokin Hotel Lachung is also fokinHotel Lachung is also fokinHotel Lachung is also fokin',
                        style: TextStyle(
                            fontSize: 13.0,
                            color: Colors.black54,
                            height: 1.2,
                            wordSpacing: 1.5
                        ),
                      ),
                    )

                  ],
                ),
              )
          ),
          Material(
            borderRadius: BorderRadius.only(bottomLeft:Radius.circular(10.0),bottomRight:Radius.circular(10.0) ),
            color: Colors.white,
            elevation: 10.0,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: new Row(
                children: <Widget>[
                  Expanded(child: new Icon(Icons.directions_car,color:themeColor)),
                  Expanded(child: new Icon(Icons.restaurant_menu,color:Colors.black12)),
                  Expanded(child: new Icon(Icons.local_bar,color:themeColor,)),
                  Expanded(child: new Icon(Icons.wifi,color:themeColor)),
                  Expanded(child: new Icon(Icons.music_note,color:Colors.black12)),

                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _labelText(){
    return Positioned(
      top:130.0,
      right: 20.0,
      child: Container(
        alignment: Alignment.centerRight,
        width: 70.0,
        height: 30.0,
        decoration: BoxDecoration(
            color: themeColor,
            borderRadius: BorderRadius.circular(15.0)
        ),
        child: Center(
            child:Text(
              '4.5/5',style: TextStyle(color: Colors.white),
            )
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top:10.0),
      //margin: EdgeInsets.all(20.0),
      child: Column(
        children: <Widget>[
          new Stack(
            children: <Widget>[
              _backgroundImage(),
              _hotelBody(),
              _labelText()
            ],
          ),
        ],
      ),
    );
  }
}
