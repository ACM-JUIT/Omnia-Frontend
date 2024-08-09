import 'package:flutter/material.dart';
import 'package:omnia/Resources/Theme/theme.dart';
import 'package:omnia/features/Menu/menu.dart';
import 'package:omnia/features/navbar/screens/entry_point.dart';
import 'package:omnia/features/Work/Projects/projects.dart';
import 'package:omnia/features/Work/Resources/reso.dart';

class Work extends StatelessWidget {
  const Work({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            iconTheme: const IconThemeData(color: Colors.white),
            backgroundColor: primaryColor,
            title: const Text(
              "Work",
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
              // dividerColor: ,
              labelStyle: TextStyle(fontSize: 20),
              labelPadding: EdgeInsets.all(3),
              indicatorColor: itemColor,
              indicatorSize: TabBarIndicatorSize.tab,
              indicatorWeight: 3.0,
              labelColor: Colors.white,
              tabs: [
                Tab(
                  text: "Projects",
                ),
                Tab(
                  text: "Resources",
                ),
              ],
            ),
          ),
          backgroundColor: primaryColor,
          endDrawer: const Menu(),
          body: const TabBarView(
            children: [
              Project(),
              Reso(),
            ],
          )),
    );
  }
}
