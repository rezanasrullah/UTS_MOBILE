import 'package:flutter/material.dart';
import 'login_page.dart';
import 'list_page.dart';
import 'detail_page.dart';

void main() {
  runApp(ExploreNusantara());
}

class ExploreNusantara extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Explore Nusantara',
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      
      routes: {
        '/': (context) => LoginPage(),
        '/list': (context) => ListPage(),
        '/detail': (context) => DetailPage(),
      },
    );
  }
}
