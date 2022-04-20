
import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime{
  String location;
  String flag;
  String url;
 String  time='';
 bool isDayTime=true;

 WorldTime({
 required this.flag,
 required this.location,
 required this.url});

  Future<void> getTime()async{
    try{
     // data was collected from loading class
      Response response = await get(Uri.parse('http://worldtimeapi.org/api/timezone/$url'));
                                             //  http://worldtimeapi.org/api/timezone/
    //  Response response= await get('http://worldtimeapi.org/api/timezone/'));
    Map data=jsonDecode(response.body);
    print(response.body);

    String dateTime=data['datetime'];
    String offset=data['utc_offset'].substring(1,3);

    DateTime now=DateTime.parse(dateTime);
    now =now.add(Duration(hours: int.parse(offset)));
    //print(data['title']);
    // time=now.toString();
    isDayTime=now.hour >6 && now.hour<20? true: false;
    print('is day time  var at world time class');
    print(isDayTime);
      time=DateFormat.jm().format(now);
      print(' time var at world time  class');

      print( time);

      // response.body.userID?is not work
      // String username =await Future.delayed(Duration(seconds:3),(){return 'yoshi';});
      // String bio =await Future.delayed(Duration(seconds:2),(){return 'egg collector ,vega,musician';});
//print('$username-$bio');
    }
    catch(e){
    print('caught error:$e');
    time='could not get time date';

  }

}}