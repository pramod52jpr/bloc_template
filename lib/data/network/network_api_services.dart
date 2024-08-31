import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:bloc_template/data/exceptions/app_exceptions.dart';
import 'package:bloc_template/data/network/base_api_services.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class NetworkApiServices extends BaseApiServices{
  @override
  Future getRequest(String url) async{
    print("the main url is : $url");
    try{
      http.Response response = await http.get(Uri.parse(url)).timeout(Duration(seconds: 60));
      return returnResponse(response);
    }on SocketException{
      throw const NoInternetException("");
    }on TimeoutException{
      throw const FetchDataException("");
    }
  }

  @override
  Future postRequest(String url, var data) async{
    if(kDebugMode){
      print(url);
      print(data);
    }
    try{
      http.Response response = await http.post(Uri.parse(url), body: data).timeout(Duration(seconds: 60));
      if(kDebugMode){
        print(jsonDecode(response.body));
      }
      return returnResponse(response);
    }on SocketException{
      throw const NoInternetException("");
    }on TimeoutException{
      throw const FetchDataException("");
    }
  }

  dynamic returnResponse(http.Response response){
    switch(response.statusCode){
      case 200:
        return jsonDecode(response.body);
      case 201:
        return jsonDecode(response.body);
      case 400 :
        return jsonDecode(response.body);
      case 401 :
        return const UnauthorisedException("ok");
      case 500:
        return FetchDataException("Error communicating with server ${response.statusCode}");
    }
  }

}