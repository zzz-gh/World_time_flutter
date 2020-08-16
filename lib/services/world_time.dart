import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime{
  String location;//location name for that UI
  String time;//the time in that location
  String url;//url to asset for that icon
  String flag;//location url for an API endpoint
  bool isDayTime;

  WorldTime({this.location,this.flag,this.url});

  Future<void> getTime() async{

    try{
      Response response = await get('http://worldtimeapi.org/api/timezone/$url');
      //print(response.body);
      Map data = jsonDecode(response.body);
      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(1,3);
      //print(datetime);
      //print(offset);
      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));

      isDayTime = now.hour>5 && now.hour<20 ? true : false;
      time = DateFormat.jm().format(now);
    }catch(e){
      print('caught error:$e');
      time ='could not get data from map';
    }
    //get request time


  }
}

