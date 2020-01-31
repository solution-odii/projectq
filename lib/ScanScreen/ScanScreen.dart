import 'dart:async';

import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:projectq_app/Constants/AppColors.dart';
import 'package:projectq_app/Constants/AssetStrings.dart';
import 'package:projectq_app/Constants/Strings.dart';
import 'package:projectq_app/ScanScreen/SuccessScreen.dart';
import 'package:projectq_app/Utils/Navigators.dart';
import 'package:projectq_app/Utils/Styles.dart';

class ScanScreen extends StatefulWidget {
  @override
  _ScanState createState() => new _ScanState();
}

class _ScanState extends State<ScanScreen> {
  String barcode = "";

  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.white, AppColors.color1],
                begin: Alignment.center,
                end: Alignment.bottomCenter)),
        child: new Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SizedBox(
              height: 60,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Text(
                tapToScan,
                textAlign: TextAlign.center,
                style: textStyleBigBold,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            InkWell(
                onTap: () {
                  scan();
                },
                child: Image.asset(
                  scanImage,
                  height: 250,
                  width: 150,
                )),
//            Padding(
//              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
//              child: Text(
//                barcode,
//                textAlign: TextAlign.center,
//              ),
//            ),
          ],
        ),
      ),
    );
  }

  Future scan() async {
    try {
      String barcode = await BarcodeScanner.scan();
      setState(() => this.barcode = barcode);
      navigatePush(context, SuccessScreen(barcode));
    } on PlatformException catch (e) {
      if (e.code == BarcodeScanner.CameraAccessDenied) {
        setState(() {
          this.barcode = 'The user did not grant the camera permission!';
        });
      } else {
        setState(() => this.barcode = 'Unknown error: $e');
      }
    } on FormatException {
      setState(() => this.barcode =
          'null (User returned using the "back"-button before scanning anything. Result)');
    } catch (e) {
      setState(() => this.barcode = 'Unknown error: $e');
    }
  }
}
