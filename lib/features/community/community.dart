import 'package:flutter/material.dart';
import 'package:omnia/Resources/Theme/theme.dart';
import 'package:omnia/features/community/ACM/acm.dart';
import 'package:omnia/features/community/Council/council.dart';
import 'package:omnia/features/Menu/menu.dart';
import 'package:omnia/features/navbar.dart/screens/entry_point.dart';
// import 'package:omnia/Screens/Home/home.dart';

class Community extends StatelessWidget {
  const Community({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: AppBar(
            iconTheme: const IconThemeData(color: Colors.white),
            backgroundColor: primaryColor,
            title: const Text(
              "Community",
              style: TextStyle(color: Colors.white),
            ),
            
            leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const EntryPoint();
                }));
              },
            ),
            bottom: const TabBar( 
              labelPadding: EdgeInsets.all(3),
              indicatorColor: itemColor,
              indicatorSize: TabBarIndicatorSize.tab,
              indicatorWeight: 3.0,
              labelColor: Colors.white,
              tabs: [
                Tab(
                  text: "ACM",
                ),
                Tab(
                  text: "Council",
                ),
              ],
            ),
          ),
          endDrawer: const Menu(),
          backgroundColor: primaryColor,
          body: const TabBarView(
            children: [
              ACM(),
              Council(),
            ],
          )),
    );
  }
}

