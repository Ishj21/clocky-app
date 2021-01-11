import 'package:clocky/services/clockify.dart';
import 'package:flutter/material.dart';

class Location extends StatefulWidget {
  @override
  _LocationState createState() => _LocationState();
}

class _LocationState extends State<Location> {


  List<Clockify> locations = [
  Clockify(url: 'Asia/Kolkata',location: 'Kolkata',flag: 'india.png',weatherUrl: 'Kolkata'),
    Clockify(url: 'Europe/London', location: 'London', flag: 'uk.png',weatherUrl:'London' ),
    Clockify(url: 'Europe/Athens', location: 'Athens', flag: 'greece.png',weatherUrl:'Athens'),
    Clockify(url: 'Africa/Cairo', location: 'Cairo', flag: 'egypt.png',weatherUrl: 'Cairo'),
    Clockify(url: 'Africa/Nairobi', location: 'Nairobi', flag: 'kenya.png',weatherUrl: 'Nairobi'),
    Clockify(url: 'America/Chicago', location: 'Chicago', flag: 'usa.png',weatherUrl: 'Chicago'),
    Clockify(url: 'America/New_York', location: 'New York', flag: 'usa.png',weatherUrl: "New+York"),
    Clockify(url: 'Asia/Seoul', location: 'Seoul', flag: 'south_korea.png',weatherUrl: 'Seoul'),
    Clockify(url: 'Asia/Jakarta', location: 'Jakarta', flag: 'indonesia.png',weatherUrl: 'Jakarta'),
    Clockify(url: 'America/Argentina/Buenos_Aires',location: 'Buenos Aires',flag: 'argentina.png',weatherUrl: 'Buenos+Aires')


  ];

  void updateTime(index) async{
    Clockify instance=locations[index];
    await instance.getTime();
    await instance.getTemp();

    Navigator.pop(context,{
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDay': instance.isDay,
      'isEvening': instance.isEvening,
      'isNight': instance.isNight,
      'temp':instance.temp,
      'desc':instance.desc,
    });


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text( "Choose Location") ,
        backgroundColor: Colors.blue[900],
      ),
      body:
      SafeArea(child: ListView.builder(
          itemCount: locations.length,
          itemBuilder:(context,index){
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0,horizontal: 5.0),
                  child: ListTile(
                    onTap: (){
                      updateTime(index);
                    },
                    title: Text(locations[index].location),
                  leading: CircleAvatar(
                    backgroundImage: AssetImage('lib/asset/${locations[index].flag}'),
                  ),
                  ),
                ),



              ),
            );

          } )),


    );;
  }
}
