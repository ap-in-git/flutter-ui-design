import 'package:flutter/material.dart';
import 'src/BitCoinStock.dart';
import 'src/CryptoCurrencyProfile.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:BitCoinStockProfile(),
      routes: <String,WidgetBuilder> {
        "/crypto-currency-profile" :(BuildContext context)=>CryptoCurrencyProfile(),
        "/bitcoin-stock-profile" :(BuildContext context)=>BitCoinStockProfile()
      } ,
    );
  }
}
