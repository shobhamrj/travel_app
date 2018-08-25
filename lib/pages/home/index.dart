import 'package:exploreskflutteryyyy/components/curvedAppbar.dart';
import 'package:exploreskflutteryyyy/horizonal_widget.dart';
import 'package:exploreskflutteryyyy/pages/fullScreenItinerary/index.dart';
import 'package:exploreskflutteryyyy/pages/itineraryDetails/index.dart';
import 'package:flutter/material.dart';


List<Map> myTopDestinations = [
  {
    'bgImg':'images/gallery/item4.jpg',
    'title':'Gangtok',
    'subtitle':'SIKKIM',
  },
  {
    'bgImg':'images/gallery/item22.jpg',
    'title':'Gangtok',
    'subtitle':'SIKKIM',
  },
  {
    'bgImg':'images/gallery/item3.jpg',
    'title':'Gangtok',
    'subtitle':'SIKKIM',
  }
];

List _ListOfSchedules = [
  [
    {"title":" Siliguri/New Jalpaiguri Station/Badogra to Gangtok","image":"images/card1.jpg","details":"Guest will be received by our official at Bagdogra Airport (IXB) / New Jalpaiguri Railway Station (NJP) / Tenzing Norgay Bus Terminus (Junction) - He will assist you for the forwarding journey to Gangtok - Nearly 135 Kilometers, 3 - 4 hours drive - A perfect destination for tourist in search of enchantment, tranquility, trekking or any other adventure - Land of monastery, mystic rituals / festivals at an elevation of 1,437 meters / 4,715 feet is the most often visited spot of India for its rare Orchids and Butterflies - In the evening one is free to stroll around M G Marg / Local Market - Over night stay at Gangtok<"},
    {"title":"Gangtok to Lachen","image":"images/card5.jpg","details":"Next the vehicle will report for North Sikkim with permit -Drive to Lachen - Chungthang is nearly 96 kilometers from Gangtok - On the way stop at Chungthang - Next drive for 29 kilometers from Chungthang to Lachen - Reach Lachung late afternoon / early evening - The snow capped peaks, the Shingbha wild life sanctuary, Gurudongmar, Thangu, Chopta Valley and Green Lake are the major attractions of the region - It is almost like this town is hidden from the outside - The infrastructure is not good due to the remoteness and the snowfall / Rainfall - The place is worth visiting - Check into a hotel - Welcome Tea - Evening free to stroll or visit the Lachen Monastery and visit the Lepcha Village - Overnight stay at Hotel in Lachen"},
    {"title":"Lachen - Gurudongmar Lake - Lachung","image":"images/card4.jpg","details":"Early morning breakfast - The route is Lachen - Thangu - Chopta Valley - Gurudongmar lake - Lachen - Drive 55 kilometers from Lachen stop at 15000 feet for permit to be signed - Drive the rest and visit to Gurudongmar Lake - 3 hour - A valley at an altitude of nearly 15 800 feet through which Lachen Chu flows - This is a holy Lake and is one of the most sacred place of worship for the Buddhist - The Lake gets frozen during winter barring a stretch which remains as water even at - 20 C - The region is generally covered with snow from December to April - This is a stretch of cold desert till Tibet / China - While returning have lunch at Lachen - After Lunch drive to Lachung - Overnight stay at Hotel in Lachung"},
    {"title":"Lachung – Yumthang Valley – Gangtok","image":"images/card3.jpg","details":"Visit to Yumthang i.e. 25 kilometers, 2 hour - A valley at an altitude of 11800 feet through which Lachung Chu flows, generally covered with snow from December to April or even more is known as the valley of flowers - Guest can spend a few hours at Yumthang - The vast Valley stretches and is a cold desert till Tibet / China - While returning visit to hot water spring if time permits (Optional) - The region is fully covered with snow and Rhododendron forest - Back to hotel for lunch / Packed Lunch - Proceed to Gangtok - Afternoon drive to Gangtok 130 Kilometers, 5 hours - Evening free to stroll around M G Road - Overnight stay at Hotel in Gangtok"},
    {"title":"Gangtok - Siliguri/Bagdogra/NJP station","image":"images/card2.jpg","details":"Early morning breakfast - Drive to Siliguri, on the way to Bagdogra Airport (IXB) / New Jalpaiguri Railway Station (NJP) - It is approximately 130 kilometers and 4 to 5 hours drive - The road will be bit busy and jam is frequent - The drive will be along the River Teesta - Stoppage at Rangpo / Chitrey or Melli for a cup of Tea is advisable - One stop at Coronation bridge if time permits - One will travel through the area of natural beauty - Rafting on the way is an optional (Most operators are not Registered with any Government wing hence try to avoid the same) - Drive to Bagdogra Airport (IXB) / New Jalpaiguri Railway Station (NJP) /Siliguri - Guest are advised to start early and not to rush - Forwarding Journey"},
  ],
  [
    {"title":" Siliguri/New Jalpaiguri Station/Badogra to Gangtok","image":"images/card1.jpg","details":"Guest will be received by our official at Bagdogra Airport (IXB) / New Jalpaiguri Railway Station (NJP) / Tenzing Norgay Bus Terminus (Junction) - He will assist you for the forwarding journey to Gangtok - Nearly 135 Kilometers, 3 - 4 hours drive - A perfect destination for tourist in search of enchantment, tranquility, trekking or any other adventure - Land of monastery, mystic rituals / festivals at an elevation of 1,437 meters / 4,715 feet is the most often visited spot of India for its rare Orchids and Butterflies - In the evening one is free to stroll around M G Marg / Local Market - Over night stay at Gangtok<"},
    {"title":"Gangtok to Lachen","image":"images/card5.jpg","details":"Next the vehicle will report for North Sikkim with permit -Drive to Lachen - Chungthang is nearly 96 kilometers from Gangtok - On the way stop at Chungthang - Next drive for 29 kilometers from Chungthang to Lachen - Reach Lachung late afternoon / early evening - The snow capped peaks, the Shingbha wild life sanctuary, Gurudongmar, Thangu, Chopta Valley and Green Lake are the major attractions of the region - It is almost like this town is hidden from the outside - The infrastructure is not good due to the remoteness and the snowfall / Rainfall - The place is worth visiting - Check into a hotel - Welcome Tea - Evening free to stroll or visit the Lachen Monastery and visit the Lepcha Village - Overnight stay at Hotel in Lachen"},
    {"title":"Lachen - Gurudongmar Lake - Lachung","image":"images/card4.jpg","details":"Early morning breakfast - The route is Lachen - Thangu - Chopta Valley - Gurudongmar lake - Lachen - Drive 55 kilometers from Lachen stop at 15000 feet for permit to be signed - Drive the rest and visit to Gurudongmar Lake - 3 hour - A valley at an altitude of nearly 15 800 feet through which Lachen Chu flows - This is a holy Lake and is one of the most sacred place of worship for the Buddhist - The Lake gets frozen during winter barring a stretch which remains as water even at - 20 C - The region is generally covered with snow from December to April - This is a stretch of cold desert till Tibet / China - While returning have lunch at Lachen - After Lunch drive to Lachung - Overnight stay at Hotel in Lachung"},
    {"title":"Lachung – Yumthang Valley – Gangtok","image":"images/card3.jpg","details":"Visit to Yumthang i.e. 25 kilometers, 2 hour - A valley at an altitude of 11800 feet through which Lachung Chu flows, generally covered with snow from December to April or even more is known as the valley of flowers - Guest can spend a few hours at Yumthang - The vast Valley stretches and is a cold desert till Tibet / China - While returning visit to hot water spring if time permits (Optional) - The region is fully covered with snow and Rhododendron forest - Back to hotel for lunch / Packed Lunch - Proceed to Gangtok - Afternoon drive to Gangtok 130 Kilometers, 5 hours - Evening free to stroll around M G Road - Overnight stay at Hotel in Gangtok"},
    {"title":"Gangtok - Siliguri/Bagdogra/NJP station","image":"images/card2.jpg","details":"Early morning breakfast - Drive to Siliguri, on the way to Bagdogra Airport (IXB) / New Jalpaiguri Railway Station (NJP) - It is approximately 130 kilometers and 4 to 5 hours drive - The road will be bit busy and jam is frequent - The drive will be along the River Teesta - Stoppage at Rangpo / Chitrey or Melli for a cup of Tea is advisable - One stop at Coronation bridge if time permits - One will travel through the area of natural beauty - Rafting on the way is an optional (Most operators are not Registered with any Government wing hence try to avoid the same) - Drive to Bagdogra Airport (IXB) / New Jalpaiguri Railway Station (NJP) /Siliguri - Guest are advised to start early and not to rush - Forwarding Journey"},
  ],
  [
    {"title":" Siliguri/New Jalpaiguri Station/Badogra to Gangtok","image":"images/card1.jpg","details":"Guest will be received by our official at Bagdogra Airport (IXB) / New Jalpaiguri Railway Station (NJP) / Tenzing Norgay Bus Terminus (Junction) - He will assist you for the forwarding journey to Gangtok - Nearly 135 Kilometers, 3 - 4 hours drive - A perfect destination for tourist in search of enchantment, tranquility, trekking or any other adventure - Land of monastery, mystic rituals / festivals at an elevation of 1,437 meters / 4,715 feet is the most often visited spot of India for its rare Orchids and Butterflies - In the evening one is free to stroll around M G Marg / Local Market - Over night stay at Gangtok<"},
    {"title":"Gangtok to Lachen","image":"images/card5.jpg","details":"Next the vehicle will report for North Sikkim with permit -Drive to Lachen - Chungthang is nearly 96 kilometers from Gangtok - On the way stop at Chungthang - Next drive for 29 kilometers from Chungthang to Lachen - Reach Lachung late afternoon / early evening - The snow capped peaks, the Shingbha wild life sanctuary, Gurudongmar, Thangu, Chopta Valley and Green Lake are the major attractions of the region - It is almost like this town is hidden from the outside - The infrastructure is not good due to the remoteness and the snowfall / Rainfall - The place is worth visiting - Check into a hotel - Welcome Tea - Evening free to stroll or visit the Lachen Monastery and visit the Lepcha Village - Overnight stay at Hotel in Lachen"},
    {"title":"Lachen - Gurudongmar Lake - Lachung","image":"images/card4.jpg","details":"Early morning breakfast - The route is Lachen - Thangu - Chopta Valley - Gurudongmar lake - Lachen - Drive 55 kilometers from Lachen stop at 15000 feet for permit to be signed - Drive the rest and visit to Gurudongmar Lake - 3 hour - A valley at an altitude of nearly 15 800 feet through which Lachen Chu flows - This is a holy Lake and is one of the most sacred place of worship for the Buddhist - The Lake gets frozen during winter barring a stretch which remains as water even at - 20 C - The region is generally covered with snow from December to April - This is a stretch of cold desert till Tibet / China - While returning have lunch at Lachen - After Lunch drive to Lachung - Overnight stay at Hotel in Lachung"},
    {"title":"Lachung – Yumthang Valley – Gangtok","image":"images/card3.jpg","details":"Visit to Yumthang i.e. 25 kilometers, 2 hour - A valley at an altitude of 11800 feet through which Lachung Chu flows, generally covered with snow from December to April or even more is known as the valley of flowers - Guest can spend a few hours at Yumthang - The vast Valley stretches and is a cold desert till Tibet / China - While returning visit to hot water spring if time permits (Optional) - The region is fully covered with snow and Rhododendron forest - Back to hotel for lunch / Packed Lunch - Proceed to Gangtok - Afternoon drive to Gangtok 130 Kilometers, 5 hours - Evening free to stroll around M G Road - Overnight stay at Hotel in Gangtok"},
    {"title":"Gangtok - Siliguri/Bagdogra/NJP station","image":"images/card2.jpg","details":"Early morning breakfast - Drive to Siliguri, on the way to Bagdogra Airport (IXB) / New Jalpaiguri Railway Station (NJP) - It is approximately 130 kilometers and 4 to 5 hours drive - The road will be bit busy and jam is frequent - The drive will be along the River Teesta - Stoppage at Rangpo / Chitrey or Melli for a cup of Tea is advisable - One stop at Coronation bridge if time permits - One will travel through the area of natural beauty - Rafting on the way is an optional (Most operators are not Registered with any Government wing hence try to avoid the same) - Drive to Bagdogra Airport (IXB) / New Jalpaiguri Railway Station (NJP) /Siliguri - Guest are advised to start early and not to rush - Forwarding Journey"},
  ]
];


