import 'package:omnia/Screens/Signup/auth.dart';
import 'package:omnia/Screens/Signup/login.dart';
import 'package:omnia/Screens/navbar.dart/navbar.dart';
import 'package:flutter/material.dart';


class WidgetTREEE extends StatefulWidget {
  const WidgetTREEE({super.key});

  @override
  State<WidgetTREEE> createState() => _WidgetTREEEState();
}

class _WidgetTREEEState extends State<WidgetTREEE> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Auth().authStateChanges, 
      builder: ((context, snapshot) {
        if (snapshot.hasData){
          return const Nav();
        } else {
          return const Login();
        }
      }));
  }
}