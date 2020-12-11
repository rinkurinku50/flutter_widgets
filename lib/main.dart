import 'package:flutter/material.dart';
import 'package:flutter_widget_example/Firebase/firebase_messasing/firebase_messages.dart';
import 'package:flutter_widget_example/ScrollEvent/ScrollEvent.dart';
import 'package:flutter_widget_example/file_picker/file_pick.dart';
import 'package:flutter_widget_example/flutter_lifecycle/app_lifecycle.dart';
import 'package:flutter_widget_example/getx/getXmain.dart';
import 'package:flutter_widget_example/getx/routes/routes.dart';
import 'package:flutter_widget_example/local_notification/localnotification.dart';
import 'package:flutter_widget_example/map/custommarkerimage.dart';
import 'package:flutter_widget_example/map/drawing_route_line.dart';
import 'package:flutter_widget_example/map/googlemap.dart';
import 'package:flutter_widget_example/myNodeTest/ui/AuthScreen.dart';
import 'package:flutter_widget_example/pathprovider/GetImage.dart';
import 'package:flutter_widget_example/provider/Item.dart';
import 'package:flutter_widget_example/provider/ItemAddNotifier.dart';
import 'package:flutter_widget_example/provider/ShopNameNotifier.dart';
import 'package:flutter_widget_example/provider/home_screen.dart';
import 'package:flutter_widget_example/rxdart/RxDart.dart';
import 'package:flutter_widget_example/screenUtils/screenUtils.dart';
import 'package:flutter_widget_example/searchDelegate/SearchDelegate.dart';
import 'package:flutter_widget_example/sqlLiteWithOffline/ui/GridViewDemo.dart';
import 'package:flutter_widget_example/streams/stream.dart';
import 'package:flutter_widget_example/test/gridtest.dart';
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
import 'package:get/get.dart';
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
      home: GetAllImage(),
      theme: ThemeData(
          primarySwatch: Colors.blue,
          textTheme:
              GoogleFonts.reemKufiTextTheme(Theme.of(context).textTheme)),
    );
  }
}

//getx

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return GetMaterialApp(
//       debugShowCheckedModeBanner: false,
//       initialRoute: Routes.HOME,
//       getPages: AppPages.pages,
//       theme: ThemeData(
//           primarySwatch: Colors.blue,
//           textTheme:
//               GoogleFonts.reemKufiTextTheme(Theme.of(context).textTheme)),
//     );
//   }
// }

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
