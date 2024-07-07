import 'package:flutter/material.dart';
// import 'package:omnia/Screens/Signup/signup.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'Screens/Signup/widgettree.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();  
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp()); 
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
      
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Container(
        height: 1864,
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/wolf.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          color: Colors.black.withOpacity(0.3),
          child: Column(
            children: [
              const SizedBox(
                height: 350,
              ),
              Column(
                children: [
                  Center(
                    child: TextButton.icon(
                      style: const ButtonStyle(
                        alignment: Alignment.center,
                        iconSize: WidgetStatePropertyAll<double>(75),
                        foregroundColor:
                            WidgetStatePropertyAll<Color>(Colors.white),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const WidgetTREEE(),
                          ),
                        );
                      },
                      icon: const Icon(Icons.touch_app),
                      label: const Text(''),
                    ),
                  ),
                  const Text(
                    'Tap',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 160,
              ),
              Container(
                height: 76,
                width: 148,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/acmlogo.png"),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
