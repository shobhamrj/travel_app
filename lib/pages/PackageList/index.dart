import 'package:exploreskflutteryyyy/pages/fullScreenItinerary/index.dart';
import 'package:flutter/material.dart';
import 'package:exploreskflutteryyyy/horizonal_widget.dart';
import 'package:exploreskflutteryyyy/pages/itineraryDetails/index.dart';



class PackageList extends StatefulWidget {
  @override
  _PackageListState createState() => _PackageListState();
}


List<Map> northSikkimSchedule = [
  {"title":" Siliguri/New Jalpaiguri Station/Badogra to Gangtok","image":"images/card1.jpg","details":"Guest will be received by our official at Bagdogra Airport (IXB) / New Jalpaiguri Railway Station (NJP) / Tenzing Norgay Bus Terminus (Junction) - He will assist you for the forwarding journey to Gangtok - Nearly 135 Kilometers, 3 - 4 hours drive - A perfect destination for tourist in search of enchantment, tranquility, trekking or any other adventure - Land of monastery, mystic rituals / festivals at an elevation of 1,437 meters / 4,715 feet is the most often visited spot of India for its rare Orchids and Butterflies - In the evening one is free to stroll around M G Marg / Local Market - Over night stay at Gangtok<"},
  {"title":"Gangtok to Lachen","image":"images/card5.jpg","details":"Next the vehicle will report for North Sikkim with permit -Drive to Lachen - Chungthang is nearly 96 kilometers from Gangtok - On the way stop at Chungthang - Next drive for 29 kilometers from Chungthang to Lachen - Reach Lachung late afternoon / early evening - The snow capped peaks, the Shingbha wild life sanctuary, Gurudongmar, Thangu, Chopta Valley and Green Lake are the major attractions of the region - It is almost like this town is hidden from the outside - The infrastructure is not good due to the remoteness and the snowfall / Rainfall - The place is worth visiting - Check into a hotel - Welcome Tea - Evening free to stroll or visit the Lachen Monastery and visit the Lepcha Village - Overnight stay at Hotel in Lachen"},
  {"title":"Lachen - Gurudongmar Lake - Lachung","image":"images/card4.jpg","details":"Early morning breakfast - The route is Lachen - Thangu - Chopta Valley - Gurudongmar lake - Lachen - Drive 55 kilometers from Lachen stop at 15000 feet for permit to be signed - Drive the rest and visit to Gurudongmar Lake - 3 hour - A valley at an altitude of nearly 15 800 feet through which Lachen Chu flows - This is a holy Lake and is one of the most sacred place of worship for the Buddhist - The Lake gets frozen during winter barring a stretch which remains as water even at - 20 C - The region is generally covered with snow from December to April - This is a stretch of cold desert till Tibet / China - While returning have lunch at Lachen - After Lunch drive to Lachung - Overnight stay at Hotel in Lachung"},
  {"title":"Lachung – Yumthang Valley – Gangtok","image":"images/card3.jpg","details":"Visit to Yumthang i.e. 25 kilometers, 2 hour - A valley at an altitude of 11800 feet through which Lachung Chu flows, generally covered with snow from December to April or even more is known as the valley of flowers - Guest can spend a few hours at Yumthang - The vast Valley stretches and is a cold desert till Tibet / China - While returning visit to hot water spring if time permits (Optional) - The region is fully covered with snow and Rhododendron forest - Back to hotel for lunch / Packed Lunch - Proceed to Gangtok - Afternoon drive to Gangtok 130 Kilometers, 5 hours - Evening free to stroll around M G Road - Overnight stay at Hotel in Gangtok"},
  {"title":"Gangtok - Siliguri/Bagdogra/NJP station","image":"images/card2.jpg","details":"Early morning breakfast - Drive to Siliguri, on the way to Bagdogra Airport (IXB) / New Jalpaiguri Railway Station (NJP) - It is approximately 130 kilometers and 4 to 5 hours drive - The road will be bit busy and jam is frequent - The drive will be along the River Teesta - Stoppage at Rangpo / Chitrey or Melli for a cup of Tea is advisable - One stop at Coronation bridge if time permits - One will travel through the area of natural beauty - Rafting on the way is an optional (Most operators are not Registered with any Government wing hence try to avoid the same) - Drive to Bagdogra Airport (IXB) / New Jalpaiguri Railway Station (NJP) /Siliguri - Guest are advised to start early and not to rush - Forwarding Journey"},
];

