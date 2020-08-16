import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:worldtime/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {


  @override
  Widget build(BuildContext context) {

    List<WorldTime> locations = [
      WorldTime(url:'Europe/London',location: 'London',flag: 'uk.png'),
      WorldTime(url:'Europe/Berlin',location: 'Athens',flag: 'greece.png'),
      WorldTime(url:'Africa/Cairo',location: 'Cairo',flag: 'egypt.png'),
      WorldTime(url:'Africa/Nairobi',location: 'Nairobi',flag: 'kenya.png'),
      WorldTime(url:'America/Chicago',location: 'Chicago',flag: 'usa.png'),
      WorldTime(url:'America/New_York',location: 'New York',flag: 'germany.png'),
      WorldTime(url:'Asia/Seoul',location: 'Seoul',flag: 'south_korea.png'),
      WorldTime(url:'Asia/Jakarta',location: 'Jakarta',flag: 'indonesia.png'),
      WorldTime(url:'Asia/Yangon',location: 'Yangon',flag: 'myanmar.webp'),
      WorldTime(url:'Asia/Singapore',location: 'Singapore',flag: 'singapore.webp'),
    ];

    void upDatetime(index) async{
      WorldTime instance = locations[index];
      await instance.getTime();
      Navigator.pop(context,{
        'location' : instance.location,
        'flag': instance.flag,
        'time': instance.time,
        'isDayTime':instance.isDayTime,
      },);
    }
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('Choose Location'),
        centerTitle: true,
        elevation: 0,

      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context,index){
          return Card(
            child: ListTile(
              onTap: (){
                upDatetime(index);
              },
              leading: CircleAvatar(
                backgroundImage: AssetImage('assets/${locations[index].flag}'),
              ),
              title: Text(locations[index].location),
            ),
          );
        },
      ),
    );
  }
}
