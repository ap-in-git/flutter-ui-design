import 'package:flutter/material.dart';
import 'side_drawer.dart';
class CryptoCurrencyProfile extends StatefulWidget {
  @override
  _CryptoCurrencyProfileState createState() => _CryptoCurrencyProfileState();
}

class _CryptoCurrencyProfileState extends State<CryptoCurrencyProfile> {
  final secondaryColor = 0xff2e2b4e;
  GlobalKey<ScaffoldState>  _scaffoldKey = new GlobalKey();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      key: _scaffoldKey,
      drawer: SideDrawer(),
      appBar: AppBar(
        backgroundColor: Color(0xFF20283f),
        leading: IconButton(icon:Icon(Icons.dehaze) ,onPressed: (){
          _scaffoldKey.currentState.openDrawer();
        },),
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
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          _buildProfile(),
          _buildMiddleContainer(context),
          _buildMyPortfolio(),
          _buildBottomContainer()
        ],
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
            Text('Welcome back',
                style: TextStyle(color: Color(0xFFd3d3d3), fontSize: 15.0)),
            SizedBox(
              height: 15.0,
            ),
            Text('Super S. Saitama',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 23.0,
                    fontWeight: FontWeight.w500)),
          ],
        )
      ],
    );
  }

  _buildMiddleContainer(BuildContext context) {
    return Container(
      height: 180.0,
      margin: EdgeInsets.only(top: 30.0),
      child: Stack(
        alignment: Alignment.topCenter,
        children: <Widget>[
          Positioned(
            child: Container(
              decoration: BoxDecoration(
                  color: Color(0xff2e2b4e),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40.0),
                      topRight: Radius.circular(40.0))),
              child: Padding(
                padding: EdgeInsets.only(
                    left: 40.0, top: 20.0, right: 40.0, bottom: 60.0),
                child: Row(
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        _buildMiddleContainerDetail('Portfolio view', '52.51'),
                        Spacer(),
                        _buildMiddleContainerDetail(
                            'Current roud ups', '251.00'),
                      ],
                    ),
                    Spacer(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        _buildMiddleContainerDetail('Earning so far', '62.51'),
                        Spacer(),
                        FlatButton(
                          onPressed: () {},
                          padding: EdgeInsets.all(10.0),
                          child: Icon(
                            Icons.add_circle_outline,
                            color: Colors.white,
                            size: 30.0,
                          ),
                          color: Color(0xffbbbbbb),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0)),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
            height: 200.0,
            width: MediaQuery.of(context).size.width,
          ),
          Positioned(
            child: Container(
              decoration: BoxDecoration(
                  color: Color(0xFF20283f),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40.0),
                      topRight: Radius.circular(40.0))),
            ),
            top: 150.0,
            width: MediaQuery.of(context).size.width,
            height: 50.0,
          )
        ],
      ),
    );
  }

  _buildMiddleContainerDetail(String title, String amount) {
    return Column(
      children: <Widget>[
        Text(
          title.toUpperCase(),
          style: TextStyle(color: Color(0xff6b7283)),
        ),
        SizedBox(
          height: 2.0,
        ),
        Text(
          "\$" + amount,
          style: TextStyle(
              color: Colors.white, fontSize: 30.0, fontWeight: FontWeight.bold),
        )
      ],
    );
  }

  _buildMyPortfolio() {
    return Container(
      padding: EdgeInsets.only(left: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Text(
            'My portfolio',
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w400,
                fontSize: 20.0),
          ),
          SizedBox(
            height: 10.0,
          ),
          Container(
            height: 100.0,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                _buildCurrencyIconPercent(Icons.add_circle_outline, '50'),
                _buildCurrencyIconPercent(Icons.close, '60'),
                _buildCurrencyIconPercent(Icons.add_circle_outline, '50'),
                _buildCurrencyIconPercent(Icons.add_circle_outline, '50'),
                _buildCurrencyIconPercent(Icons.add_circle_outline, '50'),
                _buildCurrencyIconPercent(Icons.add_circle_outline, '50'),
                _buildCurrencyIconPercent(Icons.add_circle_outline, '50')
              ],
            ),
          ),
        ],
      ),
    );
  }

  _buildCurrencyIconPercent(IconData iconData, String percent) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20.0),
      child: Container(
        margin: EdgeInsets.only(left: 10.0,right: 10.0),
        width: 100.0,
        padding: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: Color(0xff2e2b4e),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(iconData),
            Text(
              percent + '%',
              style: TextStyle(color: Colors.white, fontSize: 19.0),
            )
          ],
        ),
      ),
    );
  }

  _buildBottomContainer() {
    return Container(
      height: 100.0,
      padding: EdgeInsets.only(left:30.0,right: 20.0),
      margin: EdgeInsets.only(top: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          _buildBottomText('-1.68', '1 day Charge'),
          _buildBottomText('+2.56', '1 week Change'),
          _buildBottomText('+40.62', '1 month Change')
        ],
      ),
      decoration: BoxDecoration(
          color: Color(secondaryColor),
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(40.0),
              topLeft: Radius.circular(40.0)
          )
      ),
    );
  }

  _buildBottomText(String percent , String text){
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(percent +'%',style: TextStyle(color: Colors.redAccent,fontSize: 18.0),),
        Text(text,style: TextStyle(color: Colors.white),)
      ],
    );
  }
}
