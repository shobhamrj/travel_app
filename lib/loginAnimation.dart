import 'package:flutter/material.dart';
import 'dart:async';

import 'package:exploreskflutteryyyy/pages/attractions_page/dribbble_travel.dart';
import 'package:exploreskflutteryyyy/pages/interests/interests.dart';


class ButtonAnimation extends StatefulWidget{
  @override
  _ButtonAnimationState createState() => _ButtonAnimationState();
}

class _ButtonAnimationState extends State<ButtonAnimation>  with TickerProviderStateMixin{
AnimationController _buttonAnimationController;

@override
  void initState() {
    super.initState();
    _buttonAnimationController = new AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000)
    );
  }

  @override
  void dispose() {
    super.dispose();
    _buttonAnimationController.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return BtnStaggerAnimation(buttonController: _buttonAnimationController,);
  }
}



class BtnStaggerAnimation extends StatelessWidget {
  final AnimationController buttonController;

  final Animation btnSqueezeAnimation;
  final Animation btnGrowAnimation;
  final Animation<EdgeInsets> btnCurveAnimation;


  BtnStaggerAnimation({Key key, this.buttonController})

      : btnSqueezeAnimation = new Tween(begin: 320.0, end: 60.0).animate(
      new CurvedAnimation(parent: buttonController, curve: new Interval(
          0.0, 0.350, curve: Curves.easeInOut
      ))
  ),
        btnGrowAnimation = new Tween(begin: 70.0, end: 1000.0).animate(
            new CurvedAnimation(
                parent: buttonController,
                curve: new Interval(0.359, 0.999, curve: Curves.ease)
            )
        ),
        btnCurveAnimation = new EdgeInsetsTween(
            begin: new EdgeInsets.only(bottom: 50.0),
            end: new EdgeInsets.only(bottom: 0.0)
        ).animate(
            new CurvedAnimation(parent: buttonController, curve: new Interval(
                0.500,
                0.800,
                curve: Curves.ease
            ))
        )


  ,
        super(key: key);

  Future<Null> _playAnimation() async {
    try {
      print('xxiix ??');
      await buttonController.forward();
      await buttonController.reverse();
    }
    on TickerCanceled{}
  }




   Widget _signInBtn(BuildContext context , Widget child){
   return Padding(
     padding: btnGrowAnimation.value == 70 ? EdgeInsets.only(bottom: 20.0) : EdgeInsets.only(bottom: 0.0),
     child: Hero(
       tag: "FOKINGANIMATION",
       child: Material(
         color: Colors.transparent,
         child: InkWell(
           onTap: (){
             _playAnimation();
           },
           child: btnGrowAnimation.value < 300
             ? Container(
              alignment: FractionalOffset.center,
              width: btnGrowAnimation.value == 70
               ? btnSqueezeAnimation.value
               : btnGrowAnimation.value,
              height: btnGrowAnimation.value == 70
                  ? 60.0
                  : btnGrowAnimation.value,
              decoration: new BoxDecoration(
                borderRadius: btnGrowAnimation.value < 500
                    ? new BorderRadius.circular(btnGrowAnimation.value)
                    : new BorderRadius.circular(0.0),
                color: new Color.fromRGBO(245, 70, 45, 1.0)
              ),
             child: btnSqueezeAnimation.value > 70
                 ? new Text(
                 'Sign in',
                  style: TextStyle(
                   color: Colors.white,
                   fontSize: 17.0,
                  ),
                )
             :  btnGrowAnimation.value < 400.0 ? new CircularProgressIndicator(
                value: null,
                strokeWidth: 1.0,
                valueColor: new AlwaysStoppedAnimation<Color>(
                   Colors.white
                 ),
              )
            : null
           )
           : new Container(
             width: btnGrowAnimation.value,
             height: btnGrowAnimation.value > MediaQuery.of(context).size.height ? MediaQuery.of(context).size.height : btnGrowAnimation.value,
             decoration: new BoxDecoration(
               color:  new Color.fromRGBO(245, 70, 45, 1.0),
               shape: btnGrowAnimation.value < 500
                   ? BoxShape.circle
                   : BoxShape.rectangle,
             ),
           ),
         ),
       ),
     ),
   );
  }

  @override
  Widget build(BuildContext context) {

    buttonController.addListener(() {
      if (buttonController.isCompleted) {
        Navigator.push(context, new MaterialPageRoute(builder: (BuildContext context){
          return new Scaffold(
            body: new InterestPage(),
          );
        }));
      }
    });

    return Stack(
      children: <Widget>[
        new Image.asset('images/login.jpg',fit: BoxFit.cover,width: double.infinity,height: double.infinity,)
        ,
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            new Expanded(child: Container()),
            new InputFieldArea(
              hint: "Username",
              obscure: false,
              icon: Icons.person_outline,
            ),
            new InputFieldArea(
              hint: "Password",
              obscure: true,
              icon: Icons.lock_outline,
            ),
            new Row(
              children: <Widget>[],
            ),
            new Expanded(child: Container(),),


          ],
        ),
        new Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Center(
              child: Container(
                color: Colors.transparent,
                child:  new AnimatedBuilder(
                  builder: _signInBtn,
                  animation: buttonController,
                ),
              ),
            )
          ],
        ),
      ],
    );
  }
}





class InputFieldArea extends StatelessWidget {
  final String hint;
  final bool obscure;
  final IconData icon;
  InputFieldArea({this.hint, this.obscure, this.icon});
  @override
  Widget build(BuildContext context) {
    return (new Container(
      padding: EdgeInsets.symmetric(horizontal: 15.0),
      margin: EdgeInsets.symmetric(horizontal: 10.0),
      decoration: new BoxDecoration(
        border: new Border(
          bottom: new BorderSide(
            width: 0.5,
            color: Colors.white24,
          ),
        ),
      ),
      child: new TextFormField(
        obscureText: obscure,
        style: const TextStyle(
          color: Colors.white,
        ),
        decoration: new InputDecoration(
          icon: new Icon(
            icon,
            color: Colors.white,
          ),
          border: InputBorder.none,
          hintText: hint,
          hintStyle: const TextStyle(color: Colors.white, fontSize: 15.0),
          contentPadding: const EdgeInsets.only(
              top: 30.0, right: 30.0, bottom: 30.0, left: 5.0),
        ),
      ),
    ));
  }
}