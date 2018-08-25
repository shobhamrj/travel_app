import 'dart:async';

import 'package:exploreskflutteryyyy/components/arcClipper.dart';
import 'package:flutter/material.dart';
import 'package:exploreskflutteryyyy/fluttery/framing.dart';

int activeDay = 0;
bool showBookBtn = true;
String bgPic = 'images/card4.jpg';


class PackageModel{
  final List<Map> schedule;
  PackageModel(
      this.schedule
      );
}


List<Map> northSikkimSchedule = [
  {"title":" Siliguri/New Jalpaiguri Station/Badogra to Gangtok","image":"images/card1.jpg","details":"Guest will be received by our official at Bagdogra Airport (IXB) / New Jalpaiguri Railway Station (NJP) / Tenzing Norgay Bus Terminus (Junction) - He will assist you for the forwarding journey to Gangtok - Nearly 135 Kilometers, 3 - 4 hours drive - A perfect destination for tourist in search of enchantment, tranquility, trekking or any other adventure - Land of monastery, mystic rituals / festivals at an elevation of 1,437 meters / 4,715 feet is the most often visited spot of India for its rare Orchids and Butterflies - In the evening one is free to stroll around M G Marg / Local Market - Over night stay at Gangtok<"},
  {"title":"Gangtok to Lachen","image":"images/card5.jpg","details":"Next the vehicle will report for North Sikkim with permit -Drive to Lachen - Chungthang is nearly 96 kilometers from Gangtok - On the way stop at Chungthang - Next drive for 29 kilometers from Chungthang to Lachen - Reach Lachung late afternoon / early evening - The snow capped peaks, the Shingbha wild life sanctuary, Gurudongmar, Thangu, Chopta Valley and Green Lake are the major attractions of the region - It is almost like this town is hidden from the outside - The infrastructure is not good due to the remoteness and the snowfall / Rainfall - The place is worth visiting - Check into a hotel - Welcome Tea - Evening free to stroll or visit the Lachen Monastery and visit the Lepcha Village - Overnight stay at Hotel in Lachen"},
  {"title":"Lachen - Gurudongmar Lake - Lachung","image":"images/card4.jpg","details":"Early morning breakfast - The route is Lachen - Thangu - Chopta Valley - Gurudongmar lake - Lachen - Drive 55 kilometers from Lachen stop at 15000 feet for permit to be signed - Drive the rest and visit to Gurudongmar Lake - 3 hour - A valley at an altitude of nearly 15 800 feet through which Lachen Chu flows - This is a holy Lake and is one of the most sacred place of worship for the Buddhist - The Lake gets frozen during winter barring a stretch which remains as water even at - 20 C - The region is generally covered with snow from December to April - This is a stretch of cold desert till Tibet / China - While returning have lunch at Lachen - After Lunch drive to Lachung - Overnight stay at Hotel in Lachung"},
  {"title":"Lachung – Yumthang Valley – Gangtok","image":"images/card3.jpg","details":"Visit to Yumthang i.e. 25 kilometers, 2 hour - A valley at an altitude of 11800 feet through which Lachung Chu flows, generally covered with snow from December to April or even more is known as the valley of flowers - Guest can spend a few hours at Yumthang - The vast Valley stretches and is a cold desert till Tibet / China - While returning visit to hot water spring if time permits (Optional) - The region is fully covered with snow and Rhododendron forest - Back to hotel for lunch / Packed Lunch - Proceed to Gangtok - Afternoon drive to Gangtok 130 Kilometers, 5 hours - Evening free to stroll around M G Road - Overnight stay at Hotel in Gangtok"},
  {"title":"Gangtok - Siliguri/Bagdogra/NJP station","image":"images/card2.jpg","details":"Early morning breakfast - Drive to Siliguri, on the way to Bagdogra Airport (IXB) / New Jalpaiguri Railway Station (NJP) - It is approximately 130 kilometers and 4 to 5 hours drive - The road will be bit busy and jam is frequent - The drive will be along the River Teesta - Stoppage at Rangpo / Chitrey or Melli for a cup of Tea is advisable - One stop at Coronation bridge if time permits - One will travel through the area of natural beauty - Rafting on the way is an optional (Most operators are not Registered with any Government wing hence try to avoid the same) - Drive to Bagdogra Airport (IXB) / New Jalpaiguri Railway Station (NJP) /Siliguri - Guest are advised to start early and not to rush - Forwarding Journey"},
];


class PackageDetails extends StatefulWidget {
  PackageModel northSikkimPkg;
  final List<Map> schedule;

