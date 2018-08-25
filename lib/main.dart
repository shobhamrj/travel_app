import 'package:exploreskflutteryyyy/pages/fullScreenItinerary/index.dart';
import 'package:exploreskflutteryyyy/pages/hotel/form.dart';
import 'package:exploreskflutteryyyy/pages/interests/monasteries.dart';
import 'package:exploreskflutteryyyy/pages/interests/pilgrimages.dart';
import 'package:exploreskflutteryyyy/pages/interests/scenic-places.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:exploreskflutteryyyy/components/navigation-icon-view.dart';
import 'package:exploreskflutteryyyy/mapbox.dart';
import 'package:exploreskflutteryyyy/components/cardSwipe.dart';
import 'package:exploreskflutteryyyy/pages/PackageList/index.dart';
import 'package:exploreskflutteryyyy/pages/attractions_page/dribbble_travel.dart';
import 'package:exploreskflutteryyyy/fluttie_animations.dart';

import 'package:exploreskflutteryyyy/horizonal_widget.dart';
import 'package:exploreskflutteryyyy/loginAnimation.dart';
import 'package:exploreskflutteryyyy/pages/home/index.dart';
import 'package:exploreskflutteryyyy/pages/hotel/listing.dart';
import 'package:exploreskflutteryyyy/pages/interests/interests.dart';
import 'package:exploreskflutteryyyy/pages/itineraryDetails/index.dart';
import 'package:exploreskflutteryyyy/pages/locationList/index.dart';
import 'package:exploreskflutteryyyy/slider_widget.dart';
import 'package:exploreskflutteryyyy/sliverDetailsPage.dart';

void main(){
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
  runApp(
      new MaterialApp(
        routes:<String,WidgetBuilder>{
          '/interests': (BuildContext context) => new InterestPage(),
          '/monasteries':(BuildContext context) => new MonasteriesPage(),
          '/pilgrimages':(BuildContext context) => new PilgrimsPage(),
          '/scenicPlacesPage':(BuildContext context) => new ScenicPlacesPage(),
          '/packageFullScreenDetail':(BuildContext context) => new FullScreenItinerary(),
          '/hotelForm': (BuildContext context) => new HotelForm(),
        },
        debugShowCheckedModeBanner: false,
        home: new BottomNavigationApp(),
      )
  );
}



class BottomNavigationApp extends StatefulWidget {
  @override
  _BottomNavigationAppState createState() => new _BottomNavigationAppState();
}

class _BottomNavigationAppState extends State<BottomNavigationApp>
    with TickerProviderStateMixin {
  int _currentIndex = 0;
  BottomNavigationBarType _type = BottomNavigationBarType.fixed;
  List<NavigationIconView> _navigationViews;

  @override
  void initState() {
    super.initState();
    _navigationViews = <NavigationIconView>[
      new NavigationIconView(
        icon: const Icon(Icons.map,size: 30.0,),
        title: 'Search',
        page: new HomeApp(),
        vsync: this,
      ),
      new NavigationIconView(
        icon: const Icon(Icons.location_on,size: 30.0,),
        title: 'About',
        page:LocationsList(),
        vsync: this,
      ),
      new NavigationIconView(
        icon: const Icon(Icons.filter_hdr,size: 30.0,),
        title: 'Website',
        page: PackageList(),
        vsync: this,
      ),
      new NavigationIconView(
        icon: const Icon(Icons.home,size: 30.0,),
        title: 'Other Apps',
        page: new HotelListing(),
        vsync: this,
      ),
      new NavigationIconView(
        icon: const Icon(Icons.person_pin_circle,size: 30.0,),
        title: 'Website',
        page: ButtonAnimation(),
        vsync: this,
      ),
    ];

    for (NavigationIconView view in _navigationViews)
      view.controller.addListener(_rebuild);

    _navigationViews[_currentIndex].controller.value = 1.0;
  }

  @override
  void dispose() {
    for (NavigationIconView view in _navigationViews)
      view.controller.dispose();
    super.dispose();
  }

  void _rebuild() {
    setState(() {
      // Rebuild in order to animate views.
    });
  }

  Widget _buildTransitionsStack() {
    final List<FadeTransition> transitions = <FadeTransition>[];

    for (NavigationIconView view in _navigationViews) {
      transitions.add(view.transition(_type, context));
    }

    // We want to have the newly animating (fading in) views on top.
    transitions.sort((FadeTransition a, FadeTransition b) {
      final Animation<double> aAnimation = a.opacity;
      final Animation<double> bAnimation = b.opacity;
      final double aValue = aAnimation.value;
      final double bValue = bAnimation.value;
      return aValue.compareTo(bValue);
    });

    return new Stack(children: transitions);
  }

  @override
  Widget build(BuildContext context) {
    final BottomNavigationBar bottomNavigationBar = new BottomNavigationBar(
      items: _navigationViews
          .map((NavigationIconView navigationView) => navigationView.item)
          .toList(),
      currentIndex: _currentIndex,
      type: _type,
      onTap: (int index) {
        setState(() {
          _navigationViews[_currentIndex].controller.reverse();
          _currentIndex = index;
          _navigationViews[_currentIndex].controller.forward();
        });
      },
    );


    return new Scaffold(
      body: new Center(child: _buildTransitionsStack()),
      bottomNavigationBar: bottomNavigationBar,
    );
  }
}


