import 'package:exploreskflutteryyyy/components/arcClipper.dart';
import 'package:exploreskflutteryyyy/loginAnimation.dart';
import 'package:flutter/material.dart';

class HotelForm extends StatefulWidget {
  @override
  _HotelFormState createState() => _HotelFormState();
}

class _HotelFormState extends State<HotelForm> {

  Widget _firstRow(){
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Expanded(
          flex:2,
          child: ListTile(
            title: Text(
              'Marina Bay Sands',
              style: TextStyle(
                color: Colors.black54,
                fontSize: 25.0,
              ),
            ),
            subtitle: Row(
              children: <Widget>[
                Icon(Icons.location_on,color: Colors.black54,),
                Padding(
                  padding: const EdgeInsets.only(left:4.0),
                  child: Text('Gangtok , Sikkim',style: TextStyle(color: Colors.black45),),
                )
              ],
            ),
          ),
        ),
        Expanded(
            child: Container(
              margin: EdgeInsets.only(right:15.0),
              padding: EdgeInsets.all(8.0),
              height: 80.0,
                width: 140.0,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('images/gallery/item3.jpg'),
                        fit: BoxFit.cover
                    ),
                    borderRadius: BorderRadius.circular(6.0),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey,
                          spreadRadius: 2.0,
                          blurRadius: 5.0
                      ),
                    ]
                )
            )
        )
      ],
    );
  }


  Widget _secondRow(){
    return new Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(vertical:8.0),
              child: Text(
                'CHECK IN',
                style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Material(
              child: InkWell(
                onTap: (){
                  //TODO implement calender
                },
                child: Container(
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(top:8.0,bottom: 4.0),
                        child: Text(
                            'SATURDAY'.toUpperCase(),
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Text(
                          '29 Apr',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )

          ],
        ),
        Column(
          children: <Widget>[
            IconButton(
              onPressed: (){},
              color: Colors.grey,
                icon: Icon(Icons.perm_contact_calendar),
              splashColor: Colors.black12,
              highlightColor: Colors.transparent,
            ),
            Text(
                '4 Nights',
                style: TextStyle(
                color: Colors.grey
              ),
            )
          ],
        ),
        Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(vertical:8.0),
              child: Text(
                'CHECK OUT',
                style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Material(
              child: InkWell(
                onTap: (){
                  //TODO implement calender
                },
                child: Container(
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(top:8.0,bottom: 4.0),
                        child: Text(
                          'SATURDAY'.toUpperCase(),
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Text(
                        '29 Apr',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )

          ],
        ),

      ],
    );
  }


  Widget _thirdRow(){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(vertical:10.0),
                child: Text(
                  '1 ROOM',
                  style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical:8.0),
                child: Text(
                  'Deluxe Room',
                  style: TextStyle(
                    color: Colors.black54,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          Expanded(child: Container()),
          Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top:3.0,bottom: 4.0),
                child: Icon(Icons.airline_seat_individual_suite,color: Colors.grey,size: 30.0,)
              ),
              Text('2 Adults 1 Child')
            ],
          ),
        ],
      ),
    );
  }

  Widget _fourthRow(){
    return Padding(
      padding: EdgeInsets.symmetric(vertical:15.0),
      child: Center(
        child: Text(
          'CONTACT DETAILS',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.grey
          ),
        ),
      ),
    );
  }


  Widget _form(){
    return Container(
      margin: EdgeInsets.only(left: 15.0,right:15.0,top:0.0),
      child: new Card(
        elevation:0.0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new ListTile(
              title: new TextField(
                decoration: new InputDecoration(
                  border: new OutlineInputBorder(
                    borderRadius: const BorderRadius.all(
                      const Radius.circular(30.0),
                    ),
                    borderSide: new BorderSide(
                      color: Colors.red,
                      width: 1.0,
                    ),
                  ),
                  prefixIcon: Padding(
                    padding: const EdgeInsets.only(right:8.0),
                    child: const Icon(Icons.person),
                  ),
                  labelStyle: TextStyle(
                      color: Colors.red,
                      fontSize: 24.0
                  ),
                  hintText: "Name",
                ),
              ),
            ),
            new ListTile(
              title: new TextField(
                decoration: new InputDecoration(
                  border: new OutlineInputBorder(
                    borderRadius: const BorderRadius.all(
                      const Radius.circular(30.0),
                    ),
                    borderSide: new BorderSide(
                      color: Colors.red,
                      width: 1.0,
                    ),
                  ),
                  prefixIcon: Padding(
                    padding: const EdgeInsets.only(right:8.0),
                    child: const Icon(Icons.phone),
                  ),
                  hintText: "Phone",
                ),
              ),
            ),
            new ListTile(
              title: new TextField(
                decoration: new InputDecoration(
                  border: new OutlineInputBorder(
                    borderRadius: const BorderRadius.all(
                      const Radius.circular(30.0),
                    ),
                    borderSide: new BorderSide(
                      color: Colors.red,
                      width: 1.0,
                    ),
                  ),
                  labelStyle: Theme.of(context).textTheme.caption.copyWith(color: Colors.black26),
                  prefixIcon: Padding(
                    padding: const EdgeInsets.only(right:8.0),
                    child: const Icon(Icons.email),
                  ),
                  hintText: "Email",
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
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: <Widget>[
          Stack(
            children: <Widget>[
              new ClipPath(
                clipper: ArcClipper(cutheight: 30),
                child: new Container(
                  width: double.infinity,
                  height: 238.0,
                  child: Image.asset('images/hotel/slider1.jpg',fit: BoxFit.cover,),
                ),
              ),
              //Container(height: 268.0,width:double.infinity,child: Align(alignment: Alignment.bottomCenter,child: new Text('Hotel Singshore',style: TextStyle(fontSize: 25.0,color: Colors.white,fontWeight: FontWeight.bold,fontFamily: 'Lato'),)))
            ],
          ),
          _firstRow(),
          _fourthRow(),
          _form(),

          _secondRow(),
          Divider(),
          _thirdRow(),
          Container(
            padding: EdgeInsets.all(10.0),
            child: Material(
              borderRadius: BorderRadius.circular(30.0),
              elevation: 10.0,
              child: Ink(
                child: InkWell(
                  onTap: (){

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
                      padding: EdgeInsets.symmetric(horizontal:15.0,vertical:15.0),

                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(left:8.0),
                            child: new Text('Submit Query'.toUpperCase(),
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
        ],
      ),
    );
  }
}
//image: DecorationImage(
//image: AssetImage('images/hotel/slider1.jpg'),
//fit: BoxFit.cover
//),