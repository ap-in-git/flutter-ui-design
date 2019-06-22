import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF20283f),
        leading: Icon(Icons.dehaze),
        elevation: 0.0,
        actions: <Widget>[
          IconButton(
              icon: Stack(
                children: <Widget>[
                  Icon(Icons.notifications_none),
                  Positioned(
                    child: Icon(
                      Icons.brightness_1,
                      size: 10.0,
                      color: Color(0xFFffd12f),
                    ),
                    left: 16.0,
                  )
                ],
              ),
              onPressed: () {}),
        ],
      ),
      body: Column(
        children: <Widget>[_buildProfile(),_buildMiddleContainer()],
      ),
      backgroundColor: Color(0xFF20283f),
    );
  }

  _buildProfile() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Column(
          children: <Widget>[
            Container(
              height: 100.0,
              width: 100.0,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  image: DecorationImage(
                      image: AssetImage('images/saitama.jpg'),
                      fit: BoxFit.fitWidth,
                      alignment: FractionalOffset.topCenter)),
            ),
            SizedBox(height: 17.0),
            Text('Welcome back',style: TextStyle(color: Color(0xFFd3d3d3),fontSize: 15.0)),
            SizedBox(height: 15.0,),
            Text('Super S. Saitama',style: TextStyle(color: Colors.white,fontSize: 23.0,fontWeight: FontWeight.w500)),
          ],
        )
      ],
    );
  }

  _buildMiddleContainer() {
    return Container(
      margin: EdgeInsets.only(top: 15.0),
      decoration: BoxDecoration(
        color: Colors.orange,
        borderRadius: BorderRadius.only(topRight: Radius.circular(40.0),topLeft: Radius.circular(40.0))
      ),
      height: 150.0,
      width: double.infinity,
      child: Column(
        children: <Widget>[
          SizedBox(height: 110.0,),
          Container(
            child: Container(
              height: 40.0,
            ),
            decoration: BoxDecoration(
              border: Border.all(width: 0.0),
              color:  Color(0xFF20283f),
              borderRadius: BorderRadius.only(topRight: Radius.circular(50.0),topLeft: Radius.circular(50.0))
            ),
          )
        ],
      ),
    );
  }
}
