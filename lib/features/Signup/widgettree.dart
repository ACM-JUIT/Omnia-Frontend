import 'package:omnia/features/Signup/auth.dart';
import 'package:omnia/features/Signup/login.dart';
import 'package:omnia/features/navbar.dart/screens/entry_point.dart';
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
          return const EntryPoint();
        } else {
          return const Login();
        }
      }));
  }
}