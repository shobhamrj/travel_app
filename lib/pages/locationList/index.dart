import 'package:flutter/material.dart';
import 'package:exploreskflutteryyyy/pages/attractions_page/dribbble_travel.dart';
import 'package:exploreskflutteryyyy/pages/interests/interests.dart';

class LocationsList extends StatefulWidget {
  @override
  _LocationsListState createState() => _LocationsListState();
}

class _LocationsListState extends State<LocationsList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        title: Text('DESTINATIONS',style: TextStyle(color:Colors.black45,fontWeight: FontWeight.bold),),
        elevation: 0.0,
      ),
      body: ListView(
        children: <Widget>[
        new LocationListItem(
        title: 'Scenic Places',
          bg: 'images/gallery/item17.jpg',
          color: Colors.green,
          likes: 2.3,
          visitors: 72,
          onTap: (){
            Navigator.pushNamed(context, '/scenicPlacesPage');
          },
        ),
          new LocationListItem(
            title: 'Popular Places',
            bg: 'images/gallery/item26.jpg',
            color: Colors.orange,
            likes: 2.3,
            visitors: 72,
            onTap: (){
              Navigator.pushNamed(context, '/interests');
            },
          ),

          new LocationListItem(
            title: 'Monasteries',
            bg: 'images/Monastries/enlarged/bon-monastery.jpg',
            color: Colors.redAccent,
            likes: 2.3,
            visitors: 72,
            onTap: (){
              Navigator.pushNamed(context, '/monasteries');
            },
          ),

          new LocationListItem(
            title: 'Pilgimages',
            bg: 'images/Pilgrimages/enlarged/sri-sridi-baba-sai-mandir.jpg',
            color: Colors.blue,
            likes: 2.3,
            visitors: 72,
            onTap: (){
              Navigator.pushNamed(context, '/pilgrimages');
            },
          )
        ],
      ),
    );
  }
}


class LocationListItem extends StatelessWidget {

  final String title;
  final String bg;
  final Color color;
  final int visitors;
  final double likes;
  final Function onTap;

  LocationListItem({
    this.title,
    this.bg,
    this.likes,
    this.color,
    this.visitors,
    this.onTap
  });
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        child: Container(
          height: 200.0,
          width: double.infinity,
          child: new Stack(
            fit: StackFit.expand,
            children: <Widget>[
              new Image.asset(bg,fit: BoxFit.cover,),
              new Container(
                width: double.infinity,
                height: double.infinity,
                decoration: new BoxDecoration(
                  gradient: LinearGradient(
                      colors: [color.withOpacity(0.4),Colors.white.withOpacity(0.2)],
                      begin: FractionalOffset.bottomLeft,
                      end: FractionalOffset.topRight,
                      stops: [0.2,1.0]
                  ),
                ),
              ),
              new Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      new IconButton(icon: Icon(Icons.favorite , color:Colors.white), onPressed: (){}),
                      new Text('$likes k',style: TextStyle(color:Colors.white),)
                    ],
                  )
                ],
              ),
              new Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new Text(
                    title,
                    style: TextStyle(
                      color:Colors.white,
                      fontSize: 35.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Card(
                    color: color,
                    elevation: 3.0,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: new Text(
                        '$visitors Visitors'.toUpperCase(),
                        style: TextStyle(
                            color:Colors.white,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
