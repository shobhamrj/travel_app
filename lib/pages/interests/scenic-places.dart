import 'package:flutter/material.dart';
import 'package:exploreskflutteryyyy/pages/attractions_page/dribbble_travel.dart';



List <Map> _interestData = [
  {"title":"Aritar","url":"aritar"},
  {"title":"Bakthang Waterfalls","url":"bakthang-waterfalls"},
  {"title":"Banjhakri Waterfalls","url":"banjhakri-waterfalls"},
  {"title":"Borong Hot springs","url":"borong-hot-springs"},
  {"title":"Changu Lake","url":"changu-lake"},
  {"title":"Gurudongmar Lake","url":"gurudongmar-lake"},
  {"title":"Gyalshing","url":"gyalshing"},
  {"title":"Khandu Sangphug","url":"khandu-sangphug"},
  {"title":"Khecheoplari Lake","url":"khecheoplari-lake"},
  {"title":"Lachung","url":"lachung"},
  {"title":"Mangan","url":"mangan"},
  {"title":"Namchi","url":"namchi"},
  {"title":"Pakyong","url":"pakyong"},
  {"title":"Pelling","url":"pelling"},
  {"title":"Rapdentse Palace","url":"rapdentse-palace"},
  {"title":"Ravangla","url":"ravangla"},
  {"title":"Seven Sister Waterfalls","url":"seven-sister-waterfalls"},
  {"title":"Shingshore Bridge","url":"shingshore-bridge"},
  {"title":"Tarey Bhir","url":"tarey-bhir"},
  {"title":"Tashi View Point","url":"tashi-view-point"},
  {"title":"Tendong Hill","url":"tendong-hill"},
  {"title":"Thangu","url":"thangu"},
  {"title":"Yume Samdong","url":"yume-samdong"},
  {"title":"Yumathang Valley","url":"yumthang-valley"},
];

class ScenicPlacesPage extends StatelessWidget{

  _buildItems(){
    return _interestData.map((item){
      var m = new Map();
      m['title'] = item['title'];
      m['image'] = "images/scenic-places/enlarged/" + item['url'] + ".jpg";
      m['subtitle'] = 'Sikkim';
      m['urlPath'] = 'data/attractions/scenic-places/' + item['url'] + '.twig';
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





