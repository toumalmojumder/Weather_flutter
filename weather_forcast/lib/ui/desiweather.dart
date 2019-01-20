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
          )
        ],
      ),

    );
  }
}
TextStyle cityStyle(){
return new TextStyle(
  color: Colors.white,
  fontSize: 22.9,
  fontStyle: FontStyle.italic

);
}