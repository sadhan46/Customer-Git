import 'package:flutter/material.dart';
import 'dart:io';

class Timex extends StatefulWidget {
  const Timex({Key key}) : super(key: key);

  @override
  _TimexState createState() => _TimexState();
}

class _TimexState extends State<Timex> {
  var xtime= DateTime(0,0,0,12,45);
  var ytime= DateTime(0,0,0,0,15);

  List<String> name = ["haircut","Hairwash"];
  List<String> time = ["1 Hr 20 min","2 Hr 30 min"];
  List<String> cost = ["₹ 150","₹ 200"];


  @override
  Widget build(BuildContext context) {
    Duration subtract = xtime.difference(ytime);
   return Scaffold(
      body:
      Container(
        child: ListView.builder(
          itemBuilder: (context, index) {

            return
                Container(
                  padding: EdgeInsets.fromLTRB(15, 8, 15, 8),
                  child: ListTile(
                    title: Text("${name[index]}",
                        style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20,)),
                    subtitle: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        Text("${time[index]}",style: TextStyle(fontSize: 16,fontWeight:FontWeight.w300,color: Colors.black)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text("${cost[index]}",style: TextStyle(fontSize: 18,
                                fontWeight:FontWeight.w400,color: Colors.black)),
                            Container(
                              height: 20,
                              child: OutlinedButton(
                                  onPressed: () { },
                                  style: OutlinedButton.styleFrom(
                                    side: BorderSide(color: Colors.blue),
                                  ),
                                  //color: Colors.blueAccent,
                                  //disabledBorderColor: Colors.blueAccent,
                                  child: Text("ADD +",
                                    style: TextStyle(
                                        color: Colors.blue,
                                        fontSize: 16,
                                        fontWeight: FontWeight.normal),
                                  )),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                );
          },
          itemCount:2,
          shrinkWrap: true,
        ),


      )
    );
  }
}
