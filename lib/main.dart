import 'package:flutter/material.dart';
import 'package:flutter_widget_example/Firebase/firebase_messasing/firebase_messages.dart';
import 'package:flutter_widget_example/map/custommarkerimage.dart';
import 'package:flutter_widget_example/map/googlemap.dart';
import 'package:flutter_widget_example/myNodeTest/ui/AuthScreen.dart';
import 'package:flutter_widget_example/provider/Item.dart';
import 'package:flutter_widget_example/provider/ItemAddNotifier.dart';
import 'package:flutter_widget_example/provider/ShopNameNotifier.dart';
import 'package:flutter_widget_example/provider/home_screen.dart';
import 'package:flutter_widget_example/rxdart/RxDart.dart';
import 'package:flutter_widget_example/searchDelegate/SearchDelegate.dart';
import 'package:flutter_widget_example/sqlLiteWithOffline/ui/GridViewDemo.dart';
import 'package:flutter_widget_example/streams/stream.dart';
import 'package:flutter_widget_example/ui_screens/foodUi/pages/home_page.dart';
import 'package:flutter_widget_example/ui_screens/login%20screens/login_signup_screen.dart';
import 'package:flutter_widget_example/ui_screens/multiple_cards_ui/ui_screen.dart';
import 'package:flutter_widget_example/widgets/animation/animations.dart';
import 'package:flutter_widget_example/widgets/flexible_expanded.dart';
import 'package:flutter_widget_example/widgets/fractionallysizedbox.dart';
import 'package:flutter_widget_example/widgets/grid_widget.dart';
import 'package:flutter_widget_example/widgets/life_cycle_widget.dart';
import 'package:flutter_widget_example/widgets/stack.dart';
import 'package:flutter_widget_example/widgets/transform.dart';
import 'package:flutter_widget_example/widgets/wrap_widget.dart';
import 'package:flutter_widget_example/pathprovider/PathProvider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginSignUpScreen(),
      theme: ThemeData(
          primarySwatch: Colors.blue,
          textTheme:
              GoogleFonts.reemKufiTextTheme(Theme.of(context).textTheme)),
    );
  }
}

///Provider

//class MyApp extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return MultiProvider(
//      providers: [
//        ChangeNotifierProvider<ItemAddNotifier>(
//            create: (context) => ItemAddNotifier()),
//        ChangeNotifierProvider<ShopNameNotifier>(
//            create: (context) => ShopNameNotifier())
//      ],
//      child: MaterialApp(
//        debugShowCheckedModeBanner: false,
//        home: ProviderHomeScreen(),
//      ),
//    );
//  }
//}
