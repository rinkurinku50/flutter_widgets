import 'package:flutter/material.dart';
// Import package
import 'package:screen/screen.dart';

class AppLifeCycle extends StatefulWidget {
  @override
  _AppLifeCycleState createState() => _AppLifeCycleState();
}

class _AppLifeCycleState extends State<AppLifeCycle>
    with WidgetsBindingObserver {
  double _currentSliderValue = 5;
  double screenBrightnes;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('initState');
    getBrigth(0.5);
    WidgetsBinding.instance.addObserver(this);
  }

  getBrigth(double value) async {
    // screenBrightnes = await Screen.isKeptOn;
    // print(screenBrightnes);
    Screen.setBrightness(_currentSliderValue * 0.01);
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  void didUpdateWidget(covariant AppLifeCycle oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
  }

  @override
  void deactivate() {
    // TODO: implement deactivate
    super.deactivate();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    // TODO: implement didChangeAppLifecycleState
    super.didChangeAppLifecycleState(state);
    switch (state) {
      case AppLifecycleState.inactive:
        print('appLifeCycleState inactive');
        break;
      case AppLifecycleState.resumed:
        print('appLifeCycleState resumed');
        break;
      case AppLifecycleState.paused:
        print('appLifeCycleState paused');
        break;
      case AppLifecycleState.detached:
        print('appLifeCycleState detached');
        break;
    }
  }

  @override
  Future<bool> didPushRoute(String route) {
    // TODO: implement didPushRoute
    return super.didPushRoute(route);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(child: Text('App Life Cycle')),
            Slider(
              value: _currentSliderValue,
              min: 0,
              max: 100,
              divisions: 50,
              label: _currentSliderValue.round().toString(),
              onChanged: (double value) {
                // print();
                setState(() {
                  _currentSliderValue = value;
                  getBrigth((value * 0.01));
                });
              },
            )
          ],
        ),
      ),
    );
  }
}
