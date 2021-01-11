import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

Map data = {};

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty ? data : ModalRoute.of(context).settings.arguments;
    String bgimg;
    Color txtclr;
    Color desclr;
    if (data['isDay'] == true) {
      bgimg = 'morning.jpg';
      txtclr = Colors.black;
      desclr=Colors.white;
    } else if (data['isEvening'] == true) {
      bgimg = 'evening.jpg';
      txtclr = Colors.white;
      desclr=Colors.black;
    } else {
      bgimg = 'night.jpg';
      txtclr = Colors.white;
      desclr=Colors.amber;
    }



    print(data);
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage('lib/asset/$bgimg'),
          fit: BoxFit.fill,
        )),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0.0, 150.0, 0.0, 100),
          child: Center(
            child: Container(
              child: Column(
                children: [
                  FlatButton.icon(
                      onPressed: () async {
                        dynamic result =
                            await Navigator.pushNamed(context, '/location');
                        setState(() {
                          data = {
                            'time': result['time'],
                            'location': result['location'],
                            'flag': result['flag'],
                            'isDay': result['isDay'],
                            'isEvening': result['isEvening'],
                            'isNight': result['isNight'],
                            'temp': result['temp'],
                            'desc':result['desc'],
                          };
                        });
                      },
                      icon: Icon(
                        Icons.location_on,
                        color: txtclr,
                      ),
                      label: Text(
                        "Choose Location",
                        style: TextStyle(
                          color: txtclr,
                        ),
                      )),
                  SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        data["location"],
                        style: TextStyle(
                          letterSpacing: 2.0,
                          fontSize: 25.0,
                          color: txtclr,
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 40.0,
                  ),
                  Text(
                    data["time"],
                    style: TextStyle(
                      fontSize: 80.0,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2.0,
                      color: txtclr,
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
//
                      RichText(
                        text: TextSpan(
                          text: 'Temprature is:  ',
                          style: TextStyle(
                            fontSize: 30.0,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 2.0,
                            color: txtclr,
                          ),
                          children: <TextSpan>[
                            TextSpan(
                                text: data["temp"],
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            TextSpan(
                                text: "\u2103",
                                style: TextStyle(fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 30),
                  Text(
                    data["desc"],
                    style: TextStyle(
                      fontSize: 20.0,
fontWeight: FontWeight.bold,
                      fontFamily: "Roboto",
                      letterSpacing: 2.0,
                      color:desclr,
                    ),

                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
