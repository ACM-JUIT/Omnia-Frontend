import 'package:flutter/material.dart';
import 'package:omnia/Resources/Theme/theme.dart';
import 'package:omnia/Screens/Home/homescreen.dart';
import 'package:omnia/Screens/Profile/profedit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:omnia/Screens/Signup/auth.dart';

class Profile extends StatelessWidget {
  Profile({super.key});

  final User? user = Auth().currentUser;

  Widget _userUID(){
    return Text(user?.email?? 'User email',
      style: const TextStyle(
        color: Colors.blue,
      ),
    );
  }

  Future<void> signoutttt() async{
    await Auth().signTFOut();
  }

  Widget _signoutButt(){
    return ElevatedButton(
      onPressed: signoutttt,
      child: const Text('Sign out niga'),
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          
          automaticallyImplyLeading: false,
          iconTheme: const IconThemeData(color: Colors.white),
          backgroundColor: primaryColor,
          title: const Text(
            "My Profile",
            style: TextStyle(color: Colors.white),
          ),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const HomeScreen();
              }));
            },
          ),
        ),
        backgroundColor: primaryColor,
        body: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const SizedBox(
                height: 16,
              ),

              Container(
                height: 120,
                width: 120,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    image:
                        DecorationImage(image: AssetImage("assets/luffy.png"))),
              ),
              const SizedBox(
                height: 10,
              ),

              //Name
              Row(mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(width: 50,),
                  const Text(
                    'Monkey D. Luffy',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 24,
                        color: Colors.white),
                  ),
                  const SizedBox(width: 10,),
                   IconButton(color: Colors.white,
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) => const EditProfile(),
                        settings: const RouteSettings(name: 'Edit Profile'),
                      ));
                    }, 
                    icon: const Icon(Icons.mode_edit_outline_outlined))
                ],
              ),
              const SizedBox(
                height: 4,
              ),

              //ID TAG
              const Text(
                '@nika',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
              const SizedBox(
                height: 8,
              ),

              //Social ID Links
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      
                    },
                    child: Container(
                      height: 24,
                      width: 24,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("assets/linky.png"))),
                    ),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  GestureDetector(
                    onTap: () {
                      
                    },
                    child: Container(
                      height: 24,
                      width: 24,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("assets/gitboi.png"))),
                    ),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  GestureDetector(
                    onTap: () {
                      
                    },
                    child: Container(
                      height: 24,
                      width: 24,
                      decoration: const BoxDecoration(
                          image:
                              DecorationImage(image: AssetImage("assets/x.png"))),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 16,
              ),

              //Bio shi
              const Text(
                'I am Going to be the King of the Pirates.\nI am not a hero. I will not share my food.\nBring me MEAT.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),

              _userUID(),
              _signoutButt(),
              //Portfolio ig
            ],
          ),
        ));
  }
}