  final AnimationController optionalAnimController;
  PackageDetails({
    Key key,
    this.optionalAnimController,
    this.schedule
  }) : northSikkimPkg = new PackageModel(schedule),
       super(key:key);
  @override
  _PackageDetailsState createState() => _PackageDetailsState();
}

class _PackageDetailsState extends State<PackageDetails> with TickerProviderStateMixin{


AnimationController leftEaseAnimationController;
Animation<double> leftEaseAnimation;
Animation<double> buttonWidthAnimation;
Animation<Opacity> opacityAnimation;




int tempIndex = -1;
 List<Widget> _buildSidebar() {
  List<Widget> _tempWidgets = [];
  _tempWidgets.insert(0, _IconNumber(0));
  for(int i=1;i<widget.northSikkimPkg.schedule.length + 1;i++){
    _tempWidgets.insert(i, _IconNumber(i));
  }

  return _tempWidgets;
}

@override
  void initState() {
    // TODO: implement initState
    super.initState();

  leftEaseAnimationController = new AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 700)
  )..addListener((){
    print('Animation refres');
  });

  buttonWidthAnimation = new Tween(begin: 0.0,end:200.0).animate(new CurvedAnimation(parent: leftEaseAnimationController,
      curve: new Interval(0.1,0.9,curve: Curves.ease)
  ));

  leftEaseAnimation = new Tween(begin: 70.0,end:-20.0).animate(new CurvedAnimation(parent: leftEaseAnimationController,
    curve: new Interval(0.1,0.9,curve: Curves.easeInOut)
  ));

  leftEaseAnimationController.forward(from: 0.0);

}


