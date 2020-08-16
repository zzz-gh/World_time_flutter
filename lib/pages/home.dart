import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};
  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty? data : ModalRoute.of(context).settings.arguments;
    print(data);

    String _bgImage = data['isDayTime'] ? 'day.png' : 'night.png';
    Color _bgColor = data['isDayTime'] ? Colors.lightBlue : Colors.indigo[900];
    return Scaffold(
      backgroundColor: _bgColor,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/$_bgImage'),
              fit: BoxFit.cover,
            )
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 125.0, 0, 0),
            child: Column(
              children: <Widget>[
                FlatButton.icon(
                  onPressed: () async{
                    dynamic result = await Navigator.pushNamed(context, '/location');
                    setState(() {
                      data = {
                        'location' : result['location'],
                        'flag': result['flag'],
                        'isDayTime': result['isDayTime'],
                        'time': result['time'],
                      };
                    },);
                  },
                  icon: Icon(
                      Icons.edit_location,
                    color: Colors.white,
                  ),
                  label: Text(
                      'Edit Location',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),

                ),
                SizedBox(
                  height: 20.0,
                ),
                Row(
                  mainAxisAlignment:MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      data['location'],
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 3.0
                      ),
                    ),

                  ],
                ),
                SizedBox(
                  height: 45.0,
                ),
                Text(
                  data['time'],
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 66.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),

      ),
    );
  }
}