List _galleries = [
  ['images/gallery/item2.jpg','images/gallery/item23.jpg','images/gallery/item24.jpg','images/gallery/item23.jpg','images/gallery/item22.jpg','images/gallery/item21.jpg'],
  ['images/gallery/item2.jpg','images/gallery/item23.jpg','images/gallery/item24.jpg','images/gallery/item23.jpg','images/gallery/item22.jpg','images/gallery/item21.jpg']
];


class HomeApp extends StatefulWidget {
  @override
  _HomeAppState createState() => _HomeAppState();
}

class _HomeAppState extends State<HomeApp> with TickerProviderStateMixin{
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            ListView(
              children: <Widget>[

                Column(
                  children: <Widget>[
                    PackageStar(
                      duration: '5N.6D',
                      pkgTitle: 'Gangtok 5 Nights - Super Saver',
                      subTitle: '5N Gangtok',
                      footerInclusion: 'Includes Hotels , Luxury Car , Sightseeing , Transfers on Arrival',
                      tag: 'Friends / Family',
                      crossedRate: 'Rs  14,215',
                      savedString: 'Save Rs 3,201 (27 %)',
                      image: 'images/gallery/item11.jpg',
                      rate: 'Rs  10,014',
                      stars: 4.5,
                      schedule: _ListOfSchedules[0],
                      noOfNights: 4,
                      gallery: _galleries[0],
                      bgImage: 'images/gallery/item10.jpg',

                    ),
                    PackageStar(
                      duration: '5N.6D',
                      pkgTitle: 'Gangtok 5 Nights - Super Saver',
                      subTitle: '5N Gangtok',
                      footerInclusion: 'Includes Hotels , Luxury Car , Sightseeing , Transfers on Arrival',
                      tag: 'Friends / Family',
                      crossedRate: 'Rs  14,215',
                      savedString: 'Save Rs 3,201 (27 %)',
                      image: 'images/gallery/item27.jpg',
                      rate: 'Rs  10,014',
                      stars: 4.5,
                      schedule: _ListOfSchedules[1],
                      noOfNights: 5,
                      gallery: _galleries[1],
                      bgImage: 'images/gallery/item17.jpg',
                    ),
                    new GradientHorizontalListWidgetWithImages(
                      gradientColors: [Colors.deepOrangeAccent,Colors.redAccent,Colors.pink],
                      title: 'TOP',
                      subTitle: 'Packages',
                      items: myTopDestinations,
                      showSaveIcon: true,
                      cardTextAlignment: CrossAxisAlignment.start,
                      bannerTextAlignment: CrossAxisAlignment.start,
                      cardTapHandler: (x){
                        Navigator.push(context, new MaterialPageRoute(builder: (BuildContext context) => new PackageDetails()));
                      },
                    ),
                  ],
                ),
              ],
            ),
            new Positioned(
              top:0.0,
              left:0.0,
              right: 0.0,
              child:  AppBarCustomCurved(),
            )
          ],
        ),
      ),
    );
  }


}

