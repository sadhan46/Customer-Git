import 'dart:async';

import 'package:customer1/Database/database.dart';
import 'package:customer1/Home.dart';
import 'package:customer1/Model/appointment.dart';
import 'package:customer1/Models/BusinessListModel.dart';
import 'package:customer1/Models/ServiceModel.dart';
import 'package:flutter/cupertino.dart';
//import 'package:customer1/Models/ProfileModel.dart';
import 'package:flutter/material.dart';
import 'package:customer1/Network_handler.dart';
import 'package:flutter/widgets.dart';

class Appointments extends StatefulWidget {
  @override
  _AppointmentsState createState() => new _AppointmentsState();
}

class _AppointmentsState extends State<Appointments> {
  NetworkHandler networkHandler = NetworkHandler();
  final _debouncer = Debouncer(milliseconds: 500);
  Widget appBarTitle = new Text("Appointments");
  Icon actionIcon = new Icon(Icons.search);
  //BusinessModel profileModel = BusinessModel();
  Future<List<Appointment>> _Appointment;


  @override
  void initState() {
    super.initState();
    _getAppointmentList();
  }

  _getAppointmentList(){
    setState(() {
      _Appointment = DatabaseHelper.instance.getAppointmentList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: Color(0xff1C396D),
          //centerTitle: true,
          title:Image.asset('assets/shoptree_admin.png',height: 40),
        automaticallyImplyLeading: false,
      ),
      body:  FutureBuilder(
          future: _Appointment,
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            return snapshot.data.length == 0? Center(child: Text("No Appointments")):ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, index) {
             return   InkWell(
                  child: Card(
                    child: Container(
                      padding: EdgeInsets.fromLTRB(12,8,12,8),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(snapshot.data[index].appointmentDate,style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20,)),
                              Divider(height: 3.0,),
                              Text(snapshot.data[index].appointmentTime,style: TextStyle(fontSize: 16,)),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(snapshot.data[index].businessName,style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18,)),
                              Divider(height: 3.0,),
                              SelectableText(snapshot.data[index].mobileNumber,style: TextStyle(fontSize: 16,)),
                            ],
                          ),
                          RichText(text: TextSpan(
                              children: <TextSpan>[
                                TextSpan(text:"₹",
                                    style: TextStyle(
                                        fontSize: 26.0,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w500,
                                        decoration: TextDecoration.none)),
                                TextSpan(text:snapshot.data[index].total,
                                    style: TextStyle(
                                        fontSize: 23.0,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w500,
                                        decoration: TextDecoration.none)),
                              ]
                          ),

                          )
                        ],
                      ),
                    ),
                  ),
                  onTap:(){
                    customerInfoDialog(context,snapshot.data[index].businessName,
                      snapshot.data[index].customerName,
                      snapshot.data[index].mobileNumber,
                      snapshot.data[index].services,
                      snapshot.data[index].appointmentTime,
                      snapshot.data[index].appointmentDate,
                      snapshot.data[index].totalTime,
                      snapshot.data[index].total,
                    );
                  } ,
                );
                },

            );
          }
      ));
  }
}

