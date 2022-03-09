import 'package:flutter/material.dart';
import 'package:mystore/providers/cart_provider.dart';
import 'package:mystore/screens/home.dart';
import 'package:mystore/screens/shop.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CartProvider(),
      child: MaterialApp(
        title: 'IT18206524',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.amber,
        ),
        initialRoute: Home.routeName,
        routes: {
          Home.routeName:(context) =>  const Home(),
          Shop.routeName:(context) =>  const Shop()
        }
      ),
    );
  }
}