class FullScreenModelPkg{
  final String title;
  final String subtitle;
  final List<Map> schedule;
  final String fullScreenImage;
  final String price;
  final List gallery;
  final int noOfNights;

  FullScreenModelPkg({
    this.title,
    this.subtitle,
    this.schedule,
    this.fullScreenImage,
    this.price,
    this.gallery,
    this.noOfNights
  });

}




class PackageStar extends StatefulWidget {
  final FullScreenModelPkg fullScreenParams;

  final String duration;
  final String pkgTitle;
  final String subTitle;
  final String footerInclusion;
  final String tag;
  final String crossedRate;
  final String savedString;
  final String image;
  final String rate;
  final double stars;
  final String bgImage;
  final List<Map> schedule;
  final int noOfNights;
  final List gallery;
  PackageStar({
    Key key,
    this.image,
    this.duration,
    this.crossedRate,
    this.footerInclusion,
    this.pkgTitle,
    this.savedString,
    this.subTitle,
    this.tag,
    this.bgImage,
    this.rate,
    this.stars,
    this.schedule,
    this.noOfNights,
    this.gallery,
  }):fullScreenParams = new FullScreenModelPkg(
    title: pkgTitle,
    subtitle: subTitle,
    price: rate,
    fullScreenImage: bgImage,
    schedule: schedule,
    noOfNights: noOfNights,
    gallery: gallery,
  ) ,super(key:key);

