import 'package:flutter/material.dart';


class GradientHorizontalListWidgetWithImages extends StatelessWidget {

  final gradientColors;
  final String title;
  final String subTitle;
  final bool showSaveIcon;
  final CrossAxisAlignment cardTextAlignment;
  final CrossAxisAlignment bannerTextAlignment;
  final List<Map> items;
  final Function cardTapHandler;

  GradientHorizontalListWidgetWithImages({
    this.gradientColors,
    this.title,
    this.subTitle,
    this.items,
    this.cardTapHandler,
    this.showSaveIcon,
    this.bannerTextAlignment,
    this.cardTextAlignment
  });



  @override
  Widget build(BuildContext context) {
    return new Column(
      children: <Widget>[
        new Container(
          padding: EdgeInsets.symmetric(vertical: 10.0,horizontal: 20.0),
          decoration: new BoxDecoration(
              gradient: new LinearGradient(
                  colors: gradientColors,
                  begin: new FractionalOffset(1.0, 0.0),
                  end: new FractionalOffset(0.0, 1.0),
                  stops: [0.2,0.6,1.0]
              )
          ),
          child: new Column(
            crossAxisAlignment: bannerTextAlignment,
            children: <Widget>[
              new Text(title,style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 32.0),),
              new Text(subTitle,style: TextStyle(fontFamily: 'Poiret-One',color: Colors.white,fontSize: 32.0))
            ],
          ),
          width: double.infinity,
          height: 200.0,
        )
        ,
        new Transform(
          transform:new Matrix4.translationValues(0.0, -100.0, 0.0),
          child: new Container(
            height: 230.0,
            child: new ListView.builder(scrollDirection: Axis.horizontal,itemCount: items.length,itemBuilder:(context,index){
              return new Container(
                decoration: new BoxDecoration(
                  boxShadow: [
                    new BoxShadow(
                      color: Colors.black54.withOpacity(0.3),
                      blurRadius: 10.0,
                      spreadRadius: 0.0,
                      offset: new Offset(0.0,10.0)
                    )
                  ]
                ),
                width: 250.0,
                height: 100.0,
                margin: new EdgeInsets.symmetric(horizontal:20.0,vertical:30.0),
                child: new InkWell(
                  onTap:(){print('cardTapped');cardTapHandler(items[index]['bgImg']);},
                  child: Card(
                    elevation: 0.0,
                    child: Stack(
                      children: <Widget>[
                        new Image.asset(items[index]['bgImg'],width: double.infinity,height:double.infinity,fit: BoxFit.cover,)
                        ,new Opacity(opacity: 0.6,child: new Image.asset('images/shadow.png',width: double.infinity,height:double.infinity,fit: BoxFit.cover)),

                        showSaveIcon
                            ? new Positioned(
                          top: -10.0,
                          right: -15.0,
                          child: new Container(
                            padding: EdgeInsets.all(10.0),
                            child: new IconButton(icon: Icon(Icons.bookmark_border,color: Colors.white,),iconSize: 25.0, onPressed: (){
                              print('xaxa');
                            }),
                          ),
                        )
                            : new Container(),

                        new Container(
                          padding: EdgeInsets.only(left: 15.0,top:85.0),
                          child: new Column(
                            crossAxisAlignment: cardTextAlignment,
                            children: <Widget>[
                              Text(items[index]['title'],style: TextStyle(color: Colors.white,fontSize: 24.0,fontFamily: 'Poiret-One',fontWeight: FontWeight.bold),),
                              new Padding(padding: EdgeInsets.only(top: 10.0)),
                              Text(items[index]['subtitle'],style: TextStyle(color: Colors.white,fontSize: 14.0,fontWeight: FontWeight.bold),),
                            ],
                          ),
                        ),

                      ],
                    ),
                  ),
                ),
              );
            }),
          ),
        ),
      ],
    );
  }
}