Future<Null> _playAnim() async{
  try{
    await leftEaseAnimationController.forward(from: 0.0);
    //await leftEaseAnimationController.reverse();
  }on TickerCanceled{}
}

 Widget _IconNumber(int number){
   return number != 0
   ?  Expanded(
     flex: 6,
     child: Material(
       child: InkWell(
         onTap: (){
           _playAnim();
           setState(() {
               activeDay = number;
               bgPic = widget.northSikkimPkg.schedule[activeDay -1]['image'];
               showBookBtn = false;
               leftEaseAnimationController.forward(from: 70.0);
               print(number);
           });
         },
         child: Container(
           //height: 50.0,
           decoration: new BoxDecoration(
               color: activeDay == number ? Colors.white :Colors.black
           ),
           alignment: FractionalOffset.center,
           child: Column(
             mainAxisAlignment: MainAxisAlignment.center,
             children: <Widget>[
               Text(
                 (number).toString(),style: TextStyle(color: activeDay == number ? Colors.green :Colors.white),
               ),
               Container(height: 4.0,),
               activeDay == number ? Text(
                  "Day ",style: TextStyle(fontSize: 10.0,color: activeDay == number ? Colors.green :Colors.white),
               ):
               Container()
             ],
           )
         ),
       ),
     ),
   )
   : Expanded(
     flex: 6,
     child: Material(
       child: InkWell(
         onTap: (){
           _playAnim();
           setState(() {
             leftEaseAnimationController.forward(from: 70.0);
               activeDay = number;
               showBookBtn = true;

             print(activeDay);
           });
         },
         child: Container(
           //height: 50.0,
           decoration: new BoxDecoration(
               color: activeDay == number ? Colors.white :Colors.black
           ),
           alignment: FractionalOffset.center,
           child: Column(
             mainAxisAlignment: MainAxisAlignment.center,
             children: <Widget>[
               new Icon(
                   Icons.info_outline,
                 color: activeDay == number ? Colors.green :Colors.white,
               ),
               Container(height: 4.0,),
               activeDay == number ? Text(
                 "Info",style: TextStyle(fontSize: 10.0,color: activeDay == number ? Colors.green :Colors.white),
               ):Container()
             ],
           ),
         ),
       ),
     ),
   )
   ;
 }


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.white,
      body: new CustomScrollView(
        slivers: <Widget>[
          new SliverAppBar(
            leading:new Container(
              margin: EdgeInsets.only(left:5.0),
                width: 15.0,
                height: 15.0,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
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
                  widget.optionalAnimController.reverse();
                })
            ),
            actions: <Widget>[
              new IconButton(icon: new Icon(Icons.map), onPressed: (){}),
              new IconButton(icon: new Icon(Icons.bookmark_border), onPressed: (){}),
            ],
            expandedHeight: 280.0,
            flexibleSpace: new FlexibleSpaceBar(
              centerTitle: true,
              title: new AnimatedBuilder(animation: leftEaseAnimationController, builder: (BuildContext context, Widget child){
                return showBookBtn == true
                    ? AnimatedOpacity(
                  duration: Duration(milliseconds: 400),
                    opacity: buttonWidthAnimation.value < 70 ? 0.0 : 1.0,
                  child: Material(
                  elevation: 10.0,
                  color: Colors.transparent,
                  child: InkWell(
                      borderRadius: BorderRadius.circular(5.0),
                      splashColor: Colors.transparent,
                      onTap: (){
                        //TODO implement app booking
                      },
                      child: new Container(
                        width: buttonWidthAnimation.value,
                        decoration: new BoxDecoration(
                            borderRadius: BorderRadius.circular(5.0),

                            gradient: new LinearGradient(
                                colors: [Colors.blue,Colors.lightBlueAccent,Colors.lightBlue],
                                begin: new FractionalOffset(0.0, 1.0),
                                end: new FractionalOffset(1.0, 0.0),
                                stops: [0.0,0.6,1.0]
                            )
                        ),
                        height: 36.0,
                        alignment: FractionalOffset.center,
                        child: new Text('Book this ',style: TextStyle(color:Colors.white),),
                      ),
                  ),
                ),
                    )
                    : Container(
                  decoration: new BoxDecoration(
                    boxShadow: [
                      new BoxShadow(
                        color: Colors.black26,
                        offset: Offset(0.0,5.0),
                        blurRadius: 4.0,
                        spreadRadius: 1.0,
                      )
                    ],

                  ),
                  height: 50.0,
                  alignment: FractionalOffset.center,
                  child: new Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Stack(
                        alignment: FractionalOffset.center,
                        children: <Widget>[
                          new Container(
                            alignment: FractionalOffset.center,
                            width: 60.0,
                            height:double.infinity,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(topLeft: Radius.circular(3.0),bottomLeft: Radius.circular(3.0)),
                                color: Colors.white,
                                gradient: new LinearGradient(
                                    colors: [
                                      new Color.fromRGBO(140, 204, 255, 1.0),
                                      new Color.fromRGBO(0, 188, 212, 1.0),
                                      Colors.blue,
                                    ],
                                    begin: new FractionalOffset(0.0, 1.0),
                                    end: new FractionalOffset(1.0, 0.0),
                                    stops: [0.1,0.5,1.0]
                                )
                            ),
                          ),
                          new Center(
                            child: new Icon(Icons.remove_red_eye,color: Colors.white,),
                          )
                        ],
                      ),
                      new Container(
                        alignment: Alignment(0.0, -10.0),
                          padding: EdgeInsets.only(bottom: 10.0),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(topRight: Radius.circular(3.0),bottomRight: Radius.circular(3.0))
                          ),
//                      height: 60.0,
                          width: MediaQuery.of(context).size.width - 200.0,
                          child: Transform(
                            transform: Matrix4.translationValues(0.0, -10.0, 0.0),
                            child: new ListTile(
                              title: new Text('North Sikkim',style: TextStyle(fontFamily: 'Lato',fontSize: 15.0),),
                              subtitle: new Text('4 Nights 5 Days',style: TextStyle(fontSize: 10.0,fontFamily: 'Lato')),
                            ),
                          )
                      )
                    ],
                  ),
                );
              }),
                background: new Stack(
                  fit: StackFit.expand,
                  children: <Widget>[
                    Hero(
                        tag:'coverPic',
                        child: AnimatedBuilder(
                          animation: leftEaseAnimationController,
                          builder: (BuildContext context , Widget child){
                           return new AnimatedOpacity(
                              duration: Duration(milliseconds: 500),
                              opacity: leftEaseAnimation.value == 30.0 ? 0.0 : 1.0,
                              child: FadeInImage(
                                fadeInDuration: Duration(seconds: 1),
                                fadeOutDuration: Duration(seconds: 1),
                                placeholder: new AssetImage('images/card2.jpg'),
                                fadeInCurve: new Interval(0.2, 0.9,curve: Curves.ease),
                                image: new AssetImage(bgPic),
                                fit: BoxFit.cover,
                              ),
                            );
                          },
                        )
                    ),
                    new BlackGradientOverlaysImageFromTop(),
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

          new SliverFixedExtentList(
            itemExtent: 450.0,
            delegate: SliverChildListDelegate([
              new Row(
                children: <Widget>[
                  new Container(
                    width: 50.0,
                    child: Material(
                      elevation: 00.0,
                      child: new Column(
                        children: _buildSidebar(),
                      ),
                    ),
                  ),
                  new Expanded(
                    child: activeDay != 0
                        ? Container(
                          child: new ItineraryDetail(
                          leftEaseAnimation:leftEaseAnimation,
                          leftEaseAnimationController:leftEaseAnimationController,
                          title:'North Sikkim 4N/5D',
                          subTitle: widget.northSikkimPkg.schedule[activeDay-1]['title'],
                          description:widget.northSikkimPkg.schedule[activeDay-1]['details']
                          )
                          )
                        : InfoAboutTrip()

                  ),
                ],
              )
            ]),
          )
        ],
      ),
    );
  }
}



