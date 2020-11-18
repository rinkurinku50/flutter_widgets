import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginSignUpScreen extends StatefulWidget {
  @override
  _LoginSignUpScreenState createState() => _LoginSignUpScreenState();
}

class _LoginSignUpScreenState extends State<LoginSignUpScreen> {
  final List<Color> colors = [Color(0xFFFB9245), Color(0xFFF54E6B)];

  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        top: false,
        left: false,
        right: false,
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: colors,
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('images/icon.png',
                      width: MediaQuery.of(context).size.width * 0.5),
                  tabs(context),
                  //login(context)
                  AnimatedCrossFade(
                    duration: Duration(milliseconds: 150),
                    firstChild: login(context),
                    secondChild: signup(context),
                    crossFadeState: _index == 0
                        ? CrossFadeState.showFirst
                        : CrossFadeState.showSecond,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget tabs(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 45.0, left: 15.0, right: 15.0),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.12),
            borderRadius: BorderRadius.circular(25.0)),
        child: Row(
          children: [
            Expanded(
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    _index = 0;
                  });
                },
                child: Container(
                  padding: EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25.0),
                      color: _index == 0 ? Colors.white : Colors.transparent),
                  child: Center(
                    child: Text(
                      'Login',
                      style: GoogleFonts.gorditas(
                          color: _index == 0 ? Colors.black : Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    _index = 1;
                  });
                },
                child: Container(
                  padding: EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25.0),
                      color: _index == 1 ? Colors.white : Colors.transparent),
                  child: Center(
                      child: Text(
                    'SignUp',
                    style: GoogleFonts.gorditas(
                        color: _index == 1 ? Colors.black : Colors.white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold),
                  )),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget login(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top: 30.0, left: 15.0, right: 15.0),
        child: Column(
          children: [
            Stack(
              overflow: Overflow.visible,
              alignment: Alignment.bottomCenter,
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15.0)),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      children: [
                        TextField(
                          decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.email,
                              color: Colors.grey,
                            ),
                            labelText: 'Enter your email',
                            labelStyle: TextStyle(color: Colors.black87),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.transparent),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.transparent),
                            ),
                          ),
                        ),
                        Divider(color: Colors.grey, height: 8.0),
                        TextField(
                          decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.lock,
                              color: Colors.grey,
                            ),
                            labelText: 'Enter your password',
                            labelStyle: TextStyle(color: Colors.black87),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.transparent),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.transparent),
                            ),
                          ),
                        ),
                        Divider(color: Colors.transparent, height: 30.0),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: 150,
                  child: GestureDetector(
                    child: Container(
                      padding: EdgeInsets.all(15.0),
                      width: MediaQuery.of(context).size.width - 100,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(colors: colors),
                          borderRadius: BorderRadius.circular(30.0)),
                      child: Center(
                        child: Text(
                          'Login',
                          style: GoogleFonts.bungee(
                              color: Colors.white,
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: 40.0, left: 15.0, right: 15.0),
              child: Center(
                child: GestureDetector(
                  child: Container(
                    child: Text(
                      "Forget Password?",
                      style: GoogleFonts.bungee(
                          color: Colors.white, fontSize: 18.0),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20.0, left: 15.0, right: 15.0),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      color: Colors.white,
                      height: 1,
                      width: 55,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 15.0),
                      child: Text(
                        'Or',
                        style: TextStyle(
                            fontSize: 15.0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      color: Colors.white,
                      height: 1,
                      width: 55,
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: 20.0, left: 15.0, right: 15.0, bottom: 20.0),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white, shape: BoxShape.circle),
                      child: Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Image.asset('images/google.png'),
                      ),
                    ),
                    SizedBox(
                      width: 25.0,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white, shape: BoxShape.circle),
                      child: Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Image.asset('images/fb.png'),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ));
  }

  Widget signup(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top: 30.0, left: 15.0, right: 15.0),
        child: Column(
          children: [
            Stack(
              overflow: Overflow.visible,
              alignment: Alignment.bottomCenter,
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15.0)),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      children: [
                        TextField(
                          decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.ad_units,
                              color: Colors.grey,
                            ),
                            labelText: 'Enter your First Name',
                            labelStyle: TextStyle(color: Colors.black87),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.transparent),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.transparent),
                            ),
                          ),
                        ),
                        Divider(color: Colors.grey, height: 8.0),
                        TextField(
                          decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.tv,
                              color: Colors.grey,
                            ),
                            labelText: 'Enter your Last Name',
                            labelStyle: TextStyle(color: Colors.black87),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.transparent),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.transparent),
                            ),
                          ),
                        ),
                        Divider(color: Colors.grey, height: 8.0),
                        TextField(
                          decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.email,
                              color: Colors.grey,
                            ),
                            labelText: 'Enter your email',
                            labelStyle: TextStyle(color: Colors.black87),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.transparent),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.transparent),
                            ),
                          ),
                        ),
                        Divider(color: Colors.grey, height: 8.0),
                        TextField(
                          decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.lock,
                              color: Colors.grey,
                            ),
                            labelText: 'Enter your password',
                            labelStyle: TextStyle(color: Colors.black87),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.transparent),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.transparent),
                            ),
                          ),
                        ),
                        TextField(
                          decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.lock_open,
                              color: Colors.grey,
                            ),
                            labelText: 'Re - Enter',
                            labelStyle: TextStyle(color: Colors.black87),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.transparent),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.transparent),
                            ),
                          ),
                        ),
                        Divider(color: Colors.transparent, height: 30.0),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: 350,
                  child: GestureDetector(
                    child: Container(
                      padding: EdgeInsets.all(15.0),
                      width: MediaQuery.of(context).size.width - 100,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(colors: colors),
                          borderRadius: BorderRadius.circular(15.0)),
                      child: Center(
                        child: Text(
                          'SignUp',
                          style: GoogleFonts.bungee(
                              color: Colors.white,
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: 40.0, left: 15.0, right: 15.0),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      color: Colors.white,
                      height: 1,
                      width: 55,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 15.0),
                      child: Text(
                        'SignUp With',
                        style: TextStyle(
                            fontSize: 15.0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      color: Colors.white,
                      height: 1,
                      width: 55,
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: 20.0, left: 15.0, right: 15.0, bottom: 20.0),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white, shape: BoxShape.circle),
                      child: Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Image.asset('images/google.png'),
                      ),
                    ),
                    SizedBox(
                      width: 25.0,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white, shape: BoxShape.circle),
                      child: Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Image.asset('images/fb.png'),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ));
  }
}
