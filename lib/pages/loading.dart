
import 'package:clocky/services/clockify.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {


  void setupWorldTime() async {
    Clockify instance =
        Clockify(location: 'Kolkata', flag: 'germany.png', url: 'Asia/Kolkata',weatherUrl: 'Kolkata');
    await instance.getTime();
    await instance.getTemp();
    Navigator.pushReplacementNamed(context, '/home',
        arguments: ({
          'location': instance.location,
          'flag': instance.flag,
          'time': instance.time,
          'isDay': instance.isDay,
          'isEvening': instance.isEvening,
          'isNight': instance.isNight,
          'temp':instance.temp,
          'desc':instance.desc,
        }));


  }




  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setupWorldTime();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: Center(
        child: SpinKitChasingDots(
          color: Colors.white,
          size: 80.0,
        ),
      ),
    );
  }
}