class BlackGradientOverlaysImageFromTop extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top:0.0),
          child: new Container(
            width: double.infinity,
            height: 150.0,
            decoration: new BoxDecoration(
                gradient: new LinearGradient(
                    colors: [new Color(0x001D1D1D),new Color(0xFF1A1A1A)],
                    begin: new FractionalOffset(0.0,0.0),
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






class ItineraryDetail extends StatelessWidget {

  Animation<double> leftEaseAnimation;
  AnimationController leftEaseAnimationController;
  final String title;
  final String subTitle;
  final String description;

  ItineraryDetail({
    this.leftEaseAnimation,
    this.title,
    this.subTitle,
    this.leftEaseAnimationController,
    this.description
  });



  Widget animatedBuilderText(BuildContext context, Widget child){
    return AnimatedOpacity(
      opacity: leftEaseAnimation.value == 70.0 ? 0.0 : 1.0,
      duration: Duration(milliseconds: 1000),
      child: new Container(
        margin: const EdgeInsets.only(left:20.0,top:20.0),
        decoration: new BoxDecoration(
          borderRadius: new BorderRadius.circular(10.0),
          //color: Colors.black26,
        ),
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top:1.0,left: 20.0),
              child: new Transform.translate(
                offset: new Offset(leftEaseAnimation.value , 0.0 * 0.9),
                child: new Text(subTitle,
                    style: new TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black54,
                        fontSize: 17.0
                    )
                ),
              ),
            ),


            Padding(
              padding: const EdgeInsets.only(top:15.0,left: 0.0),
              child: Container(
                height: 60.0,
                child: new Transform.translate(
                    offset: new Offset(0.0, leftEaseAnimation.value * 0.5),
                    child: new Text(description,
                        textAlign: TextAlign.left,
                        style: new TextStyle(
                            fontSize: 14.0,
                            height: 1.2,
                            color: Colors.black45,
                            fontFamily: 'Lato')
                    )
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
   return new AnimatedBuilder(
       animation: leftEaseAnimationController,
        builder: animatedBuilderText,
   );
  }
}




class InfoAboutTrip extends StatefulWidget {
  @override
  _InfoAboutTripState createState() => _InfoAboutTripState();
}

class _InfoAboutTripState extends State<InfoAboutTrip> {




 List<Widget> _buildAvatars(){

   double imageOffset = 30.0;

  List _reviewImagesArr = ['images/profile.jpg','images/profile.jpg','images/profile.jpg','images/profile.jpg','images/profile.jpg','images/profile.jpg','images/profile.jpg',];

  return _reviewImagesArr.map((el){
    imageOffset = imageOffset -30.0;
    return Transform(
      transform:Matrix4.translationValues(imageOffset,0.0,0.0),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: new Material(
          elevation: 5.0,
          shape: new CircleBorder(),
          child: new Image.asset(el),
        ),
      ),
    );
  }).toList();
 }



 List <Widget> _buildTripInfo(){
   List<Map<String,String>> _mapItems = [
   {"key":"Locations", "value":"Gangtok, Lachung, Lachen"},
   {"key":"Name", "value":"North Sikkim Package"},
    {"key":"Travel Days", "value":"5 Days"},
    {"key":"Car Type", "value":"Luxury/Non Luxury"},
    {"key":"Departure", "value":"Siliguri"},
    {"key":"Hotel Standard", "value":"Deluxe"},
    {"key":"Extra Spending", "value":"Yes"},
   ];


   return _mapItems.map((item){
     return Padding(
       padding: const EdgeInsets.all(10.0),
       child: Row(
          children: <Widget>[
            Icon(Icons.explore,color:Colors.lightBlueAccent,size: 25.0),
            Padding(
              padding: const EdgeInsets.only(left:8.0),
              child: Text(
                item['key'],
                style: TextStyle(
                  color: Colors.black38,
                  fontFamily: 'Lato',
                ),
              ),
            ),
            Expanded(child: Container(),),
            Padding(
              padding: const EdgeInsets.only(left:8.0),
              child: Text(
                item['value'],
                style: TextStyle(
                  color: Colors.black54,
                  fontFamily: 'Lato',
                ),
              ),
            ),

          ],
       ),
     );
   }).toList();

 }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            height: 70.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Stack(
                  children: _buildAvatars()
                )
              ],
            ),
          ),

          Column(
            children: _buildTripInfo(),
          )

        ],
      ),
    );
  }
}
