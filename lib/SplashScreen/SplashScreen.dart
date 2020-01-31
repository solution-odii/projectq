
import 'package:flutter/material.dart';
import 'package:projectq_app/Constants/AppColors.dart';
import 'package:projectq_app/Constants/AssetStrings.dart';
import 'package:projectq_app/Constants/Strings.dart';
import 'package:projectq_app/ScanScreen/ScanScreen.dart';
import 'package:projectq_app/Utils/Navigators.dart';
import 'package:projectq_app/Utils/Styles.dart';

class SplashScreen extends StatefulWidget {

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
//  static Animation<double> animation;
//  Animation<double> animationTurns = Tween<double>(begin: 0, end: 0.5).animate(animation);
  @override
  void initState() {

    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [Colors.white, AppColors.color1], begin: Alignment.center, end: Alignment.bottomCenter)

          ),
          child: Center(
            child: ListView(
              shrinkWrap: true,
              children: <Widget>[
                Image.asset(appLogo, height: 300, width: 150,),

                 Padding(
                   padding: const EdgeInsets.all(16.0),
                   child: Center(
                       child: MaterialButton(
                         shape: RoundedRectangleBorder(
                           borderRadius: BorderRadius.all(Radius.circular(10.0)),
                         ),
                         color: AppColors.color2,
                         onPressed: (){
                           navigatePush(context, ScanScreen());
                         },
                         child: Text(joinQ, style: textStyleBigBoldWhite),),
                   ),
                 ),

              ],

            ),
          ),
        )

    );
  }
}

