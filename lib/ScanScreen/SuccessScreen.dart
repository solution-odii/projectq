import 'package:flutter/material.dart';
import 'package:projectq_app/Backend/JoinQueueBackend.dart';
import 'package:projectq_app/Constants/AppColors.dart';
import 'package:projectq_app/Constants/AssetStrings.dart';
import 'package:projectq_app/Constants/Strings.dart';
import 'package:projectq_app/Utils/Styles.dart';

class SuccessScreen extends StatefulWidget {
  final String uniqueID;

  SuccessScreen(this.uniqueID);

  @override
  _SuccessScreenState createState() => _SuccessScreenState();
}

class _SuccessScreenState extends State<SuccessScreen> {
  bool isLoading = false;

  Future<void> _submit() async {



      setState(() {
        isLoading = true;
      });

      await JoinQueueBackend().joinQueueRequest(context, widget.uniqueID);


      setState(() {
        isLoading = false;
      });

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
                end: Alignment.bottomCenter),
        ),
        child: new Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SizedBox(
              height: 60,
            ),

            Image.asset(successImage, height: 150, width: 100,),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Text(yourIdIs, textAlign: TextAlign.center, style: textStyleBigMedium,),
            ),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Text(widget.uniqueID.toString().toUpperCase(), textAlign: TextAlign.center, style: textStyleBigBold,),
            ),

            SizedBox(
              height: 20,
            ),



            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Text(attendQuest, textAlign: TextAlign.center,),
            ),


            SizedBox(
              height: 10,
            ),

            isLoading
                ? Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: CircularProgressIndicator(
              backgroundColor: AppColors.color2,
              valueColor: new AlwaysStoppedAnimation(AppColors.color1),
            ),
                )
                :
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                MaterialButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                  color: AppColors.color4,
                  onPressed: (){
                    _submit();
                  },
                  child: Text(yes, style: textStyleBigBoldWhite),),

                SizedBox(
                  width: 30,
                ),
                MaterialButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                  color: AppColors.color2,
                  onPressed: (){

                  },
                  child: Text(no, style: textStyleBigBoldWhite),),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
