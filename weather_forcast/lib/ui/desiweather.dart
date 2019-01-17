import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class desiweather extends StatefulWidget {
  @override
  _desiweatherState createState() => _desiweatherState();
}

class _desiweatherState extends State<desiweather> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text('desiweather'),
        centerTitle: true,
        backgroundColor: Colors.red,
        actions: <Widget>[

          new IconButton(icon: new Icon(Icons.menu,color: Colors.white,), onPressed: null)
        ],
      ),
      body: new Center(
          child: new Image(
              width: 500.0,
              height: 1200.0,
              fit: BoxFit.cover,
              image: new AssetImage('images/umbrella.png')
          )
      ),
    );
  }
}
