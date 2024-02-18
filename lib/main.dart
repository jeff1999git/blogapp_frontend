import 'package:blogapp_frontend/modules/homepage.dart';
import 'package:flutter/material.dart';

void main()
{
  runApp(MainPage());
}

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}
