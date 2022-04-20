import 'package:flutter/material.dart';
class Home extends StatefulWidget {

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data={};

  initState(){
    super.initState();
    print('init function ran once this class initalized ');
  }
  @override
  Widget build(BuildContext context) {
    print('build function ran once this class initalized ');

          data = data.isNotEmpty ? data :ModalRoute.of(context)!.settings.arguments as Map;
          print('is day time from home class');
    print(data['isDayTime']);
    print(data['location']);

          String bgimage=data['isDayTime']?'sunshieday.png':'nightday.png';
          Color bgColor=data['isDayTime']?Colors.blue:Colors.indigo;
    return Scaffold(
backgroundColor: bgColor,
      body: SafeArea(
          child:Container(
            decoration: BoxDecoration(
              image:DecorationImage(
                image:AssetImage('assets/$bgimage'),
                fit:BoxFit.cover,
              )
            ),

          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 120, 0, 0),
                child: Column(children: <Widget>[
    TextButton.icon(
        onPressed: ()async{
        dynamic result=await  Navigator.pushNamed(context, '/location');
        setState(() {
          data = {
            'time': result['time'],
            'location': result['location'],
            'isDayTime': result['isDayTime'],
            'flag': result['flag']
          };
        });
    },
    icon:Icon(Icons.edit_location),
    label:Text('Edit_Location',
    style: TextStyle(color: Colors.grey[300]),)),
                  SizedBox(height:20.0,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(data['location'],
                      style: TextStyle(
                        fontSize: 28.0,
                      letterSpacing: 2.0,
                      color: Colors.white,
                      ),),

                    ],
                  ),
                  SizedBox(height:20.0),
                  Text(
                    data['time'],
                    style: TextStyle
                      (
                      fontSize: 66.0,
                      color: Colors.white,
                    ),
                  )
                ],),
              ),))

    );
  }
}
