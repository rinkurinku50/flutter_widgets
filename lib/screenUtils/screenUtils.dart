import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ScreenUtilWiget extends StatefulWidget {
  @override
  _ScreenUtilWigetState createState() => _ScreenUtilWigetState();
}

class _ScreenUtilWigetState extends State<ScreenUtilWiget> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context,
        designSize: Size(1242, 2688), allowFontScaling: true);
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Container(
              height: 0.25.sh,
              child: Stack(
                children: [
                  Container(
                    height: 0.2.sh,
                    color: Colors.orange,
                  ),
                  Positioned(
                    left: 0,
                    right: 0,
                    bottom: 0.015.sh,
                    child: Container(
                      margin: EdgeInsets.symmetric(
                        horizontal: 0.08.sw,
                      ),
                      height: 0.08.sh,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                                offset: Offset(1, 1),
                                color: Colors.black38,
                                blurRadius: 15.0,
                                spreadRadius: 2.0)
                          ],
                          borderRadius: BorderRadius.circular(8.0)),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 0.03.sw,
                          ),
                          Icon(
                            Icons.search,
                            color: Colors.grey,
                            size: 35.0,
                          ),
                          SizedBox(
                            width: 0.02.sw,
                          ),
                          Text(
                            'Search',
                            style: TextStyle(fontSize: 65.sp),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
