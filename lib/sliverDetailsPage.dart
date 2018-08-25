import 'package:flutter/material.dart';


class DetailsPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new CustomScrollView(

        slivers: <Widget>[
          new SliverAppBar(
            expandedHeight: 300.0,
            flexibleSpace: new FlexibleSpaceBar(
              background: new Image(image: new AssetImage('images/card1.jpg'),fit: BoxFit.cover,),
            ),
            leading: new BackButton(color: Colors.white,),

          ),


          new SliverList(
            delegate: new SliverChildBuilderDelegate(
              (context,index) => new ListTile(
                  title: new Text('Item $index'),
                )
            )
          )
        ],
      )
    );
  }
}



//new Container(
//color: new Color(0xFFFFFFFF),
//child: new Stack(
//children: <Widget>[
//_getBackground(),
//_getGradient(),
//_getContent(),
//_getToolbar(context)
//],
//),
//),