class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Map> topDestinations = [
    {
      'bgImg':'images/card.jpg',
      'title':'Gangtok',
      'subtitle':'SIKKIM',
    },
    {
      'bgImg':'images/card1.jpg',
      'title':'Gangtok',
      'subtitle':'SIKKIM',
    },
    {
      'bgImg':'images/card2.jpg',
      'title':'Gangtok',
      'subtitle':'SIKKIM',
    }
  ];

  @override
  Widget build(BuildContext context) {

    Widget _sliderAndHorizontalWidget(){
      return new Scaffold(
          body: new ListView(
            children: <Widget>[
              new Container(
                height: 1.0,
              ),

              new Container(
                height: 250.0,
                child: new DetailPage(),
              ),
              Padding(
                padding: const EdgeInsets.only(top:0.0),
                child:  new GradientHorizontalListWidgetWithImages(
                  gradientColors: [Colors.green,Colors.greenAccent],
                  title: 'TOP',
                  subTitle: 'Destinations',
                  items: topDestinations,
                  showSaveIcon: false,
                  cardTextAlignment: CrossAxisAlignment.start,
                  bannerTextAlignment: CrossAxisAlignment.start,
                  cardTapHandler: (x){
                    Navigator.push(context, new MaterialPageRoute(builder: (BuildContext context) => new DetailPage()));
                  },
                ),
              ),


            ],
          )
      );
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HotelListing()
    );
  }
}


class MyHomeApp extends StatelessWidget {
  List<Map> topDestinations = [
    {
      'bgImg':'images/card.jpg',
      'title':'Gangtok',
      'subtitle':'SIKKIM',
    },
    {
      'bgImg':'images/card1.jpg',
      'title':'Gangtok',
      'subtitle':'SIKKIM',
    },
    {
      'bgImg':'images/card2.jpg',
      'title':'Gangtok',
      'subtitle':'SIKKIM',
    }
  ];
  @override
  Widget build(BuildContext context) {
    return new Container(
        decoration: new BoxDecoration(
            image: new DecorationImage(image: new NetworkImage('http://images.1iphone5wallpaper.com/Gallery/15_Landscapes/1-iPhone-5-Wallpaper-Landscapes-fog-road.jpg'),fit: BoxFit.cover)
        ),
        child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(

              leading: IconButton(icon: Icon(Icons.menu),onPressed: (){},),
              elevation: 0.0,
              title: Text('Sikkim Travel',style: TextStyle(fontFamily: 'Poiret-One',fontWeight:FontWeight.bold)),
              backgroundColor: Colors.transparent,
            ),
            body:new GradientHorizontalListWidgetWithImages(
              gradientColors: [Colors.blue,Colors.lightBlueAccent],
              title: 'TOP',
              subTitle: 'Destinations',
              items: topDestinations,
              showSaveIcon: false,
              cardTextAlignment: CrossAxisAlignment.start,
              bannerTextAlignment: CrossAxisAlignment.start,
              cardTapHandler: (x){
                Navigator.push(context, new MaterialPageRoute(builder: (BuildContext context) => new DetailPage()));
              },
            )
        )
    );
  }
}
