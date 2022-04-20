import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:world_location/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


class Loading extends StatefulWidget {

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading>{
  // String time='loading';

  void setupWorldTime() async {
    WorldTime instance = WorldTime(location: 'Berlin', flag: 'germany.png', url: 'Europe/Berlin');
    await instance.getTime();//get time function in world-time class
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDayTime': instance.isDayTime,
    });
    print('is day time var at loading class');
    print(instance.isDayTime);
    print(' time var at loading class');

    print(instance.time);
  }


 @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setupWorldTime();
   // print('hi there');
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
        body:Center(
          child:SpinKitHourGlass(
            color:Colors.white,
            size:60.0,
          )
        ),

            
    );
  }
}