class _PackageListState extends State<PackageList> {



  List<ActivityModelPkg> myTopPackages = [
    new ActivityModelPkg(
      title: 'North Exquisite',
      subtitle: 'Sikkim',
      image: 'images/gallery/item11.jpg',
        showFilters: true,
      color: Colors.lightBlueAccent,
      schedule:northSikkimSchedule,
      fullScreenImage: 'images/gallery/item23.jpg',
      gallery: ['images/gallery/item2.jpg','images/gallery/item23.jpg','images/gallery/item24.jpg','images/gallery/item23.jpg','images/gallery/item22.jpg','images/gallery/item21.jpg'],
      price: 'Rs 8992',
      noOfNights: 5,
    ),
    new ActivityModelPkg(
        title: 'East Exquisite',
        subtitle: 'Sikkim',
        image: 'images/gallery/item22.jpg',
        showFilters: true,
        color: Colors.redAccent,
        schedule:northSikkimSchedule,
        fullScreenImage: 'images/gallery/item23.jpg',
        gallery: ['images/gallery/item2.jpg','images/gallery/item23.jpg','images/gallery/item24.jpg','images/gallery/item23.jpg','images/gallery/item22.jpg','images/gallery/item21.jpg'],
        price: 'Rs 8992',
        noOfNights: 5,

    ),
    new ActivityModelPkg(
        title: 'West Exquisite',
        subtitle: 'Sikkim',
        image: 'images/gallery/item23.jpg',
        showFilters: true,
        color: Colors.orange,
        schedule:northSikkimSchedule,
        fullScreenImage: 'images/gallery/item23.jpg',
        gallery: ['images/gallery/item2.jpg','images/gallery/item23.jpg','images/gallery/item24.jpg','images/gallery/item23.jpg','images/gallery/item22.jpg','images/gallery/item21.jpg'],
        price: 'Rs 3992',
        noOfNights: 5,
    ),
    new ActivityModelPkg(
        title: 'South Exquisite',
        subtitle: 'Sikkim',
        image: 'images/gallery/item17.jpg',
        showFilters: true,
        color: Colors.green,
        schedule:northSikkimSchedule,
        fullScreenImage: 'images/gallery/item23.jpg',
        gallery: ['images/gallery/item2.jpg','images/gallery/item23.jpg','images/gallery/item24.jpg','images/gallery/item23.jpg','images/gallery/item22.jpg','images/gallery/item21.jpg'],
        price: 'Rs 7992',
        noOfNights: 5,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFAFAFA),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            leading: new IconButton(
              icon: Icon(Icons.favorite,color: Colors.white,),
            ),
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
            pinned: true,
            expandedHeight: 150.0,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              title: new Row(
                mainAxisAlignment: MainAxisAlignment.center,
              //crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Text('TOP ',style: TextStyle(fontFamily: 'Poiret-One',fontWeight: FontWeight.bold,color: Colors.white,fontSize: 22.0),),
                new Text(' ACTivities'.toUpperCase(),style: TextStyle(fontFamily: 'Poiret-One',color: Colors.white,fontSize: 22.0))
              ],
            ),
              background: Container(
                height: 200.0,
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xFF52c9ff),Color(0xFF43c5ff),Colors.blue,Colors.blueAccent],
                    begin: FractionalOffset.centerLeft,
                    end: FractionalOffset.centerRight,
                    stops: [0.2,0.5,0.8,1.0]
                    ),
                  ) ,
                ),
            ),
          ),
          SliverGrid(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1,
              mainAxisSpacing: 10.0,
              crossAxisSpacing: 20.0,
              childAspectRatio: 1.4
            ),
            delegate: SliverChildBuilderDelegate((BuildContext context , int index){
              return new CardPackage(
                pkgModel: myTopPackages[index],
              );
            },
             childCount: myTopPackages.length,
            ),
          )
        ],
      )
    );
  }
}


