
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:projectq_app/Constants/APIs.dart';
import 'package:projectq_app/Data/ResponseData.dart';
import 'package:projectq_app/Model/JoinQueueModel.dart';
import 'package:projectq_app/Model/ResponseModel.dart';
import 'package:projectq_app/Utils/AlertDialogs.dart';
import 'package:projectq_app/Utils/Navigators.dart';
import 'package:quiver/strings.dart';
import 'package:http/http.dart'as Client;

class JoinQueueBackend {

  var response;

  Future<void> joinQueueRequest(BuildContext context, String sessionKey ) async{
    final url = http+baseUrl+joinPath+ "$sessionKey";
    print(url);

    var resp;

    try {
      response = await Client.post(
        url,
        headers: {
          HttpHeaders.contentTypeHeader: 'application/json',

        },
      );

      print(response.body.toString());
    } on Exception catch (e) {

      print(e.toString());
    }

    if(response.statusCode==200){
      resp = jsonDecode(response.body);
      ResponseData.responseModel = ResponseModel.fromJson(resp);

      if(equalsIgnoreCase("200", ResponseData.responseModel.status.toString())){
        ResponseData.joinQueueResponse = JoinQueueModel.fromJson(ResponseData.responseModel.data);
        successAlertDialog(context, ResponseData.responseModel.message);
        //navigatePush(context, );
      }

    }


  }




}