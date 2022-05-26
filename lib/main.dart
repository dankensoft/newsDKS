import 'package:flutter/material.dart';
import 'package:newsdks/src/pages/tabs_page.dart';
import 'package:newsdks/src/theme/myTheme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'News DKS',
      theme: myTheme,
      home: TabsPage()
    );
  }
}