class ActivityModelPkg{
  final String image;
  final String title;
  final String subtitle;
  final Color color;
  final bool showFilters;
  final List<Map> schedule;
  final String fullScreenImage;
  final String price;
  final List gallery;
  final int noOfNights;

  ActivityModelPkg({
    this.image,
    this.title,
    this.color,
    this.subtitle,
    this.showFilters,
    this.schedule,
    this.fullScreenImage,
    this.price,
    this.gallery,
    this.noOfNights
  });

}



class CardPackage extends StatefulWidget {
  final ActivityModelPkg pkgModel;

  CardPackage({
    this.pkgModel
  });

  @override
  _CardPackageState createState() => _CardPackageState();
}

class _CardPackageState extends State<CardPackage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: Stack(
        fit: StackFit.loose,
        children: <Widget>[
          Card(
            elevation: 5.0,
              child: Container(
                height: 150.0,
                width: double.infinity,
                child: Stack(
                  fit: StackFit.expand,
                  children: <Widget>[
                    Image.asset(
                      widget.pkgModel.image,
                      fit: BoxFit.cover,
                    ),
                    widget.pkgModel.showFilters
                    ? new Container(
                      width: double.infinity,
                      height: double.infinity,
                      decoration: new BoxDecoration(
                        gradient: LinearGradient(
                            colors: [widget.pkgModel.color.withOpacity(0.3),Colors.white.withOpacity(0.2)],
                            begin: FractionalOffset.topRight,
                            end: FractionalOffset.bottomLeft,
                            stops: [0.5,1.0]
                        ),
                      ),
                    ): Container()

                  ],
                ),
              )
          ),

          Container(
            margin:EdgeInsets.only(top:170.0),
            padding: EdgeInsets.only(left:10.0,right: 10.0),
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Text(
                      widget.pkgModel.title,
                      style: TextStyle(
                          fontFamily: 'Lato',
                          color: Colors.black54,
                          fontSize: 18.0
                      ),
                    ),
                    Expanded(child: Container(),),
                    new IconButton(
                      padding: EdgeInsets.all(0.0),
                      color: widget.pkgModel.showFilters ? widget.pkgModel.color : Colors.lightBlueAccent,
                      icon: Icon(Icons.share),
                      onPressed:() {

                      },
                    )
                  ],
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Transform(
              transform: Matrix4.translationValues(-55.0,25.0,0.0),
              child: Container(
                height: 60.0,
                width: 60.0,
                child: new FloatingActionButton(
                  elevation: 5.0,
                  heroTag: null,
                  backgroundColor:widget.pkgModel.showFilters ? widget.pkgModel.color : Colors.lightBlueAccent,
                  onPressed: (){

                  },
                  child: Icon(Icons.favorite_border),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child:  Transform(
              transform: Matrix4.translationValues(20.0, 25.0, 0.0),
              child: Material(
                elevation: 5.0,
                borderRadius: BorderRadius.circular(30.0),
                color: Colors.transparent,
                child: Ink(
                  child: InkWell(
                    onTap: (){
                        Navigator.push((context),new MaterialPageRoute(
                          builder: (BuildContext context){
                           return new FullScreenItinerary(
                             title: widget.pkgModel.title,
                             subtitle: widget.pkgModel.subtitle,
                             image:widget.pkgModel.fullScreenImage,
                             itinerary:widget.pkgModel.schedule,
                             gallery: widget.pkgModel.gallery,
                             price:widget.pkgModel.price,
                             nights:widget.pkgModel.noOfNights
                           );
                          }
                        ));
                      },
                    child: Container(
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                colors: [Color(0xFF52c9ff),Color(0xFF43c5ff),Colors.blue,Colors.blueAccent],
                                begin: FractionalOffset.centerLeft,
                                end: FractionalOffset.centerRight,
                                stops: [0.2,0.5,0.8,1.0]
                            ),
                            borderRadius: BorderRadius.circular(30.0),
                        ),
                        padding: EdgeInsets.symmetric(horizontal:15.0,vertical:5.0),

                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(left:8.0),
                              child: new Text('More'.toUpperCase(),
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'Lato',
                                    fontSize: 17.0,
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                            ),
                            Icon(Icons.chevron_right,color: Colors.white,),
                          ],
                        )
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}


