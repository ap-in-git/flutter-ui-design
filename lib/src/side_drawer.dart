import 'package:flutter/material.dart';
class SideDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          ListTile(title: Text('Satiama page') ,onTap: (){
            Navigator.of(context).pushNamed('/crypto-currency-profile');
          }, ),
          ListTile(title: Text('Bitcoin stock profile'),onTap: (){
            Navigator.of(context).pushNamed('/bitcoin-stock-profile');
          },)
        ],
      ),
    );
  }
}
