import 'package:flutter/material.dart';
import 'package:projectlong/prodouct_list.dart';

import 'help_instruct.dart';
//import 'package:projectlong/welcomescreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      home: const HelpSupportScreen(),
    );
  }
}