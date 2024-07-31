import 'package:flutter/material.dart';
import 'package:omnia/Resources/Theme/theme.dart';
import 'package:omnia/Resources/reportbug.dart';
import 'package:omnia/Screens/Signup/auth.dart';
import 'package:url_launcher/url_launcher.dart';

class Menu extends StatelessWidget {
  const Menu({super.key});

  Future<void> signout() async {
    await Auth().signTFOut();
  }

  Widget signoutButton(BuildContext context){
    return ElevatedButton.icon(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        _alertdialog(context);
      },
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white, backgroundColor: Colors.redAccent,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      label: const Text('Sign out'),
    );
  }

  void _alertdialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(  
                backgroundColor: Colors.white,
                title: const Text('Sign out?'),
                content: const Text('Are you sure?'),
                actions: <Widget>[
                  TextButton(
                    style: const ButtonStyle(
                      side: WidgetStatePropertyAll(BorderSide(color: Colors.black, width: 1.5)),
                      backgroundColor: WidgetStatePropertyAll(Colors.transparent),
                    ),
                    onPressed: (){
                       Navigator.of(context).pop();
                    }, 
                    child: const Text('Go Back',
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  )),
                  TextButton(
                    style: const ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(Colors.red),
                    ),
                    onPressed: (){
                       signout();
                       Navigator.of(context).pop();
                    }
                  , child: const Text('Sign Out',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ))
                ],
           );
    },
  );
}

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            color: Colors.blue, // Replace with your color
            child: DrawerHeader(
              decoration: const BoxDecoration(
                color: primaryColor, // Replace with your color
              ),
              child: Center(
                child: Image.asset(
                  "assets/acmlogo.png",
                  height: 200,
                  width: 200,
                ),
              ),
            ),
          ),
          ListTile(
            leading: Image.asset("assets/linkedin.png", height: 26, width: 26),
            title: const Text(' LinkedIn'),
            onTap: () => _launchURL('https://www.linkedin.com/company/acmjuit/mycompany/'),
          ),
          ListTile(
            leading: Image.asset("assets/insta.png", height: 26, width: 26),
            title: const Text(' Instagram'),
            onTap: () => _launchURL('https://www.instagram.com/acmjuit/'),
          ),
          ListTile(
            leading: Image.asset("assets/x3.png", height: 26, width: 26),
            title: const Text(' Twitter'),
            onTap: () => _launchURL('https://x.com/AcmJuit'),
          ),
          ListTile(
            leading: Image.asset("assets/git.png", height: 30, width: 30),
            title: const Text('Github'),
            onTap: () => _launchURL('https://github.com/ACM-JUIT/'),
          ),
          const SizedBox(height: 10.0),
          const Divider(),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.only(bottom: 20.0),
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    //Bug report
                    ElevatedButton.icon(
                        icon: const Icon(Icons.bug_report),
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const ReportBug(),));
                        },
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white, backgroundColor: Colors.blueAccent,
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        label: const Text('Report Bug'),
                      ),
                    
                    //Signout button and shi
                    signoutButton(context),
                  ],
                ),

                const SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Made by ',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0,
                        color: Colors.grey[600],
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    GestureDetector(
                      onTap: () => _launchURL('https://www.linkedin.com/in/aditya-kumar-a215k/'),
                      child: const Text(
                        ' Aditya',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0,
                          color: Color.fromARGB(255, 80, 79, 79),
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ),
                    Text(
                      ' and',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0,
                        color: Colors.grey[600],
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    GestureDetector(
                      onTap: () => _launchURL('https://www.linkedin.com/in/antrimo/'),
                      child: const Text(
                        ' Kartikey',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0,
                          color: Color.fromARGB(255, 88, 88, 88),
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ),
                    
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );

    
  }

  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}


