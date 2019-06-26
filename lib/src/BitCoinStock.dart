import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'side_drawer.dart';
class BitCoinStockProfile extends StatefulWidget {
  @override
  _BitCoinStockProfileState createState() => _BitCoinStockProfileState();
}

class _BitCoinStockProfileState extends State<BitCoinStockProfile> {
  final Color backgroundColor = Color(0xff4c65bd);
  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: SideDrawer(),
      appBar: AppBar(
        elevation: 0.0,
        leading: IconButton(
            icon: Icon(
              Icons.dehaze,
              color: Colors.white,
            ),
            onPressed: (){
              _scaffoldKey.currentState.openDrawer();
            }),
        title: Text('Total balance'),
        backgroundColor: backgroundColor,
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.search,
              color: Colors.white,
            ),
            onPressed: () {},
          )
        ],
      ),
      body: Container(
        color: backgroundColor,
        child: Column(
          children: <Widget>[
            Flexible(
              child: _buildProfileTop(),
              flex: 2,
            ),
            Flexible(
              child: _buildProfileBottom(),
              flex: 4,
            )
          ],
        ),
      ),
    );
  }

  _buildProfileTop() {
    return Container(
      constraints: BoxConstraints.expand(),
      child: Column(
        children: <Widget>[
          Expanded(
              child: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  '\$ 521,932',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: 10.0,
                ),
                Container(
                  padding: EdgeInsets.all(5.0),
                  decoration: BoxDecoration(
                      color: Color(0xff6574c2),
                      borderRadius: BorderRadius.circular(2.0)),
                  child: Row(
                    children: <Widget>[
                      Text(
                        "\$USD",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        width: 3.0,
                      ),
                      Icon(
                        Icons.arrow_drop_down,
                        color: Colors.white,
                        size: 16.0,
                      )
                    ],
                  ),
                )
              ],
            ),
          )),
          Container(
            padding: EdgeInsets.only(left: 20.0, right: 20.0),
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(5.0),
                  decoration: BoxDecoration(
                      color: Color(0xff6574c2),
                      borderRadius: BorderRadius.circular(2.0)),
                  child: Row(
                    children: <Widget>[
                      Icon(
                        Icons.credit_card,
                        color: Colors.white,
                        size: 16.0,
                      ),
                      SizedBox(
                        width: 3.0,
                      ),
                      Text(
                        "Total Wallet",
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Row(
                    children: <Widget>[
                      Icon(
                        Icons.share,
                        color: Colors.white,
                        size: 16.0,
                      ),
                      SizedBox(
                        width: 3.0,
                      ),
                      Text('Share Value',
                          style: TextStyle(color: Colors.white)),
                    ],
                  ),
                )
              ],
            ),
            height: 50.0,
          )
        ],
      ),
    );
  }

  _buildProfileBottom() {
    return Container(
      padding: EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0),
//      height: C,
      child: ListView(
        children: <Widget>[
          _buildCurrencyDetailCard("svg/bitcoin.svg","BTC","Bitcoin","\$200.13","+2.23"),
          _buildCurrencyDetailCard("svg/peercoin-ppc.svg","PPC","Peercoin","\$190.11","+1.12"),
          _buildCurrencyDetailCard("svg/litecoin.svg","LTC","Litecoin","\$180.13","-1.21"),
          _buildCurrencyDetailCard("svg/primecoin-xpm.svg","XPM","Primecoin","\$180.01","+1.12"),
        ],
      ),
      constraints: BoxConstraints.expand(),
      decoration: BoxDecoration(
          color: Color(0xfff9f9f9),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30.0), topRight: Radius.circular(30.0)),),
    );
  }

  _buildCurrencyDetailCard(String iconPath,String iconCode,String iconName,String iconPrice,String iconPercent) {
    return Card(
      color: Colors.white,
      child: Container(
        padding: EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            SvgPicture.asset(
              iconPath,
              height: 40.0,
              width: 40.0,
            ),
            Column(
              children: <Widget>[
                Text(
                  iconCode,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                ),
                Text(
                  iconName,
                  style: TextStyle(color: Color(0xffc8c8c8)),
                ),
                SizedBox(
                  height: 6.0,
                ),
                Row(
                  children: <Widget>[
                    Icon(
                      Icons.star,
                      size: 12.0,
                      color: Color(0xfff5c443),
                    ),
                    Icon(
                      Icons.star,
                      size: 12.0,
                      color: Color(0xfff5c443),
                    ),
                    Icon(
                      Icons.star,
                      size: 12.0,
                      color: Color(0xfff5c443),
                    ),
                    Icon(
                      Icons.star,
                      size: 12.0,
                      color: Color(0xfff5c443),
                    ),
                    Icon(
                      Icons.star_border,
                      size: 12.0,
                      color: Color(0xfff5c443),
                    ),
                  ],
                )
              ],
            ),
            _buildGraphLine(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Icon(Icons.more_horiz),
                Text(
                  iconPrice,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(iconPercent+"%",style: TextStyle(color: Colors.grey),)
              ],
            )
          ],
        ),
      ),
    );
  }

  _buildGraphLine() {
    return CustomPaint(
      painter: GraphLinePainter(),
      child: Container(
        width: 100.0,
        height: 50.0,
      ),
    );
  }
}

class GraphLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Colors.blue
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3.0;
    //    paint.strokeWidth = 3;

    var path = Path();
    path.moveTo(0, size.height / 2);
    path.quadraticBezierTo(
        size.width / 5, size.height * 2 / 5, size.width / 4, size.height / 2);
    path.quadraticBezierTo(size.width * 7 / 10, size.height * 4 / 5,
        size.width / 4, size.height / 2);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
