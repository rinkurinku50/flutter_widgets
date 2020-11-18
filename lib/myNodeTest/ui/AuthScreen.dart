import 'package:flutter/material.dart';

class AuthScreen extends StatefulWidget {
  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen>
    with SingleTickerProviderStateMixin {
  // login
  TextEditingController _loginusernamecontroller = TextEditingController();
  TextEditingController _loginpasswordcontroller = TextEditingController();

  //signup
  TextEditingController _signupnamecontroller = TextEditingController();
  TextEditingController _signlastcontroller = TextEditingController();
  TextEditingController _signemailcontroller = TextEditingController();
  TextEditingController _signpasswordcontroller = TextEditingController();

  //
  GlobalKey<FormState> _loginglobalKey = GlobalKey<FormState>();
  GlobalKey<FormState> _signupglobalKey = GlobalKey<FormState>();

  TabController _tabController;
  int index;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    _tabController.addListener(() {
      setState(() {
        index = _tabController.index;
      });
    });
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 15.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TabBar(
                  controller: _tabController,
                  indicatorColor: Colors.black,
                  indicatorSize: TabBarIndicatorSize.label,
                  indicatorWeight: 1,
                  isScrollable: true,
                  tabs: <Widget>[
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 8.0),
                      child: Text('Login',
                          style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.w700,
                              color: Colors.black)),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 8.0),
                      child: Text('Sign Up',
                          style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.w700,
                              color: Colors.black)),
                    ),
                  ],
                ),
                AnimatedContainer(
                  duration: Duration(milliseconds: 800),
                  margin: EdgeInsets.only(right: 15.0),
                  decoration: BoxDecoration(
                      color: index == 0 ? Colors.yellow[400] : Colors.red[300],
                      borderRadius: BorderRadius.circular(10.0),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black26,
                            blurRadius: 15.0,
                            offset: Offset(1.0, 1.0),
                            spreadRadius: 5.0)
                      ]),
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.supervised_user_circle_rounded,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: <Widget>[login(), signup()],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget login() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Flexible(
            flex: 5,
            child: Container(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  RichText(
                    textAlign: TextAlign.start,
                    text: TextSpan(
                        text: 'Welcome Back,\n',
                        style: TextStyle(
                            fontSize: 36.0,
                            fontWeight: FontWeight.w300,
                            color: Colors.black),
                        children: [
                          TextSpan(
                              text: 'Rinku',
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontStyle: FontStyle.italic))
                        ]),
                  ),
                  SizedBox(
                    height: 35.0,
                  ),
                  Form(
                      key: _loginglobalKey,
                      child: Expanded(
                        child: SingleChildScrollView(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  child: TextFormField(
                                    controller: _loginusernamecontroller,
                                    validator: (value) {
                                      if (value.isEmpty) {
                                        return "You can't have an empty Email";
                                      }
                                      return null;
                                    },
                                    decoration: InputDecoration(
                                      labelText: 'Email',
                                      labelStyle: TextStyle(
                                          color: Colors.grey, fontSize: 18.0),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.grey),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 25),
                                Container(
                                  child: TextFormField(
                                    controller: _loginpasswordcontroller,
                                    validator: (value) {
                                      if (value.isEmpty) {
                                        return "You can't have an empty Password!";
                                      }
                                      return null;
                                    },
                                    decoration: InputDecoration(
                                      labelText: 'Password',
                                      labelStyle: TextStyle(
                                          color: Colors.grey, fontSize: 18.0),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.grey),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      )),
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        'Forgot Password?',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ))
                ],
              ),
            ),
          ),
          Flexible(
            flex: 1,
            child: Stack(
              overflow: Overflow.visible,
              children: [
                Container(
                  color: Colors.grey[300],
                ),
                Positioned(
                    right: MediaQuery.of(context).size.width * 0.08,
                    top: -(MediaQuery.of(context).size.height * 0.05),
                    child: GestureDetector(
                      onTap: () {
                        if (_loginglobalKey.currentState.validate()) {
                          print(_loginusernamecontroller.text);
                          print(_loginpasswordcontroller.text);
                        }
                      },
                      child: Container(
                        width: 110.0,
                        height: 70.0,
                        decoration: BoxDecoration(
                            color: Colors.yellow[500],
                            borderRadius: BorderRadius.circular(15.0)),
                        child: Icon(
                          Icons.arrow_forward,
                          color: Colors.white,
                          size: 32.0,
                        ),
                      ),
                    ))
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget signup() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Flexible(
            flex: 5,
            child: Container(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 25),
                  RichText(
                    textAlign: TextAlign.start,
                    text: TextSpan(
                        text: 'Hello ',
                        style: TextStyle(
                            fontSize: 36.0,
                            fontWeight: FontWeight.w300,
                            color: Colors.black),
                        children: [
                          TextSpan(
                              text: 'Beautiful,\n',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              )),
                          TextSpan(
                              text:
                                  'Enter your information below or\nlogin with a social account',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w400))
                        ]),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Form(
                            key: _signupglobalKey,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  child: TextFormField(
                                    validator: (value) {
                                      if (value.isEmpty) {
                                        return 'First name should not empty...';
                                      }
                                      return null;
                                    },
                                    decoration: InputDecoration(
                                      labelText: 'First Name',
                                      labelStyle: TextStyle(
                                          color: Colors.grey, fontSize: 18.0),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.grey),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 25),
                                Container(
                                  child: TextFormField(
                                    validator: (value) {
                                      if (value.isEmpty) {
                                        return 'Last name should not empty...';
                                      }
                                      return null;
                                    },
                                    decoration: InputDecoration(
                                      labelText: 'Last Name',
                                      labelStyle: TextStyle(
                                          color: Colors.grey, fontSize: 18.0),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.grey),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 25),
                                Container(
                                  child: TextFormField(
                                    validator: (value) {
                                      if (value.isEmpty) {
                                        return 'Email should not empty...';
                                      }
                                      return null;
                                    },
                                    decoration: InputDecoration(
                                      labelText: 'Email',
                                      labelStyle: TextStyle(
                                          color: Colors.grey, fontSize: 18.0),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.grey),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 25),
                                Container(
                                  child: TextFormField(
                                    validator: (value) {
                                      if (value.isEmpty) {
                                        return 'Password should not empty...';
                                      }
                                      return null;
                                    },
                                    decoration: InputDecoration(
                                      labelText: 'Password',
                                      labelStyle: TextStyle(
                                          color: Colors.grey, fontSize: 18.0),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.grey),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 25),
                                Container(
                                  child: TextFormField(
                                    validator: (value) {
                                      if (value.isEmpty) {
                                        return 'Confirm Password should not empty...';
                                      }
                                      return null;
                                    },
                                    decoration: InputDecoration(
                                      labelText: 'Confirm Password',
                                      labelStyle: TextStyle(
                                          color: Colors.grey, fontSize: 18.0),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.grey),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            )),
                      ),
                    ),
                  ),
                  Container()
                ],
              ),
            ),
          ),
          Flexible(
            flex: 1,
            child: Stack(
              overflow: Overflow.visible,
              children: [
                Container(
                  color: Colors.grey[300],
                ),
                Positioned(
                  right: MediaQuery.of(context).size.width * 0.08,
                  top: -(MediaQuery.of(context).size.height * 0.05),
                  child: Container(
                      width: 110.0,
                      height: 70.0,
                      decoration: BoxDecoration(
                          color: Colors.red[300],
                          borderRadius: BorderRadius.circular(15.0)),
                      child: IconButton(
                        onPressed: () {
                          if (_signupglobalKey.currentState.validate()) {
                            print('all okh');
                          }
                        },
                        icon: Icon(
                          Icons.arrow_forward,
                          color: Colors.white,
                          size: 32.0,
                        ),
                      )),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
