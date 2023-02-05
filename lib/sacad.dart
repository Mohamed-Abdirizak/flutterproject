import 'package:analog_clock/analog_clock.dart';
import 'package:flutter/material.dart';


class saacd extends StatefulWidget {
    static const String id = 'sacad';
String wadan;
String am_0r_pm;
int hour;
int miniutes;

saacd({required this.wadan,required this.hour ,required this.miniutes,required this.am_0r_pm});

  @override
  State<saacd> createState() => _saacdState();
}

class _saacdState extends State<saacd> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Clock of ${widget.wadan}'),),
      body: Column(
         mainAxisAlignment: MainAxisAlignment.center,
        children: [

        SizedBox(height: 20,),
        Container(
          height: 360,width: 400,
          child: AnalogClock(
                  decoration: BoxDecoration(
                      border: Border.all(width: 2.0, color: Colors.black),
                      color: Colors.transparent,
                      shape: BoxShape.circle),
                  width: 150.0,
                  isLive: true,
                  hourHandColor: Colors.black,
                  minuteHandColor: Colors.black,
                  showSecondHand: true,
                  numberColor: Colors.black87,
                  showNumbers: true,
                  showAllNumbers: true,
                  textScaleFactor: 1.4,
                  showTicks: true,
                  showDigitalClock: true,
                  digitalClockColor: Colors.teal,
                  // datetime: DateTime.now(),
                  datetime: DateTime(2023, 1, 1, widget.hour, widget.miniutes)
                ),
        ),

         SizedBox(height: 20,),

        //  Text('The Time is ${widget.hour}:${widget.miniutes} ${widget.am_0r_pm}',style: TextStyle(fontSize: 20),)    
    ]),);
  }
}