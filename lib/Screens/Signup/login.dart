import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:omnia/Screens/Signup/auth.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _obscureText2 = true;
  final TextEditingController _email = TextEditingController();
  final TextEditingController _passk = TextEditingController();
  String? errortext = '';
  bool isLoginfr = true;

  Future<void> signwitemailpassidk() async {
    try {
      await Auth().signInWEmailPass(
        email: _email.text,
        pass: _passk.text,
      );
    } on FirebaseAuthException catch (e) {
      setState(() {
        errortext = e.message;
      });
    }
  }

  Future<void> createFireUserWitEmailPass() async {
    try {
      await Auth().createUserWEmailPass(email: _email.text, pass: _passk.text);
    } on FirebaseAuthException catch (e) {
      setState(() {
        errortext = e.message;
      });
    }
  }

  Widget _errobitch() {
    return Text(
      errortext == '' ? '' : '$errortext',
      style: const TextStyle(
        color: Colors.redAccent,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        // scrolledUnderElevation: double.infinity,
        // elevation: 0.0,
        // forceMaterialTransparency: true,
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        height: 1864,
        width: double.infinity,
        decoration: const BoxDecoration(
            image: DecorationImage(
          image: AssetImage("assets/wolf.png"),
          fit: BoxFit.cover,
        )),
        child: Container(
          color: Colors.black.withOpacity(0.5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              // SizedBox(height: 100,),
              Container(
                height: 148,
                width: 558,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    alignment: Alignment.bottomCenter,
                    image: AssetImage("assets/name.png"),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              // SizedBox(height: 10,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  Row(
                    children: [
                      const SizedBox(
                        width: 50,
                      ),
                      Text(
                        isLoginfr ? 'Log In' : 'Register',
                        // textAlign: TextAlign.end,
                        style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w800,
                            fontSize: 30),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        width: 380,
                        height: 56,
                        child: TextField(
                          style: const TextStyle(color: Colors.white),
                          controller: _email,
                          decoration: InputDecoration(
                            border: const OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                              Radius.circular(50.0),
                            )),
                            prefixIcon: const Icon(Icons.email_outlined,
                                color: Colors.white),
                            hintText: isLoginfr
                                ? 'Log-In Using Email ID'
                                : 'Register Using Email ID',
                            hintStyle: const TextStyle(
                                fontWeight: FontWeight.w300,
                                color: Colors.white),
                            enabledBorder: const OutlineInputBorder(
                              borderSide:
                                  BorderSide(width: 2, color: Colors.white),
                              borderRadius: BorderRadius.all(
                                Radius.circular(50.0),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        width: 380,
                        height: 56,
                        child: TextField(
                          style: const TextStyle(color: Colors.white),
                          controller: _passk,
                          obscureText: _obscureText2,
                          decoration: InputDecoration(
                            // fillColor: Color.fromARGB(255, 255, 0, 0),
                            // filled: true,
                            border: const OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                              Radius.circular(50.0),
                            )),
                            prefixIcon: const Icon(Icons.lock_person_outlined,
                                color: Colors.white),
                            hintText:
                                isLoginfr ? 'Password' : 'Create Password',
                            hintStyle: const TextStyle(
                                fontWeight: FontWeight.w300,
                                color: Colors.white),
                            enabledBorder: const OutlineInputBorder(
                              borderSide:
                                  BorderSide(width: 2, color: Colors.white),
                              borderRadius: BorderRadius.all(
                                Radius.circular(50.0),
                              ),
                            ),
                            suffixIcon: IconButton(
                              icon: Icon(
                                _obscureText2
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                                color: Colors.white,
                              ),
                              onPressed: () {
                                setState(() {
                                  _obscureText2 = !_obscureText2;
                                });
                              },
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      _errobitch(),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 50,
                            width: 160,
                            child: ElevatedButton(
                              onPressed: isLoginfr
                                  ? signwitemailpassidk
                                  : createFireUserWitEmailPass,
                              child: Text(
                                isLoginfr ? 'Log In' : 'Sign Up',
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 25,
                                    fontWeight: FontWeight.w800),
                              ),
                              // icon: const Icon(Icons.arrow_forward,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            // crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                isLoginfr
                                    ? 'Don\'t Have an Account?'
                                    : 'Already have an account?',
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w800),
                              ),
                              TextButton(
                                onPressed: () {
                                  setState(() {
                                    isLoginfr = !isLoginfr;
                                  });
                                },
                                child: Text(
                                  isLoginfr ? 'Sign Up' : 'Log In',
                                  style: const TextStyle(
                                      color: Colors.purple,
                                      fontSize: 13,
                                      fontWeight: FontWeight.w800),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
