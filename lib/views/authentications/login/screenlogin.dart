import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:jsonapp/constants/globalvalues.dart';

class ScreenLogin extends StatelessWidget {
  ScreenLogin({super.key});

  final Radius kCircleRadius =
      Radius.circular(globalBoxConstraints.maxWidth * 0.13);

  @override
  Widget build(BuildContext context) {
    var show = false;
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(color: Colors.black,
          image: DecorationImage(
            fit: BoxFit.cover,
            filterQuality: FilterQuality.low,
            image: NetworkImage(
              "https://t3.ftcdn.net/jpg/03/48/39/74/360_F_348397404_wXuf22GUPNAh67htBZZnaDSx3Bj92yep.jpg",

            ),
          ),
          
        ),child: BackdropFilter(filter:  ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0), child:new Container(
            decoration: new BoxDecoration(color: Colors.white.withOpacity(0.0)),
          ),),
      ),
    );
  }
}