  @override
  _PackageStarState createState() => _PackageStarState();
}

class _PackageStarState extends State<PackageStar> {


  Widget floatingBtnIcon(Icon icon , int index){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      child: new FloatingActionButton(
          heroTag: null,
          elevation: 0.0,
          backgroundColor: Colors.white,
          onPressed: (){
            Navigator.pushNamed(context,'/hotelForm');
          },
          child: icon
      ),
    );
  }

  Widget pkgDuration(){
    return new Container(
      alignment: Alignment.center,
      padding:EdgeInsets.symmetric(vertical:8.0,horizontal: 15.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.0),
          gradient: new LinearGradient(
              colors: [Colors.blue,Colors.lightBlueAccent,Colors.lightBlue],
              begin: new FractionalOffset(1.0, 0.0),
              end: new FractionalOffset(0.0, 1.0),
              stops: [0.2,0.6,1.0]
          )
      ),
      child: new Text(
        widget.duration,
        style: TextStyle(
            color: Colors.white,
            fontSize: 12.0
        ),
      ),
    );
  }

  Widget _buildStars(double index){
    int inc = index.floor();
    List<Widget> builtStars = [];

    for(int i=0;i<inc;i++){
      builtStars.add(
          Padding(
            padding: const EdgeInsets.all(1.0),
            child: new Icon(
              Icons.star,
              color: new Color(0xFFffd700),
              size: 16.0,
            ),
          )
      );
    }
    for(int i=inc;i<5;i++){
      builtStars.add(
          Padding(
            padding: const EdgeInsets.all(1.0),
            child: new Icon(
              Icons.star,
              color: Color(0xFFEFEFEF),
              size: 16.0,
            ),
          )
      );
    }
    return new Row(
        children: builtStars
    );
  }

  Widget _cardBody(){
    return Padding(
      padding: const EdgeInsets.only(top:20.0,left:10.0,right: 10.0,bottom: 10.0),
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            child: Text(
              widget.pkgTitle,
              style: TextStyle(
                  fontSize: 13.0,
                  fontFamily: 'Lato'
              ),
            ),
          ),
          new Row(
            children: <Widget>[
              Column(
                children: <Widget>[
                  Text(
                    widget.subTitle,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 17.0,
                        fontFamily: 'Lato'
                    ),
                  ),
                  _buildStars(widget.stars)
                ],
              ),
              new Expanded(child: Container(),),
              new Column(
                children: <Widget>[
                  Text(
                    widget.crossedRate,
                    style: TextStyle(
                        fontSize: 10.0,
                        color:Colors.grey,
                        fontFamily: 'Lato',
                        decorationStyle: TextDecorationStyle.dotted
                    ),
                  ),
                  Text(
                    widget.rate,
                    style: TextStyle(
                        fontSize: 20.0,
                        color:Colors.black87,
                        fontFamily: 'Lato',
                        decorationStyle: TextDecorationStyle.dotted
                    ),
                  ),
                  Text(
                    'Price/Person',

                    style: TextStyle(
                        fontSize: 10.0,
                        color:Colors.black87,
                        fontFamily: 'Lato',
                        fontStyle: FontStyle.italic,
                        decorationStyle: TextDecorationStyle.dotted
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top:5.0),
                    child: Text(
                      widget.savedString,
                      style: TextStyle(
                          fontSize: 12.0,
                          color:Colors.red,
                          fontFamily: 'Lato',
                          decorationStyle: TextDecorationStyle.dotted
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top:10.0),
            child: new Row(
              children: <Widget>[
                new Expanded(
                  flex: 2,
                  child: Text(
                    widget.footerInclusion,
                    style: TextStyle(
                        fontSize: 10.0,
                        color:Colors.black87,
                        fontFamily: 'Lato',
                        fontStyle: FontStyle.italic,
                        decorationStyle: TextDecorationStyle.dotted
                    ),
                  ),
                ),
                new Expanded(
                  child: new Container(
                    padding: EdgeInsets.all(4.0),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Colors.blueAccent,
                        borderRadius: BorderRadius.circular(30.0)
                    ),
                    child: new Text(
                      widget.tag,
                      style: TextStyle(
                        fontSize: 12.0,
                        color:Colors.white,
                        fontFamily: 'Lato',
                        fontStyle: FontStyle.normal,
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
            width:double.infinity,
            height: 150.0,
            child: new Image.asset(widget.image,fit: BoxFit.cover,)
        ),
        new Container(
          padding: EdgeInsets.only(top:100.0,left:10.0,right: 10.0,bottom: 10.0),
          child: Stack(
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width,
                height: 170.0,
                child: GestureDetector(
                  onTap: (){
                    Navigator.push((context),new MaterialPageRoute(
                        builder: (BuildContext context){
                          return new FullScreenItinerary(
                              title: widget.fullScreenParams.title,
                              subtitle: widget.fullScreenParams.subtitle,
                              image:widget.fullScreenParams.fullScreenImage,
                              itinerary:widget.fullScreenParams.schedule,
                              gallery: widget.fullScreenParams.gallery,
                              price:widget.fullScreenParams.price,
                              nights:widget.fullScreenParams.noOfNights
                          );
                        }
                    ));
                  },
                  child: new Card(
                      child: _cardBody()
                  ),
                ),
              ),
              Transform(
                transform: Matrix4.translationValues(0.0, -24.0, 0.0),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal:15.0),
                  child: Row(
                    children: <Widget>[
                      pkgDuration(),
                      Expanded(child: Container(),),
                      floatingBtnIcon(
                          Icon(
                            Icons.share,
                            color: Colors.black45,
                          ),1
                      ),
                      floatingBtnIcon(
                          Icon(
                            Icons.favorite_border,
                            color: Colors.black45,
                          ),2
                      ),

                    ],
                  ),
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
