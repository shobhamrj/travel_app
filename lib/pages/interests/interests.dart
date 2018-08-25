import 'package:flutter/material.dart';
import 'package:exploreskflutteryyyy/pages/attractions_page/dribbble_travel.dart';



List <Map> _interestData = [
  {"title" : "Gangtok","url" : "gangtok" , "lat": 27.338936 ,"long":88.606504},
  {"title" : "Hanuman Tok" ,"url": "hanuman-tok", "lat": 27.347835 ,"long":88.628696},
  {"title" : "Kanchendzonga Park" ,"url": "kanchendzonga-park", "lat": 27.702491 ,"long":88.147535},
  {"title" : "Lachung" ,"url": "lachung", "lat": 27.689057 ,"long":88.742972},
  {"title" : "Pelling" ,"url": "pelling", "lat": 27.319772 ,"long":88.240033},
  {"title" : "Changu Lake" ,"url": "changu-lake", "lat": 27.374454 ,"long":88.763212},
  {"title" : "Ravangla" ,"url": "ravangla", "lat": 27.306581,"long":88.363999},
  {"title" : "Siddhesvara Dham" ,"url": "siddheshwara-dham", "lat": 27.166996,"long":88.365212},
  {"title" : "Nathula Pass" ,"url": "nathula-pass", "lat": 27.386568,"long":88.830873},
  {"title" : "Sikkim Science Centre" ,"url": "sikkim-science-centre", "lat": 27.279801,"long":88.594348},
  {"title" : "Temi Tea Garden" ,"url": "temi-tea-garden", "lat":27.232274,"long":88.418576},
  {"title" : "Baba Mandir" ,"url": "baba-harbajan-singh-mandir", "lat": 27.365857,"long":88.837919},
];

class InterestPage extends StatelessWidget{

  _buildItems(){
    return _interestData.map((item){
      var m = new Map();
      m['title'] = item['title'];
      m['image'] = "images/explore-sikkim/" + item['url'] + ".jpg";
      m['subtitle'] = 'Sikkim';
      m['urlPath'] = 'data/attractions/interests/' + item['url'] + '.twig';
      m['lat'] = item['lat'];
      m['long'] = item['long'];
      return m;
    }).toList();
    }


  @override
  Widget build(BuildContext context) {
    print(_buildItems());
    return Material(
      child:  new Locations(
        displayItems:_buildItems(),
      ),
    );
  }
}





