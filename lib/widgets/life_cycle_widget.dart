import 'package:flutter/material.dart';

class MyAppLifeCycle extends StatefulWidget {
  @override
  _MyAppLifeCycleState createState() => _MyAppLifeCycleState();
}

class _MyAppLifeCycleState extends State<MyAppLifeCycle>
    with WidgetsBindingObserver {
  AppLifecycleState lifecycle;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    // TODO: implement didChangeAppLifecycleState
    super.didChangeAppLifecycleState(state);
    lifecycle = state;
    print("App LifeCycle ${lifecycle.toString()}");
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Text(lifecycle.toString() == null
              ? 'Rinku Dhiman'
              : lifecycle.toString()),
        ),
      ),
    );
  }
}
