import 'package:flutter/material.dart';
import 'package:project_flutter/hidden_drawer_menu.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HiddenDrawer(),
      theme: ThemeData(primarySwatch: Colors.deepPurple),

    );
  }}