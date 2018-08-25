import 'package:flutter/material.dart';
import 'package:exploreskflutteryyyy/pages/attractions_page/dribbble_travel.dart';



List <Map> _interestData = [
  {"title" : "Baba Mandir","url" : "baba-harbajan-singh-mandir" , "lat": 27.338936 ,"long":88.606504},
  {"title" : "Buddha Park" ,"url": "buddha-park", "lat": 27.347835 ,"long":88.628696},
  {"title" : "Ganesk Tok" ,"url": "ganesh-tok", "lat": 27.702491 ,"long":88.147535},
  {"title" : "Hanuman Tok" ,"url": "hanuman-tok", "lat": 27.689057 ,"long":88.742972},
  {"title" : "Sai Mandir" ,"url": "sri-sridi-baba-sai-mandir", "lat": 27.319772 ,"long":88.240033},
  {"title" : "Saraswati Mandir" ,"url": "saraswati-mandir", "lat": 27.374454 ,"long":88.763212},
  {"title" : "Siddheswara Dham" ,"url": "siddheshwara-dham", "lat": 27.306581,"long":88.363999},

];

class PilgrimsPage extends StatelessWidget{

  _buildItems(){
    return _interestData.map((item){
      var m = new Map();
      m['title'] = item['title'];
      m['image'] = "images/Pilgrimages/enlarged/" + item['url'] + ".jpg";
      m['subtitle'] = 'Sikkim';
      m['urlPath'] = 'data/attractions/Pilgrimages/' + item['url'] + '.twig';
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