customerInfoDialog(BuildContext context ,final String businessName,
    final String customerName,
    final String mobileNumber,
    final String services,
    final String appointmentTime,
    final String appointmentDate,
    final String totalTime,
    final String total,) => showDialog(
    context: context,
    builder: (context) => AlertDialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.0))
      ),
      titlePadding: EdgeInsets.all(0),
      contentPadding: EdgeInsets.fromLTRB(0, 0, 5, 0),
      title: Container(
        decoration: BoxDecoration(
          boxShadow: [BoxShadow(
            color: Colors.grey,
            blurRadius: 5.0,
          ),],
          shape: BoxShape.rectangle,
          color: Color(0xff1C396D),
          borderRadius:
          new BorderRadius.only(topLeft: Radius.circular(20.0),topRight: Radius.circular(20.0)),
        ),
        height: 50,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(8,8,8,0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //Divider(height: 14,),
                  Text(businessName,
                      style: TextStyle(
                          fontSize: 17.0,
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                          decoration: TextDecoration.none)),
                  Text("$appointmentDate • $appointmentTime",
                      style: TextStyle(
                          fontSize: 14.0,
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                          decoration: TextDecoration.none)),
                ],
              ),
              RichText(text: TextSpan(
              children: <TextSpan>[
                TextSpan(text:"₹",
                    style: TextStyle(
                        fontSize: 23.0,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        decoration: TextDecoration.none)),
                TextSpan(text: total,
                    style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        decoration: TextDecoration.none)),
              ]
          ),)
            ],
          ),
        ),
      ),
      content: Container(
        padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Divider(height: 2.5,),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Name",style: TextStyle(
                    fontSize: 17.0,
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                    decoration: TextDecoration.none)),
                Text(customerName,style: TextStyle(
                    fontSize: 17.0,
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    decoration: TextDecoration.none)),
              ],
            ),
            Divider(height: 5,),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Service Count",style: TextStyle(
                    fontSize: 17.0,
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                    decoration: TextDecoration.none)),
                Text(services,style: TextStyle(
                fontSize: 17.0,
                color: Colors.black,
                fontWeight: FontWeight.w400,
                    decoration: TextDecoration.none)),
              ],
            ),
            Divider(height: 5,),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Total time",style: TextStyle(
                    fontSize: 17.0,
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                    decoration: TextDecoration.none)),
                Text(totalTime,style: TextStyle(
                    fontSize: 17.0,
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                    decoration: TextDecoration.none)),
              ],
            ),
            Divider(height: 5,),
            /*        ListView.builder(
              itemBuilder: (context, index) {
                int price = int.parse(cartProduct[index].serviceCost);
                int counter = cartProduct[index].counter;
                int tileCost = price*counter;
                return Column(
                  children: [
                    Container(
                      padding: EdgeInsets.fromLTRB(0, 8, 0, 8),
                      child: ListTile(
                        title: Text(
                          "${cartProduct[index].serviceName}",
                          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20,),
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "${cartProduct[index].hr}Hr ${cartProduct[index].min}min",
                              style: TextStyle(fontSize: 16,fontWeight:FontWeight.w300,color: Colors.black),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Row(
                                  children: [

                                    Container(
                                      padding: EdgeInsets.only(top: 3.0),
                                      child: Text("₹ ",
                                          style: TextStyle(
                                              fontSize: 15.0,
                                              color: Colors.black,
                                              fontWeight: FontWeight.w400,
                                              decoration: TextDecoration.none)),
                                    ),
                                    Text("${cartProduct[index].serviceCost} x ${cartProduct[index].counter}",
                                        style: TextStyle(
                                            fontSize: 18.0,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w400,
                                            decoration: TextDecoration.none)),
                                  ],
                                ),

                                Container(
                                  child: Row(
                                    children: [
                                      Container(
                                        padding: EdgeInsets.only(top: 3.0),
                                        child: Text("${cartProduct[index].currency} ",
                                            style: TextStyle(
                                                fontSize: 15.0,
                                                color: Colors.black,
                                                fontWeight: FontWeight.w400,
                                                decoration: TextDecoration.none)),
                                      ),
                                      Text("$tileCost",
                                          style: TextStyle(
                                              fontSize: 18.0,
                                              color: Colors.black,
                                              fontWeight: FontWeight.w400,
                                              decoration: TextDecoration.none))

                                    ],
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    Container(
                      height: 2,
                      color: Color(0xff1C396D).withOpacity(0.05),
                    )
                  ],
                );

              },
              itemCount: cartProduct.length,
              shrinkWrap: true,
            ),
*/
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Total Amount"),

                RichText(text: TextSpan(
                    children: <TextSpan>[
                      TextSpan(text:"₹",
                          style: TextStyle(
                              fontSize: 20.0,
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                              decoration: TextDecoration.none)),
                      TextSpan(text:total,
                          style: TextStyle(
                              fontSize: 17.0,
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                              decoration: TextDecoration.none)),
                    ]
                ),

                )
              ],
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          child: Text('Ok'),
          onPressed: () => Navigator.of(context).pop(),
        )
      ],
    ));

class Debouncer {
  final int milliseconds;
  VoidCallback action;
  Timer _timer;

  Debouncer({this.milliseconds});

  run(VoidCallback action) {
    if (null != _timer) {
      _timer.cancel();
    }
    _timer = Timer(Duration(milliseconds: milliseconds), action);
  }
}