import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'dart:async';
import 'dart:convert';
import '../util/utils.dart' as util;
import 'package:http/http.dart' as http;


class desiweather extends StatefulWidget {
  @override
  _desiweatherState createState() => _desiweatherState();
}

class _desiweatherState extends State<desiweather> {

  void showStuff() async{
    getWeather(util.apiId, util.defaultCity);
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text('Desi Weather'),
        centerTitle: true,
        backgroundColor: Colors.red,
        actions: <Widget>[

          new IconButton(icon: new Icon(Icons.menu,color: Colors.white,), onPressed: null)
        ],
      ),
      body:
      new Stack(
        children: <Widget>[
          new Center(
              child: new Image(
                  width: 500.0,
                  height: 1200.0,
                  fit: BoxFit.cover,
                  image: new AssetImage('images/umbrella.png')
              )
          ),
          new Container(
            alignment: Alignment.topRight,
            margin: EdgeInsets.fromLTRB(0.0, 20, 20, 0.0),
            child: new Text('Something',style: cityStyle())
          ),
          new Container(
              alignment: Alignment.center,
              child: new Image.asset('images/light_rain.png')
          ),
          new Container(
              alignment: Alignment.center,
              margin: EdgeInsets.fromLTRB(0.0, 150, 50.0, 0.0),
              child: new Text('97.5'+'F',style: tempStyle())
          ),
        ],
      ),

    );
  }
  Future<Map> getWeather(String apiId,String city ) async{
    String apiUrl = 'http://api.openweathermap.org/data/2.5/weather?q=$city&APPID=$apiId';
    http.Response response = await http.get(apiUrl);
    return json.decode(response.body);

}
  Widget updateTempWidget(String city) {
    return new FutureBuilder(
        future: getWeather(util.apiId, city == null ? util.defaultCity : city),
        builder: (BuildContext context, AsyncSnapshot<Map> snapshot) {
          //where we get all of the json data, we setup widgets etc.
          if (snapshot.hasData) {
            Map content = snapshot.data;
            return new Container(
              margin: const EdgeInsets.fromLTRB(30.0, 250.0, 0.0, 0.0),
              child: new Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new ListTile(
                    title: new Text(
                      content['main']['temp'].toString() +" F",
                      style: new TextStyle(
                          fontStyle: FontStyle.normal,
                          fontSize: 49.9,
                          color: Colors.white,
                          fontWeight: FontWeight.w500),
                    ),
                    subtitle: new ListTile(
                      title: new Text(
                        "Humidity: ${content['main']['humidity'].toString()}\n"
                            "Min: ${content['main']['temp_min'].toString()} F\n"
                            "Max: ${content['main']['temp_max'].toString()} F ",

                        style: extraData(),

                      ),
                    ),
                  )
                ],
              ),
            );
          } else {
            return new Container();
          }
        });
  }
}

TextStyle cityStyle(){
return new TextStyle(
  color: Colors.white,
  fontSize: 22.9,
  fontStyle: FontStyle.italic

);
}
TextStyle tempStyle(){
  return new TextStyle(
      color: Colors.white,
      fontSize: 49.9,
      fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w500,


  );
}
TextStyle extraData() {
  return new TextStyle(
      color: Colors.white70,
      fontStyle: FontStyle.normal,
      fontSize: 17.0);

}