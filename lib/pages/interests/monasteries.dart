import 'package:flutter/material.dart';
import 'package:exploreskflutteryyyy/pages/attractions_page/dribbble_travel.dart';



List <Map> _interestData = [
  {"title" : "Bon \nMonastery","url" : "bon-monastery" , "lat": 27.338936 ,"long":88.606504},
  {"title" : "Do Drul Chorten" ,"url": "do-drul-chorten-monastery", "lat": 27.347835 ,"long":88.628696},
  {"title" : "Dubdi Monastery" ,"url": "dubdi-monastery", "lat": 27.702491 ,"long":88.147535},
  {"title" : "Enchey Monastery" ,"url": "enchey-monastery", "lat": 27.689057 ,"long":88.742972},
  {"title" : "Labrang Monastery" ,"url": "labrang-monastery", "lat": 27.319772 ,"long":88.240033},
  {"title" : "Mangbure Monastery" ,"url": "mangbure-monastery", "lat": 27.374454 ,"long":88.763212},
  {"title" : "Namgyal Institute" ,"url": "namgyal-institute-of-tibetology", "lat": 27.306581,"long":88.363999},
  {"title" : "Pemayangste Monastery" ,"url": "pemayangste-monastery", "lat": 27.166996,"long":88.365212},
  {"title" : "Phensang Monastery" ,"url": "phensang-monastery", "lat": 27.386568,"long":88.830873},
  {"title" : "Phodong Monastery" ,"url": "phodong-monastery", "lat": 27.279801,"long":88.594348},
  {"title" : "Ralang Monastery" ,"url": "ralang-monastery", "lat":27.232274,"long":88.418576},
  {"title" : "Rumtek Monastery" ,"url": "rumtek-monastery", "lat": 27.365857,"long":88.837919},
  {"title" : "Samdruptse Monastery" ,"url": "samdruptse-monastery-ngadak", "lat": 27.365857,"long":88.837919},
  {"title" : "Sanga Choling Monastery" ,"url": "sanga-choeling-monastery", "lat": 27.365857,"long":88.837919},
  {"title" : "Serdup Choling Monastery" ,"url": "serdup-choling-monastery", "lat": 27.365857,"long":88.837919},
  {"title" : "Tsuklakhang Monastery" ,"url": "tsuklakhang-monastery", "lat": 27.365857,"long":88.837919},

];

class MonasteriesPage extends StatelessWidget{

  _buildItems(){
    return _interestData.map((item){
      var m = new Map();
      m['title'] = item['title'];
      m['image'] = "images/Monastries/enlarged/" + item['url'] + ".jpg";
      m['subtitle'] = 'Sikkim';
      m['urlPath'] = 'data/attractions/Monasteries/' + item['url'] + '.twig';
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





